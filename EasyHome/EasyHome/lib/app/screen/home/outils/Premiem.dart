import 'package:EasyHome/app/screen/class/annonce_parametre/annoncePremiem.dart';
import 'package:EasyHome/app/screen/class/data/dataPremiem.dart';
import 'package:EasyHome/app/sing_in/background.dart';
import 'package:flutter/material.dart';

class DiffStyles extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    AnnoncePremiem annoncePremiem = listPremiem[index];

    return Container(
        decoration: new BoxDecoration(color: Colors.yellow[200]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0 / 2),
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: size.height * 0.4,
                    width: size.width * 0.6,
                    fit: BoxFit.cover,
                    image: AssetImage(annoncePremiem.images),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Premiem',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.lightBlue),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            height: size.height * 0.3,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listPremiem.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index);
                }),
          ),
        )
      ],
    );
  }
}
