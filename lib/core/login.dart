import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/utils/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future login(LoginController controller) async {
  if (controller.globalKey.currentState!.validate()) {
    UserCredential? user = await FirebaseAuthController.firebaseAuthHelper
        .signIn(Users(
            email: controller.email.text, password: controller.password.text));
    if (user != null) {
      Get.dialog(const Center(
        child: CupertinoActivityIndicator(
          radius: 20,
          color: Colors.white,
        ),
      ));
      Future.delayed(Duration(seconds: 4), () {
        Get.to(() => HomeScreen());
        controller.email.clear();
        controller.password.clear();
      });
    } else {
      Get.snackbar("Invalid Password", "The Password is Wrong!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.delete();
    }
  }
  Get.delete();
}
