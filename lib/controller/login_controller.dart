import 'package:chat_app/view/screen/auth/forgetpass_screen.dart';
import 'package:chat_app/view/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> globalKey = GlobalKey();
  bool show_pass = true;

  void goToForgetPassword() {
    Get.to(() => ForgetPassScreen(), transition: Transition.fade);
  }

  void goToSignUp() {
    Get.to(() => SignUpScreen(), transition: Transition.fade);
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
