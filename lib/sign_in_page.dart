import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_template/text.dart';
import 'package:flutter/material.dart';

import 'login_with_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
              function: () {},
            ),
            LoginWithButton(
              text: tEmail,
              imagePath: "assets/email.png",
              function: () {},
            ),
            LoginWithButton(
              text: tGoogle,
              imagePath: "assets/google.png",
              function: () {},
            ),
            LoginWithButton(
              text: tAnonym,
              imagePath: "assets/unknown.png",
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
