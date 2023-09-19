part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucceed extends SignupState {}

class SignupFailed extends SignupState {
  String errorMessage;
  SignupFailed({required this.errorMessage});
}
