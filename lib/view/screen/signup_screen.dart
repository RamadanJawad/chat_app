import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/view/widget/body_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff292F3F),
          title:const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme:const IconThemeData(
            color: Colors.white, // <-- SEE HERE
          ),
          elevation: 0,
        ),
        backgroundColor:const Color(0xff292F3F),
        body:const BodySignUp());
  }
}
