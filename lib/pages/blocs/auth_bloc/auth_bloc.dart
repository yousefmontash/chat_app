import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if(event is loginEvent)  {
        emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
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
      if (event is signupEvent)  {
        emit(SignupLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
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
    });
  }
}
