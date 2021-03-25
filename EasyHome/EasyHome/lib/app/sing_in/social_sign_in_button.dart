import 'package:flutter/material.dart';
import 'package:easyhome/app/common_widgets/custom_raised_button.dart';

class SocialSingInButton extends CustomRaisedButton {
  SocialSingInButton(
      {String assetName,
      String text,
      Color color,
      Color textColor,
      VoidCallback onPressed})
      : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset(assetName),
                )
              ],
            ),
            color: color,
            onPressed: onPressed);
}
