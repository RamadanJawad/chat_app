import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/view/widget/body_login.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return const Scaffold(
        backgroundColor: Color(0xff292F3F), body: BodyLogin());
  }
}
