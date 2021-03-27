import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easyhome/app/screen/home/outils/app_bar_home.dart';
import 'package:flutter/material.dart';

class ButtonsBar extends StatefulWidget {
  ButtonsBar({Key key}) : super(key: key);
  @override
  _ButtonsBarState createState() => _ButtonsBarState();
}

class _ButtonsBarState extends State<ButtonsBar> {
  int pageindex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final ButtonsBar _homeScreen = ButtonsBar();

  Widget _showPage = new ButtonsBar();

  Widget _pageChoser(int page) {
    switch (page) {
      case 0:
        return _homeScreen;
      default:
        return new Container(
          child: new Center(
            child: new Text('No page found'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageindex,
          height: 50.0,
          items: [
            Icon(Icons.home,
                size:
                    30), /*
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),*/
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChoser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            /*child: Column(
              children: <Widget>[
                Text(pageindex.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                )
              ],
            ),*/
            child: _showPage,
          ),
        ));
  }
}
