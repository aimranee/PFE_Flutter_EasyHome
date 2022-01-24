import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/detail/composant/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/home_details.dart';
import 'package:easyhome/app/services/db.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    Size size = MediaQuery.of(context).size;

    getCarouselImage;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "Easy", style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "Home",
                        style: TextStyle(color: Colors.lightBlue)),
                  ]),
            )),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            children: [
              CarouselImages(widget.annonce.images),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Commentaires",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.comment,
                              color: Colors.grey,
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Likes",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_circle_up,
                              color: Colors.lightBlue,
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 75,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Dislikes",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              HomeDetails(widget.annonce),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              width: size.width * 0.45,
              height: 60,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      (Icons.call_rounded),
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Appel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  _makecall('tel:${widget.annonce.tele}');
                },
              ),
            ),
          ),
        ]));
  }

  void _makecall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw "Error";
    }
  }
}
