import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:EasyHome/app/home/account_screen.dart';
import 'package:EasyHome/app/home/add_screen.dart';
import 'package:EasyHome/app/home/home_screen.dart';
import 'package:EasyHome/app/home/map_screen.dart';

import 'navbar_key.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int selectedIndex = 0;
  final screen = [
    HomePage(),
    MapPage(),
    AddPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        key: NavBarKey.getKey(),
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.blue,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectedIndex],
    );
  }
}
