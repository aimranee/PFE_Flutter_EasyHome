import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 2,
    title: RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "             ", style: TextStyle(color: Colors.white)),
            TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
            TextSpan(text: "Home", style: TextStyle(color: Colors.lightBlue)),
          ]),
    ),
  );
}
