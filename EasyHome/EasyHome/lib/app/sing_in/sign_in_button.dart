import 'package:flutter/material.dart';
import 'package:EasyHome/app/common_widgets/custom_raised_button.dart';

class SingInButton extends CustomRaisedButton {
  SingInButton(
      {String text, Color color, Color textColor, VoidCallback onPressed})
      : super(
          child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
          color: color,
          onPressed: onPressed,
        );
}
