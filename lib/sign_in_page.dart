import 'package:firebase_auth_template/services/auth.dart';
import 'package:firebase_auth_template/text.dart';
import 'package:flutter/material.dart';

import 'login_with_button.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;
  const SignInPage({Key? key, required this.auth}) : super(key: key);

  Future<void> _signInAnonymously() async {
    await auth.signInAnonymously();
  }

  Future<void> _signInWithGoogle() async {
    await auth.signInWithGoogle();
  }

  Future<void> _signInWithFacebook() async {
    await auth.singInWithFacebook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Sign In Template"),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginWithButton(
              text: tFacebook,
              imagePath: "assets/facebook.png",
              function: _signInWithFacebook,
            ),
            LoginWithButton(
              text: tEmail,
              imagePath: "assets/email.png",
              function: () {},
            ),
            LoginWithButton(
              text: tGoogle,
              imagePath: "assets/google.png",
              function: _signInWithGoogle,
            ),
            LoginWithButton(
              text: tAnonym,
              imagePath: "assets/unknown.png",
              function: _signInAnonymously,
            ),
          ],
        ),
      ),
    );
  }
}
