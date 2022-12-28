import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: controller.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: double.infinity,
                    height: 120.h,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The field is empty !";
                      }
                    },
                    style: const TextStyle(
                        fontFamily: "Roboto", color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Enter Your Email",
                        labelStyle: const TextStyle(
                            color: Colors.white, fontFamily: "Roboto"),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff04BF68),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The field is empty !";
                      } else if (value.length < 8) {
                        return "The password is too short !";
                      }
                    },
                    style: const TextStyle(
                        fontFamily: "Roboto", color: Colors.white),
                    obscureText: controller.show_pass,
                    controller: controller.password,
                    decoration: InputDecoration(
                        labelText: "Enter Your Password",
                        labelStyle: const TextStyle(
                            color: Colors.white, fontFamily: "Roboto"),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff04BF68),
                        ),
                        suffixIcon: InkWell(
                          child: Icon(
                            controller.show_pass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff04BF68),
                          ),
                          onTap: () {
                            controller.showPassword();
                          },
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            borderSide: const BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontSize: 15.sp),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.globalKey.currentState!.validate()) {
                          FirebaseAuthController.firebaseAuthHelper.signIn(
                              Users(
                                  email: controller.email.text,
                                  password: controller.password.text));
                          Get.to(() => MainScreen());
                        }
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(fontFamily: "Roboto"),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff04BF68),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15).r),
                          padding: const EdgeInsets.all(15)),
                    ),
                  ),
                  SizedBox(
                    height: 40.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ? ",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          "Register Now ",
                          style: TextStyle(
                              color: Color(0xff04BF68),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
