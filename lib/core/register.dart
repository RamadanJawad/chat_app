import 'dart:io';

import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/main_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

void register(SignUpController controller) async {
  if (controller.globalKey.currentState!.validate()) {
    FirebaseAuthController.firebaseAuthHelper.createAccount(Users(
      email: controller.email.text,
      password: controller.password.text,
      name: controller.username.text,
    ));
    Reference ref = FirebaseStorage.instance.ref().child("profileImage");
    await ref.putFile(File(controller.file!.path));
    SharedPrefController().saveEmail(email: controller.email.text);
    SharedPrefController().saveName(username: controller.username.text);
    SharedPrefController().saveImage(path: controller.file!.path.toString());
    Get.to(() => MainScreen());
  }
}
