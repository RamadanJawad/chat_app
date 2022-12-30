import 'package:chat_app/models/UsersModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseFireStoreHelper {
  FirebaseFireStoreHelper._();
  static FirebaseFireStoreHelper fireStoreHelper = FirebaseFireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String userCollection = "Users";

  Future SaveUserData(Users users, String id) async {
    await firestore.collection(userCollection).doc(id).set({
      "id": id,
      "email": users.email,
      "name": users.name,
    });
  }
}
