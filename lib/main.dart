import 'package:firebase_auth_template/landing_page.dart';
import 'package:firebase_auth_template/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Template',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(auth: Auth()),
    );
  }
}
