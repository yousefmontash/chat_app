part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class loginEvent extends AuthEvent {
  final String email, password;

  loginEvent({required this.email, required this.password});
}

class signupEvent extends AuthEvent {
  final String email, password;

  signupEvent({required this.email, required this.password});
}
