import 'package:easyhome/app/new/loginPage.dart';
import 'package:easyhome/app/screen/home/Home_screen.dart';
import 'package:easyhome/app/screen/home/outils/Homes.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Statut extends StatefulWidget {
  @override
  _StatutState createState() => _StatutState();
}

class _StatutState extends State<Statut> {
  User user;
  AuthServices auth = AuthServices();
  Future<void> getUser() async {
    final userResult = await auth.user;
    setState(() {
      user = userResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return user == null ? LoginPage() : HomeScreen();
  }
}