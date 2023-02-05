import 'dart:io';
import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/utils/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void register(SignUpController controller) async {
  if (controller.globalKey.currentState!.validate()) {
    Get.dialog(const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: Colors.white,
      ),
    ));
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profileImage_${controller.username.text}");
    await ref.putFile(File(controller.file!.path));
    String url = await ref.getDownloadURL();
    FirebaseAuthController.firebaseAuthHelper.createAccount(Users(
      email: controller.email.text,
      password: controller.password.text,
      name: controller.username.text,
      image: url,
    ));
    
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => HomeScreen());
    });
    controller.email.clear();
    controller.password.clear();
    controller.username.clear();
  }
  Get.delete();
}
