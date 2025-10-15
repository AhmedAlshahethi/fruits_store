import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_store/core/errors/exceptions.dart';

import 'package:fruits_store/core/errors/failures.dart';
import 'package:fruits_store/core/services/firebase_auth_service.dart';
import 'package:fruits_store/features/auth/data/models/user_model.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebase(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
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
      return right(UserModel.fromFirebase(user));
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
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebase(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Excpetion in AuthRepoImp - signInWithGoogle : ${e.toString()}");
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebase(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Excpetion in AuthRepoImp - signInWithFacebook : ${e.toString()}");
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }
}
