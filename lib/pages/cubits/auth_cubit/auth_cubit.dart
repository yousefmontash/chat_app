import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


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




  Future<void> signupUser(String email, String password) async {
    emit(SignupLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignupSucceed());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailed(errorMessage: "The password provided is too weak."));
        
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailed(
            errorMessage: "The account already exists for that email."));
        
      }
    } catch (e) {
      emit(SignupFailed(errorMessage: "error occured"));
      
    }
  }
}
