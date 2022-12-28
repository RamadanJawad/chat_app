import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/view/screen/select_photo.dart';
import 'package:chat_app/view/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );
  late CurvedAnimation curve =
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);

  @override
  void onInit() {
    controller.forward();
    update();
    super.onInit();
    Future.delayed(Duration(seconds: 5), () {
      if (FirebaseAuthController.firebaseAuthHelper.isLoggedIn()) {
        Get.toNamed("/main_screen");
      } else {
        Get.toNamed("/login_screen");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
