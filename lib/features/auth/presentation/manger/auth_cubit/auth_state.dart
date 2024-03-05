part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String err;

  const AuthFailure({required this.err});
}

class AuthSccuess extends AuthState {}

class SignUPLoading extends AuthState {}

class SignUPFailure extends AuthState {
  final String err;

  SignUPFailure({required this.err});
}

class SignUPSccuess extends AuthState {}

class GoogleLoading extends AuthState {}

class GoogleFailure extends AuthState {
  final String err;

  const GoogleFailure(this.err);
}

class GoogleSccuess extends AuthState {}
