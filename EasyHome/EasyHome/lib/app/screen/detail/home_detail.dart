import 'package:easyhome/app/screen/class/annonce_parametre/annonce.dart';
import 'package:easyhome/app/screen/class/annonce_parametre/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/app_bar.dart';
import 'package:easyhome/app/screen/detail/composant/home_details.dart';
import 'package:flutter/material.dart';

class PageDetails extends StatefulWidget {
  final Annonce annonce;
  const PageDetails({Key key, this.annonce}) : super(key: key);

  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            CarouselImages(widget.annonce.ListImages),
            AppBarDetails(),
          ],
        ),
        HomeDetails(widget.annonce),
      ],
    ));
  }
}
