import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

AuthServices auth = AuthServices();

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserM>(context);
    final user = Provider.of<UserM>(context);
    return Container(
        color: Colors.white,
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
            Divider(),
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text('Profile'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }),
            Divider(),
            SizedBox(
              height: 200,
            ),
          ],
        ));
  }
}
