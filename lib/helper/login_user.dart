import 'package:firebase_auth/firebase_auth.dart';

Future<void> LoginUser(String email, String password) async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}
