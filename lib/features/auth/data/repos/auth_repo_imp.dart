import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/errors/exceptions.dart';

import 'package:fruits_store/core/errors/failures.dart';
import 'package:fruits_store/core/services/data_service.dart';
import 'package:fruits_store/core/services/firebase_auth_service.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/core/utils/bakend_endpoints.dart';
import 'package:fruits_store/features/auth/data/models/user_model.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataService dataService;

  AuthRepoImp({required this.firebaseAuthService, required this.dataService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebase(user);
      await addUserData(
        user: UserEntity(name: name ?? '', email: email, uId: user.uid),
      );
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log(
        "Excpetion in AuthRepoImp - createUserWithEmailAndPassword : ${e.toString()}",
      );
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      await saveUserDataLocally(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        "Excpetion in AuthRepoImp - signInWithEmailAndPassword : ${e.toString()}",
      );
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinwithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExists = await dataService.checkDocumentExists(
        path: BakendEndpoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log("Excpetion in AuthRepoImp - signInWithGoogle : ${e.toString()}");
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExists = await dataService.checkDocumentExists(
        path: BakendEndpoints.isUserExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log("Excpetion in AuthRepoImp - signInWithFacebook : ${e.toString()}");
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    var userModel = UserModel.fromUserEntity(user);
    await dataService.addData(
      path: BakendEndpoints.addUserData,
      data: userModel.tomap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await dataService.getData(
      path: BakendEndpoints.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future saveUserDataLocally({required UserEntity user}) async {
    var userData = jsonEncode(UserModel.fromUserEntity(user).tomap());
    await Prefs.setString(kUserData, userData);
  }
}
