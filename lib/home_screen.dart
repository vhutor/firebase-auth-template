import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_template/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthBase auth;
  const HomeScreen({Key? key, required this.auth}) : super(key: key);

  Future<void> _signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              "Log out",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
