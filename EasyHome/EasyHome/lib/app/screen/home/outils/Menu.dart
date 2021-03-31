import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce_premium.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserM>(context);
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
            ),
            Container(
                child: ElevatedButton(
                    child: Text("Add Annonce"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddAnnonce()));
                    })),
            Container(
                color: Colors.yellow[100],
                child: ElevatedButton(
                    child: Text("Add Annonce Premium"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddAnnoncePremium()));
                    }))
          ],
        ));
  }
}
