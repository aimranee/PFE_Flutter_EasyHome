import 'package:easyhome/app/screen/class/annonce_parametre/annoncePremiem.dart';
import 'package:easyhome/app/screen/class/annonce_parametre/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/app_bar.dart';
import 'package:easyhome/app/screen/detail/composant/button.dart';
import 'package:easyhome/app/screen/detail/composant/home_details_premiem.dart';
import 'package:flutter/material.dart';

class PagePremiemDetails extends StatefulWidget {
  final AnnoncePremiem annoncePremiem;
  const PagePremiemDetails({Key key, this.annoncePremiem}) : super(key: key);

  @override
  _PagePremiemDetailsState createState() => _PagePremiemDetailsState();
}

class _PagePremiemDetailsState extends State<PagePremiemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ButtonPageDetails(),
    ]));
  }
}
