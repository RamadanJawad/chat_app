import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController with WidgetsBindingObserver {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void setStatus(String status) async {
    await firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          "status":status
        });
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
