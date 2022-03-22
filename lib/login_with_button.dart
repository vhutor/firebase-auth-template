import 'package:flutter/material.dart';

import 'constants.dart';

class LoginWithButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Function()? function;

  const LoginWithButton(
      {required this.text, required this.imagePath, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15),
      child: Material(
        color: kLoginButtonColor,
        borderRadius: BorderRadius.circular(15.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset(
                  imagePath,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
