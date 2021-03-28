import 'package:easyhome/app/screen/bruit/home/test.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:easyhome/app/sing_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
 const LandingPage({Key key, this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
/*
  @override
  void initState() {
    super.initState();
    _updateUser(widget.auth.getUser);
  }*/

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null)
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    else
      return HomePage(
        auth: widget.auth,
        onSignOut: () => _updateUser(null),
      );
  }
}
