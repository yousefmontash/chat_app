part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSucceed extends AuthState {}

class LoginFailed extends AuthState {
  String errorMessage;
  LoginFailed({required this.errorMessage});
}
class SignupInitial extends AuthState {}

class SignupLoading extends AuthState {}

class SignupSucceed extends AuthState {}

class SignupFailed extends AuthState {
  String errorMessage;
  SignupFailed({required this.errorMessage});
}
