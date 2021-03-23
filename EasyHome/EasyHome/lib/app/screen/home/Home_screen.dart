
import 'package:EasyHome/app/common_widgets/buttons.dart';
import 'package:EasyHome/app/screen/bruit/app_bar_home.dart';
import 'package:EasyHome/app/screen/home/outils/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: Body());
  }
}
