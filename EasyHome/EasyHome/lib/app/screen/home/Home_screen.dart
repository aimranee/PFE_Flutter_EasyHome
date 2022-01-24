import 'package:easyhome/app/screen/home/outils/Homes.dart';
import 'package:easyhome/app/screen/home/outils/Menu.dart';
import 'package:easyhome/app/screen/home/outils/Premium.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce.dart';
import 'package:easyhome/app/screen/home/outils/add_annonce_premium.dart';

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
      drawer: MenuBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: RichText(
          text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline6
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
              PremiumList(),
              Divider(),
              Home(),
            ],
          ),
        ],
      ),
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
              Icons.add_a_photo_outlined,
              color: Colors.white,
            ),
            backgroundColor: Colors.cyan,
            label: 'Add annonce',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddAnnonce()));
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.add_a_photo_rounded,
              color: Colors.white,
            ),
            backgroundColor: Colors.amber,
            label: 'Add annonce premium',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddAnnoncePremium()));
            },
          ),
        ],
      ),
    );
  }
}
