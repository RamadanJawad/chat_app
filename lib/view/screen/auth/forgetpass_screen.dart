import 'package:chat_app/controller/forgetPass_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/view/widget/auth/body_forget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constant.colorPrimary,
        title: const Text("Forget Password"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BodyForgetPassword(),
    );
  }
}
