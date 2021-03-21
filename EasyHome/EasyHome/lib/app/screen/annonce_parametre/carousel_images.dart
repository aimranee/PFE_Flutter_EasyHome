import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  final List<String> ListImages;

  CarouselImages(this.ListImages);

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
                            AssetImage(widget.ListImages[0]),
                            AssetImage(widget.ListImages[1]),
                            AssetImage(widget.ListImages[2]),
                            AssetImage(widget.ListImages[3]),
                            AssetImage(widget.ListImages[4]),
                            AssetImage(widget.ListImages[5])
                          ],
                        ),
    );
  }
}
