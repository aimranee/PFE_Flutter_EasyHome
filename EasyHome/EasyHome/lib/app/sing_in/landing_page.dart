import 'package:easyhome/app/screen/bruit/home/test.dart';
import 'package:easyhome/app/screen/home/Home_screen.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/sing_in/composant/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:easyhome/app/sing_in/sign_in_page.dart';
/*
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User user;

  //Auth auth = Auth();

  Future<User> getUser() async {
   // final userResult = await auth.user;
    setState(() {
 //     user = userResult;
    });
  }

  @override
  void iniState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return user == null ? EmailSignInForm() : HomeScreen();
  }
}


class LandingPage extends StatefulWidget {
  const LandingPage({Key key, this.auth}) : super(key: key);
  final Auth auth;

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
        //auth: widget.auth,
        onSignIn: _updateUser,
      );
    else
      return HomePage(
        auth: widget.auth,
        onSignOut: () => _updateUser(null),
      );
  }
}
*/
