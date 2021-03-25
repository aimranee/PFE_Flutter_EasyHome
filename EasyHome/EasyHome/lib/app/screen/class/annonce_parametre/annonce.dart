import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Annonce {
  String userName;
  String title;
  String images;
  String address;
  String description;
  double price;
  int rooms;
  int limitPersonne;
  double sqFeet;
  int time;
  bool isFav;
  List<String> ListImages;

  Annonce(
      {
      this.userName,
      this.title,
      this.images,
      this.ListImages,
      this.address,
      this.description,
      this.price,
      this.rooms,
      this.limitPersonne,
      this.sqFeet,
      this.time,
      this.isFav});
}

class FireStorageService extends Annonce {
  FireStorageService();
  static Future<dynamic> loadImge(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}