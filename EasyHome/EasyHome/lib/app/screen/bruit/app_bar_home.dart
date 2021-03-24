import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.grey,),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "             ", style: TextStyle(color: Colors.white)),
            TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
            TextSpan(text: "Home", style: TextStyle(color: Colors.lightBlue)),
          ]),
    ),
  );
}
