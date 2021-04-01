import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce_premium.dart';
import 'package:easyhome/app/screen/home/outils/profile.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

AuthServices auth = AuthServices();

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserM>(context);
    return Container(
        color: Colors.white,
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
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
            ListTile(
              leading: Icon(Icons.camera_alt_rounded),
              title: Text('Ajouter annonce Premium'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddAnnoncePremium()));
              },
              tileColor: Colors.yellow[200],
            ),
            ListTile(
                leading: Icon(Icons.add_a_photo_outlined),
                title: Text('Ajouter annonce'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddAnnonce()));
                }),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline_outlined),
              title: Text('Profile'),
              onTap: () => ProfilePage(),
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text('Contact us'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () => null,
            ),
            Divider(),
            SizedBox(
              height: 200,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
              ),
              tileColor: Colors.grey[200],
              title: Text(
                'Exit',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Deconnexion"),
                        content: Text("Voulez-vous vous déconnecter?"),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              await auth.signOut();
                              setState(() {});
                            },
                            child: Text("Oui"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text("Non"),
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ));
  }
}
