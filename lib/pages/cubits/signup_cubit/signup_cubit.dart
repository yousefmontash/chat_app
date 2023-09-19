import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

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
