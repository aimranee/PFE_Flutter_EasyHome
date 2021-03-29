import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyhome/app/screen/class/annonce_parametre/annonce.dart';
import 'package:easyhome/app/screen/detail/composant/app_bar.dart';
import 'package:easyhome/app/screen/detail/composant/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/home_details.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PageDetails extends StatefulWidget {
  final Annonce annonce;
  const PageDetails({Key key, this.annonce}) : super(key: key);

  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  List imgs = [];

  get getCarouselImage async {
    final images = await DBServices().getCarouselImage;
    setState(() {
      imgs = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCarouselImage;
    return Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
      Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                  itemCount: imgs.length,
                  itemBuilder: (context, i, a) {
                    return Container(
                      child: Image(
                        image: NetworkImage(imgs[i]),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 240,
                    autoPlay: false,
                    viewportFraction: 1,
                  )),
              AppBarDetails(),
            ],
          ),
          HomeDetails(widget.annonce),
        ],
      ),
    ]));
  }
}
