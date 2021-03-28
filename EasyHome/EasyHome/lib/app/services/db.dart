import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyhome/app/screen/class/model/user.dart';

class DBServices {
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");
  Future saveUser(UserM user) async {
    try {
      await usercol.doc(user.id).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
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
}
