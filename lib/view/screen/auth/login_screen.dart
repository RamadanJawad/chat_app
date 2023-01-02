import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/view/widget/auth/body_login.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return const Scaffold(
        backgroundColor: Constant.colorPrimary, body: BodyLogin());
  }
}
