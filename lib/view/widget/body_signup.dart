import 'dart:io';

import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/select_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: controller.globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Image.asset(
                    //   "assets/images/logo.png",
                    //   width: double.infinity,
                    //   height: 120.h,
                    // ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.getImage();
                        },
                        child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage: controller.file == null
                                ? null
                                : FileImage(File(controller.file!.path)),
                            child: controller.file == null
                                ? Icon(
                                    Icons.add_photo_alternate,
                                    size: 50,
                                    color: Color(0xff04BF68),
                                  )
                                : null),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is empty !";
                        }
                      },
                      style: const TextStyle(
                          fontFamily: "Roboto", color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Enter Your Username",
                          labelStyle: const TextStyle(
                              color: Colors.white, fontFamily: "Roboto"),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xff04BF68),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is empty !";
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: controller.phone,
                      style: const TextStyle(
                          fontFamily: "Roboto", color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Enter Your Phone",
                          labelStyle: const TextStyle(
                              color: Colors.white, fontFamily: "Roboto"),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xff04BF68),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 15.h,
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
                            Icons.email,
                            color: Color(0xff04BF68),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The field is empty !";
                        } else if (value.length < 8) {
                          return "The password is too short !";
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
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
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.globalKey.currentState!.validate()) {
                            FirebaseAuthController.firebaseAuthHelper
                                .createAccount(Users(
                                    email: controller.email.text,
                                    password: controller.password.text,
                                    name: controller.username.text,
                                    phone: controller.phone.text));
                            Get.to(() => SelectPhotoScreen());
                          }
                        },
                        child: Text(
                          "SIGN UP",
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
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            controller.signIn();
                          },
                          child: Text(
                            "Login Now ",
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
          ),
        );
      },
    );
  }
}
