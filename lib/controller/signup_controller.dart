import 'dart:io';

import 'package:chat_app/view/screen/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  GlobalKey<FormState> globalKey = GlobalKey();
  late TextEditingController password;

  XFile? file;
  final ImagePicker imagePicker = ImagePicker();
  final firebaseStorage = FirebaseStorage.instance;

  getImage() async {
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    
    update();
  }

  bool show_pass = true;
  void signIn() {
    Get.to(() => LoginScreen(), transition: Transition.fade);
  }

  showPassword() {
    show_pass = show_pass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
  }
}
