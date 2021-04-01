import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/Home_screen.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:easyhome/app/sign_in_page/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return user == null
        ? LoginPage()
        : StreamProvider<UserM>.value(
            value: DBServices().getCurrentUser,
            initialData: null,
            child: HomeScreen(),
          );
  }
}
