import 'package:EasyHome/app/screen/home/outils/Homes.dart';
import 'package:EasyHome/app/screen/home/outils/Premiem.dart';
import 'package:EasyHome/app/screen/home/outils/search.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            // PremiemList(),
            //Search(
            ////   onChanged: (value) {},
            // ),
            //CategoryList(),
            Home(),
          ])

          //DiscountCard(),
        ],
      ),
    );
  }
}
