import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
          width: size.width * 0.6,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(19, 26, 44, 1.0).withOpacity(0.6),
                    offset: Offset(0, 10),
                    blurRadius: 10)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (Icons.map_outlined),
                color: Colors.white,
              ),
              Text(
                ' Map view ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ));
  }
}
