import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("asset/icons/menu.svg"),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "Easy", style: TextStyle(color: Colors.grey)),
            TextSpan(text: "Home", style: TextStyle(color: Colors.lightBlue)),
          ]),
    ),
  );
}
