part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {}

class LoginFailed extends LoginState {
  String errorMessage;
  LoginFailed({required this.errorMessage});
}
