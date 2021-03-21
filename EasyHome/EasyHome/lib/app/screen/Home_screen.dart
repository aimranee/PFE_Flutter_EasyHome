import 'package:EasyHome/app/common_widgets/buttons.dart';
import 'package:EasyHome/app/screen/Homes/Homes.dart';
import 'package:EasyHome/app/screen/Premiem.dart';
import 'package:EasyHome/app/screen/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePagee extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0 * 2),
        child: Column(
          children: [AppBaar(), DiffStyles()],
        ),
      ),
    );
  }
}
