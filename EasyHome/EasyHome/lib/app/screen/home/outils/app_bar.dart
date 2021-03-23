import 'package:flutter/material.dart';

class AppBaar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.only(top: 30.0, right: 10.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Icon(Icons.notifications_none_rounded)],
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text('EasyHome', style: TextStyle(fontSize: 20.0))
            ]));
  }
}
