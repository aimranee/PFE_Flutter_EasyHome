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
        color: Colors.white,
        width: 250,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user.userName ?? "aucun",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              accountEmail: Text(
                user.email ?? "Aucun",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    user.image != null ? NetworkImage(user.image) : null,
                child: user.image != null
                    ? Container()
                    : Icon(
                        Icons.person,
                        color: Colors.lightBlue,
                      ),
              ),
            )
          ],
        ));
  }
}
