import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/detail/composant/home_details_premiem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PagePremiemDetails extends StatefulWidget {
  final Annonce annoncePremiem;
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Home Details",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              Stack(
                children: [
                  //  CarouselImages(widget.annoncePremiem.ListPremiem),
                ],
              ),
              HomeDetailsPremiem(widget.annoncePremiem),
            ],
          ),
        ]));
  }
}
