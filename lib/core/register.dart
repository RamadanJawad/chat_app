import 'dart:io';
import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/main_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void register(SignUpController controller) async {
  Get.dialog(const Center(
    child: CupertinoActivityIndicator(
      radius: 20,
      color: Colors.white,
    ),
  ));
  if (controller.globalKey.currentState!.validate()) {
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
    
    SharedPrefController().saveEmail(email: controller.email.text);
    SharedPrefController().saveName(username: controller.username.text);
    SharedPrefController().saveImage(path: controller.file!.path.toString());
    Get.to(() => MainScreen());
  }
  Get.delete();
}
