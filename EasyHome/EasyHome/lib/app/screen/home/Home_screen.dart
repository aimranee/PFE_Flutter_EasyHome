import 'package:easyhome/app/screen/home/outils/Homes.dart';
import 'package:easyhome/app/screen/home/outils/Premiem.dart';
import 'package:easyhome/app/screen/home/outils/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int value = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: SpeedDial(
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
      ),
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
