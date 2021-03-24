import 'package:EasyHome/app/screen/class/annonce_parametre/annoncePremiem.dart';
import 'package:EasyHome/app/screen/class/data/dataPremiem.dart';
import 'package:flutter/material.dart';

class PremiemList extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    AnnoncePremiem annoncePremiem = listPremiem[index];

    return Container(
        decoration: new BoxDecoration(color: Colors.yellow[100]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 / 2),
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(annoncePremiem.images),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Premiem',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            height: size.height * 0.18,
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
