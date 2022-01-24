import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/detail/composant/carousel_images.dart';
import 'package:easyhome/app/screen/detail/composant/home_details_premium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class PagePremiumDetails extends StatefulWidget {
  final Annonce annoncePremium;
  const PagePremiumDetails({Key key, this.annoncePremium}) : super(key: key);

  @override
  _PagePremiumDetailsState createState() => _PagePremiumDetailsState();
}

class _PagePremiumDetailsState extends State<PagePremiumDetails> {
  int value = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: "Home", style: TextStyle(color: Colors.lightBlue)),
                ]),
          )),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.annoncePremium.images),
                ],
              ),
              HomeDetailsPremium(widget.annoncePremium),
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
                  _makecall('tel:${widget.annoncePremium.tele}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _makecall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw "Error";
    }
  }
}
