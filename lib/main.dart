import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_one/firebase_options.dart';
import 'package:new_one/pages/blocs/auth_bloc/auth_bloc.dart';
import 'package:new_one/pages/chat_page.dart';
import 'package:new_one/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:new_one/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:new_one/pages/login_page.dart';
import 'package:new_one/pages/signup_page.dart';
import 'package:new_one/simple_bloc_obsserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChatApp());
  Bloc.observer = SimpleBlocObserver();
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => LoginCubit(),
        // ),
        // BlocProvider(
        //   create: (context) => SignupCubit(),
        // ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        // BlocProvider(
        //   create: (context) => AuthCubit(),
        // ),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          SignupPage.id: (context) => SignupPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        initialRoute: LoginPage.id,
      ),
    );
  }
}
