import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce_premium.dart';
import 'package:easyhome/app/screen/home/outils/get_image.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:easyhome/app/sign_in_page/composant/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

AuthServices auth = AuthServices();

class _MenuBarState extends State<MenuBar> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserM>(context);
    return Container(
        color: Colors.white,
        width: 290,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.white,
              height: 200,
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  backgroundImage:
                      user.image != null ? NetworkImage(user.image) : null,
                  child: Stack(children: [
                    if (user.image == null)
                      Center(
                          child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )),
                    if (loading)
                      Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                    Positioned(
                      top: 80,
                      left: 152,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          final data = await showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                return GetImage();
                              });
                          if (data != null) {
                            loading = true;
                            setState(() {});
                            String urlImage = await DBServices()
                                .uploadImage(data, path: "user");
                            if (urlImage != null) {
                              final updateUser = user;
                              updateUser.image = urlImage;
                              bool isupdate =
                                  await DBServices().updateUser(updateUser);
                              if (isupdate) {
                                loading = false;
                                setState(() {});
                              }
                            }
                          }
                        },
                      ),
                    )
                  ])),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                user.userName ?? "aucun",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text(
                user.email ?? "aucun",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone_android_outlined),
              title: Text(
                user.phone ?? "aucun",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt_rounded),
              title: Text(
                'Ajouter annonce Premium',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddAnnoncePremium()));
              },
              tileColor: Colors.yellow[200],
            ),
            ListTile(
                leading: Icon(Icons.add_a_photo_outlined),
                title: Text(
                  'Ajouter annonce',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddAnnonce()));
                }),
            Divider(),
            SizedBox(
              height: 100,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
              ),
              tileColor: Colors.grey[200],
              title: Text(
                'Log out',
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
