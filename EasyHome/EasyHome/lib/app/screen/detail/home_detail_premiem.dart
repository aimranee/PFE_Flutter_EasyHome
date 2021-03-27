import 'package:easyhome/app/screen/class/annonce_parametre/annoncePremiem.dart';
import 'package:easyhome/app/screen/detail/composant/app_bar.dart';
import 'package:easyhome/app/screen/detail/composant/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/home_details_premiem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PagePremiemDetails extends StatefulWidget {
  final AnnoncePremiem annoncePremiem;
  const PagePremiemDetails({Key key, this.annoncePremiem}) : super(key: key);

  @override
  _PagePremiemDetailsState createState() => _PagePremiemDetailsState();
}

class _PagePremiemDetailsState extends State<PagePremiemDetails> {
  int value = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.cyan,
                label: 'Home'),
            SpeedDialChild(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amber,
                label: 'Profile'),
            SpeedDialChild(
                child: Icon(
                  Icons.camera_enhance,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
                label: 'Call'),
            SpeedDialChild(
                child: Icon(
                  Icons.call_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blueAccent,
                label: 'Call'),
          ],
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.annoncePremiem.ListPremiem),
                  AppBarDetails(),
                ],
              ),
              HomeDetailsPremiem(widget.annoncePremiem),
            ],
          ),
        ]));
  }
}
