import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? currentMap;
  Future<dynamic> readData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("Users").get().then((value) {
      currentMap = value.docs[0].data();
      update();
    });
    update();
  }

  void setStatus(String status) async {
    await firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"status": status});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }
}
