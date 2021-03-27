import 'package:easyhome/app/sing_in/composant/email_sign_in_form.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: Text('               Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: EmailSignInForm()),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  _buildContent() {
    return Container();
  }
}
