import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/outils/Homes.dart';
import 'package:easyhome/app/screen/home/outils/Menu.dart';
import 'package:easyhome/app/screen/home/outils/Premiem.dart';
import 'package:easyhome/app/screen/home/outils/app_bar_home.dart';
import 'package:easyhome/app/services/auth.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserM userM;
  Auth auth = Auth();

  Future<void> getUser() async {
    User user = await auth.user;
    final userResult = await DBServices().getUser(user.uid);
    setState(() {
      userM = userResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuBar(),
      appBar: buildAppBar(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              PremiemList(),
              Home(),
            ],
          ),
        ],
      ),
    );
  }
}

/*int value = 0;
  @override
  void initState() {
    super.initState();
  }*/

/*floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white70,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              backgroundColor: Colors.amber,
              label: 'Profile'),
          SpeedDialChild(
              child: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              backgroundColor: Colors.cyan,
              label: 'Home'),
          SpeedDialChild(
              child: Icon(
                Icons.map_outlined,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              label: 'Map View'),
        ],
      ),*/
