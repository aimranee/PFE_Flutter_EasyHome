import 'package:EasyHome/app/screen/Homes/Homes.dart';
import 'package:EasyHome/app/screen/annonce_parametre/annonce.dart';
import 'package:flutter/material.dart';

class PageDetails extends StatefulWidget {
  final Annonce annonce;

  const PageDetails({Key key, this.annonce}) : super(key: key);
  
  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(padding: EdgeInsets.only(
            bottom: 30.0,
            left: 30.0,
            right: 30.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [],)
            ],),
          )
        ],
      ),
    );
  }
}
