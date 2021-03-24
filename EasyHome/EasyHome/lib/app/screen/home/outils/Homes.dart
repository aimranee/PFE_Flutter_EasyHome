import 'package:EasyHome/app/screen/class/annonce_parametre/annonce.dart';
import 'package:EasyHome/app/screen/class/data/data.dart';
import 'package:EasyHome/app/screen/detail/home_detail.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0 / 2),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20.0,
                offset: Offset(5, 15))
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: Image(
                      height: 120,
                      width: size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(annonce.images),
                    ),
                  ),
                  
                  Positioned(
                    right: 20.0 / 2,
                    top: 20.0 / 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
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
                    Text(
                      '${annonce.price.toStringAsFixed(2)}\ DH',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
                        '${annonce.title}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.4)
                        ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Annonce',
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: annonceList.length,
              itemBuilder: (context, index) {
                return _buildHouse(context, index);
              }))
    ]));
  }
}
