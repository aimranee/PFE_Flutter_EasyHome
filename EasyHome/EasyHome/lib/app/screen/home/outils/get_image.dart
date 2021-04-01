import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatelessWidget {
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150,
      child: Column(
        children: [
          Text(
            "Photos",
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
                onPressed: () async {
                  final result =
                      await picker.getImage(source: ImageSource.camera);
                  Navigator.of(context).pop(File(result.path));
                },
                label: Text(
                  "Camera",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              Container(
                width: 30,
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.image,
                  color: Colors.grey,
                  size: 30,
                ),
                onPressed: () async {
                  final result =
                      await picker.getImage(source: ImageSource.gallery);
                  if (result != null)
                    Navigator.of(context).pop(File(result.path));
                  else
                    Navigator.of(context).pop();
                },
                label: Text(
                  "Gallery",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
