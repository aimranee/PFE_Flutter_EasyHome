import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    //  getUser();
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          
        )
      ],
    );
  }
}
