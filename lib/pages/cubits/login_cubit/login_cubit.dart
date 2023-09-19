import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSucceed());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailed(errorMessage: "No user found for that email."));
        // ShowSnackBar(
        //     context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        emit(LoginFailed(errorMessage: "Wrong password provided for that user."));
        // ShowSnackBar(context,
        //     "Wrong password provided for that user.");
      } else {
        emit(LoginFailed(errorMessage: "there's an error"));
        // ShowSnackBar(context, "there's an error");
      }
    }
  }
}
