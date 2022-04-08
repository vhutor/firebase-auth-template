import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_template/home_screen.dart';
import 'package:firebase_auth_template/services/auth.dart';
import 'package:firebase_auth_template/sign_in_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }
          return HomeScreen(
            auth: auth,
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      stream: auth.authStateChanges(),
    );
  }
}
