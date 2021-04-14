import 'dart:io';
import 'package:easyhome/app/screen/class/model/annonce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DBServices {
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference carouselcol =
      FirebaseFirestore.instance.collection("carousel");
  final CollectionReference annoncecol =
      FirebaseFirestore.instance.collection("annonce");

  Future saveUser(UserM user) async {
    try {
      await usercol.doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<UserM> get getCurrentUser {
    final user = FirebaseAuth.instance.currentUser;
    return user != null
        ? usercol
            .doc(user.uid)
            .snapshots()
            .map((user) => UserM.fromJson(user.data()))
        : null;
  }

  Future getUser(String id) async {
    try {
      final data = await usercol.doc(id).get();
      final user = UserM.fromJson(data.data());
      return user;
    } catch (e) {
      return false;
    }
  }

    Future updateUser(UserM user) async {
    try {
      await usercol.doc(user.id).update(
      user.toMap()
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /*Future<String> uploadImage(File file, {String path}) async {
InputElement input = FileUploadInputElement()..accept = 'image/**/';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }*/


  Future<String> uploadImage(File file, {String path}) async {
    var time = DateTime.now().toString();
    var ext = Path.basename(file.path).split(".")[1].toString();
    String image = path + "_" + time + "." + ext;
    try {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref(path + "/" + image);
      ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<List> get getCarouselImage async {
    try {
      final data = await carouselcol.doc("i7WNCpDpp54RUfDj2ljF").get();
      return data.data()["images"];
    } catch (e) {
      return null;
    }
  }

  Future saveAnnonce(Annonce annonce) async {
    try {
      await annoncecol.doc().set(annonce.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<Annonce>> get getAnnonce {
    return annoncecol.snapshots().map((annonce) {
      return annonce.docs
          .map((e) => Annonce.fromJson(e.data(), id: e.id))
          .toList();
    });
  }
}
