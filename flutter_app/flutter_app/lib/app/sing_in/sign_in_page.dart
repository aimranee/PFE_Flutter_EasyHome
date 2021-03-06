import 'package:flutter/material.dart';
import 'package:flutter_app/app/common_widgets/custom_raised_button.dart';
import 'package:flutter_app/app/sing_in/sign_in_button.dart';
import 'package:flutter_app/app/sing_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }
  
  Widget _buildContent() {

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sing in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 50.0,
          ),
          
          SocialSingInButton(
            assetName: "assets/images/google-logo.png",
            text: 'Sing in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: (){},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSingInButton(
            assetName: "assets/images/facebook-logo.png",
            text: 'Sing in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: (){},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'OR',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[200],
            onPressed: (){},
          ),
          
        ],
      ),
    );
  }
}
