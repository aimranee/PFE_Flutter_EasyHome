import 'package:easyhome/app/new/register.dart';
import 'package:flutter/material.dart';

class EmailSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: Register()),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  _buildContent() {
    return Container();
  }
}
