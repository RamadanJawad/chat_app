import 'package:chat_app/core/shared_perf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Map<String, dynamic>? currentMap;
  Map<String, dynamic>? userMap;
  late TextEditingController username;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<dynamic> readData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("Users")
        .where("name", isEqualTo: SharedPrefController().username)
        .get()
        .then((value) {
      currentMap = value.docs[0].data();
      update();
    });
    update();
  }

  onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("Users")
        .where("name", isEqualTo: username.text)
        .get()
        .then((value) {
      userMap = value.docs[0].data();
      update();
    });
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    readData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
  }
}
