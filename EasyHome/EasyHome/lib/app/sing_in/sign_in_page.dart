import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:EasyHome/app/sing_in/background.dart';
import 'package:EasyHome/app/sing_in/sign_in_button.dart';
import 'package:EasyHome/app/sing_in/social_sign_in_button.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);
  final void Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredential.user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User> _signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        if (googleAuth.idToken != null) {
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ));
          onSignIn(userCredential.user);
        } else {
          throw FirebaseAuthException(
            code: 'ERROR_MESSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google ID Token',
          );
        }
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User> _signInWithFacebook() async {
    final fb = FacebookLogin();
    final responce = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (responce.status) {
      case FacebookLoginStatus.success:
        final accessToken = responce.accessToken;
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          FacebookAuthProvider.credential(accessToken.token),
        );
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: responce.error.developerMessage,
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContent(), backgroundColor: Colors.grey[200]);
  }

  Widget _buildContent() {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Welcom,',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Here you can find youd home',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SocialSingInButton(
              assetName: "assets/images/google-logo.png",
              text: 'Sing in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: _signInWithGoogle,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SocialSingInButton(
              assetName: "assets/images/facebook-logo.png",
              text: 'Sing in with Facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
              onPressed: _signInWithFacebook,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: Text(
              'OR',
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingInButton(
              text: 'Go anonymous',
              textColor: Colors.black,
              color: Colors.lime[200],
              onPressed: _signInAnonymously,
            ),
          )
        ],
      ),
    );
  }
}
