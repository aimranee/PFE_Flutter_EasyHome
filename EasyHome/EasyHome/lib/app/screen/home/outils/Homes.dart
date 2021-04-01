import 'package:easyhome/app/screen/class/data/data.dart';
import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:easyhome/app/screen/detail/home_detail.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildHouse(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Annonce annonce = annonceList[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PageDetails(annonce: annonce),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: Offset(2, 4))
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        height: 120,
                        width: size.width,
                        fit: BoxFit.cover,
                        image: AssetImage(annonce.images[0]),
                      )),
                  Positioned(
                    right: 20.0 / 2,
                    top: 20.0 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: annonce.isFav
                            ? Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          setState(() {
                            annonce.isFav = !annonce.isFav;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      '${annonce.title}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      //height: 10,
                      width: 126,
                    ),
                    Text(
                      '${annonce.prix}\ DH',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        '${annonce.description}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.4)),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: annonceList.length,
            itemBuilder: (context, index) {
              return _buildHouse(context, index);
            }));
  }
}
