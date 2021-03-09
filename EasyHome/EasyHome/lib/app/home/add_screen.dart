import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../navbar_key.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Continue shopping'),
          onPressed: () {
            final CurvedNavigationBarState navState =
                NavBarKey.getKey().currentState;
            navState.setPage(0);
          },
        ),
      ),
    );
  }
}
