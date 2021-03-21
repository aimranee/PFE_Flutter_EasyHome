import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        color: Colors.blue,
        height: size.height * 0.22,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(Icons.sort_rounded),
                ),
                
                Container(
                  child: Text(
                    'City',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(Icons.insights_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
