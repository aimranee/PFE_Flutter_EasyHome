/*import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/sing_in/composant/background.dart';
import 'package:easyhome/app/sing_in/composant/sign_in_button.dart';
import 'package:easyhome/app/sing_in/composant/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);
// final AuthBase auth;
  final void Function(User) onSignIn;

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
          return userCredential.user;
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

  Future<User> _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      // navigation in flutter
      MaterialPageRoute<void>(
        fullscreenDialog: true, // hiya li katle3 lpage bdiik tarii9a
        //  builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildContent(context), backgroundColor: Colors.grey[200]);
  }

  Widget _buildContent(BuildContext context) {
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
          SizedBox(
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SocialSingInButton(
              assetName: "assets/images/google-logo.png",
              text: 'Sing in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              //     onPressed: _signInWithGoogle,
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
              //     onPressed: _signInWithFacebook,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingInButton(
              text: 'Sing in with email',
              textColor: Colors.white,
              color: Colors.teal,
              onPressed: () => _signInWithEmail(context),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Avez-vous un compte ?"),
                TextButton(
                    //    onPressed: () => _register(context),
                    child: Text("Register"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/