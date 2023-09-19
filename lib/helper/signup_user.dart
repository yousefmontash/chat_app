import 'package:firebase_auth/firebase_auth.dart';

Future<void> signupUser(String email, String password) async {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}
