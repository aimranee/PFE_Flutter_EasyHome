import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:easyhome/app/screen/home/outils/Homes.dart';
import 'package:easyhome/app/screen/home/outils/Menu.dart';
import 'package:easyhome/app/screen/home/outils/Premiem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  //  final userM = Provider.of<UserM>(context);
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: RichText(
          text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: "Home", style: TextStyle(color: Colors.lightBlue)),
              ]),
        ),
        centerTitle: true,
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
