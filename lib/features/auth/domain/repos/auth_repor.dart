import 'package:dartz/dartz.dart';
import 'package:fruits_store/core/errors/failures.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String name,
  });
}
