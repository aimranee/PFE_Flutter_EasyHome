import 'package:EasyHome/app/screen/home/outils/search.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(
            onChanged: (value) {},
          ),
          /*CategoryList(),
          ItemList(),
          DiscountCard(),*/
        ],
      ),
    );
  }
}
