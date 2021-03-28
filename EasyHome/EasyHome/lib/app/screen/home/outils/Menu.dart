import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    final user = UserM.current;
    return Container(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(user.email ?? "Aucun"),
          accountName: Text(user.userName ?? "aucun"),
        )
      ],
    ));
  }
}
