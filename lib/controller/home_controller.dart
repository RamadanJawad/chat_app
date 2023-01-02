import 'package:chat_app/core/shared_perf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void setStatus(String status) async {
    await firestore
        .collection("Users")
        .doc(SharedPrefController().uid)
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