import 'package:easyhome/app/screen/class/data/dataPremiem.dart';
import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/detail/home_detail_premiem.dart';
import 'package:flutter/material.dart';

class PremiemList extends StatelessWidget {
  _buildStyles(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Annonce annoncePremiem = listPremiem[index];

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  PagePremiemDetails(annoncePremiem: annoncePremiem),
            ),
          );
        },
        child: Container(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(annoncePremiem.images[0]),
                  ),
                ),
              ),
            )
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: new BoxDecoration(color: Colors.yellow[100]),
        child: Column(
          children: [
            Text(
              'Premiem',
              style: TextStyle(fontSize: 20),
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
        ));
  }
}
