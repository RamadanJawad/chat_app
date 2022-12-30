import 'dart:io';
import 'package:chat_app/controller/signup_controller.dart';
import 'package:chat_app/core/register.dart';
import 'package:chat_app/view/widget/custom_button.dart';
import 'package:chat_app/view/widget/custom_filed.dart';
import 'package:chat_app/view/widget/custom_password.dart';
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
                                ? const Icon(
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
                    CustomFiled(
                        controller: controller.username,
                        label: "Enter Your Username"),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomFiled(
                        controller: controller.email,
                        label: "Enter Your Email"),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomPassword(
                      obscureText: controller.show_pass,
                      controller: controller.password,
                      function: () {
                        controller.showPassword();
                      },
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    CustomButton(
                        name: "SIGN UP",
                        function: () async {
                          register(controller);
                        }),
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
                                color: const Color(0xff04BF68),
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