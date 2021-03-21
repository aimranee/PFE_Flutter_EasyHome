import 'package:EasyHome/app/screen/Home_screen.dart';
import 'package:EasyHome/app/screen/home/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:EasyHome/app/sing_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    _updateUser(FirebaseAuth.instance.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null)
      return SignInPage(
        onSignIn: _updateUser,
      );
    else
      return HomePage(
        onSignOut: () => _updateUser(null),
      );
  }
}
