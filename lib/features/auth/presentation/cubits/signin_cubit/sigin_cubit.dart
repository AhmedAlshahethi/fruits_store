import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';

part 'sigin_state.dart';

class SiginCubit extends Cubit<SiginState> {
  SiginCubit(this.authRepo) : super(SiginInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SiginLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SiginFailure(message: failure.message)),
      (userEntity) => emit(SiginSuccess(user: userEntity)),
    );
  }

  Future<void> signinwithGoogle() async {
    emit(SiginLoading());
    final result = await authRepo.signinwithGoogle();
    result.fold(
      (failure) => emit(SiginFailure(message: failure.message)),
      (userEntity) => emit(SiginSuccess(user: userEntity)),
    );
  }

  Future<void> signinWithFacebook() async {
    emit(SiginLoading());
    final result = await authRepo.signinWithFacebook();
    result.fold(
      (failure) => emit(SiginFailure(message: failure.message)),
      (userEntity) => emit(SiginSuccess(user: userEntity)),
    );
  }
}
