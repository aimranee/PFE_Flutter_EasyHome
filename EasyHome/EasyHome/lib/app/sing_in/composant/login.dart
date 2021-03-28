import 'dart:async';

import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/sing_in/composant/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  String email, passWord;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () async {
      //     final result = await auth.signIn(email, passWord)
          },
        ),
      ),
    );
  }
}