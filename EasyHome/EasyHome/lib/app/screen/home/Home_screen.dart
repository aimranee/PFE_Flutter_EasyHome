import 'package:EasyHome/app/common_widgets/buttons.dart';
import 'package:EasyHome/app/screen/bruit/app_bar_home.dart';
import 'package:EasyHome/app/screen/home/outils/Homes.dart';
import 'package:EasyHome/app/screen/home/outils/Premiem.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              PremiemList(),
              Home(),
            ],
          ),
          Buttons(),
        ],
      ),
    );
  }
}
