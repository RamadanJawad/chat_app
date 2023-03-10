import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/core/login.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:chat_app/view/screen/utils/home_screen.dart';
import 'package:chat_app/view/screen/utils/search_screen.dart';
import 'package:chat_app/view/widget/auth/custom_button.dart';
import 'package:chat_app/view/widget/auth/custom_filed.dart';
import 'package:chat_app/view/widget/auth/custom_password.dart';
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
                  CustomFiled(
                      controller: controller.email, label: "Enter Your Email"),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomPassword(
                    obscureText: controller.show_pass,
                    controller: controller.password,
                    function: () {
                      controller.showPassword();
                    },
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
                            
                            color: Colors.white,
                            fontSize: 15.sp),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                      name: "SIGN IN",
                      function: () {
                        login(controller);
                      }),
                  SizedBox(
                    height: 40.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don???t have an account ? ",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          "Register Now ",
                          style: TextStyle(
                              color: Constant.colorSecondary,
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
