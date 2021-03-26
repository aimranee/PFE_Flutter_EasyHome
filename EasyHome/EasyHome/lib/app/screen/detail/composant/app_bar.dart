import 'package:flutter/material.dart';

class AppBarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Container(
        height: size.height * 0.06,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(1)),
                borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
