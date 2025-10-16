import 'package:dartz/dartz.dart';
import 'package:fruits_store/core/errors/failures.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String name,
  });

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures, UserEntity>> signinwithGoogle();

  Future<Either<Failures, UserEntity>> signinWithFacebook();

  Future addUserData({required UserEntity user});

  Future saveUserDataLocally({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});
}
