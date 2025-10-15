part of 'sigin_cubit.dart';

sealed class SiginState {}

final class SiginInitial extends SiginState {}

final class SiginLoading extends SiginState {}

final class SiginSuccess extends SiginState {
  final UserEntity user;

  SiginSuccess({required this.user});
}

final class SiginFailure extends SiginState {
  final String message;

  SiginFailure({required this.message});
}
