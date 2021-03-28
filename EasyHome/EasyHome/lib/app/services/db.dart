import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyhome/app/screen/class/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DBServices {
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference carouselcol =
      FirebaseFirestore.instance.collection("carousel");

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

  Future<List> get getCarouselImage async {
    try {
      final data = await carouselcol.doc("i7WNCpDpp54RUfDj2ljF").get();
      return data.data()["images"];
    } catch (e) {
      return null;
    }
  }
}
