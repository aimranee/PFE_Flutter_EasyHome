import 'package:easyhome/app/sing_in/composant/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SingInButton extends CustomRaisedButton {
  SingInButton(
      {String text, Color color, Color textColor, VoidCallback onPressed})
      : super(
          child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
          color: color,
          onPressed: onPressed,
        );
}
