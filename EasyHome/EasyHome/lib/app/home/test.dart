import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key, @required this.onSignOut}) : super(key: key);
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('EasyHome'),
      actions: [
        FlatButton(
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          onPressed: _signOut,
        )
      ],
    ));
  }
}
