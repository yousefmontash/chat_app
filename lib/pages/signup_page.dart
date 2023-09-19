import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_one/components/custom_button.dart';
import 'package:new_one/components/custom_text_field.dart';
import 'package:new_one/constants.dart';

import 'package:new_one/helper/show_snackbar.dart';
import 'package:new_one/pages/blocs/auth_bloc/auth_bloc.dart';

import 'package:new_one/pages/chat_page.dart';

class SignupPage extends StatelessWidget {
  static String id = "SignupPage";
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          loading = true;
        } else if (state is SignupSucceed) {
          ShowSnackBar(context, "Successful");
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          loading = false;
        } else if (state is SignupFailed) {
          ShowSnackBar(context, state.errorMessage);
          loading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      kLogo,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Scholar Chat",
                          style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      obsecureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: "Password",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onTap: ()  {
                        if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context)
                              .add(signupEvent(email: email!, password: password!));
                        }
                      },
                      text: "Sign Up",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "have an account already ?",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "  Login",
                            style: TextStyle(color: Color(0xFFC7EDE6)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
