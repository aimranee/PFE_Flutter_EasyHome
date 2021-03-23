import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:food_app/constants.dart';

class Search extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const Search({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Color(0xFFB5BFD0).withOpacity(0.32),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search Here",
          hintStyle: TextStyle(color: Color(0xFFB5BFD0)),
        ),
      ),
    );
  }
}
