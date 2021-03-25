import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  final List<String> listImages;

  CarouselImages(this.listImages);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Carousel(
        dotSize: 5,
        dotBgColor: Colors.transparent,
        autoplay: false,
        images: [
          AssetImage(
            widget.listImages[0],
          ),
          AssetImage(
            widget.listImages[1],
          ),
          AssetImage(
            widget.listImages[2],
          ),
          AssetImage(
            widget.listImages[3],
          ),
          AssetImage(
            widget.listImages[4],
          ),
          AssetImage(
            widget.listImages[5],
          ),
        ],
      ),
    );
  }
}
