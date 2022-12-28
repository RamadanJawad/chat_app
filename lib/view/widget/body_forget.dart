import 'package:chat_app/controller/forgetPass_controller.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyForgetPassword extends StatelessWidget {
  const BodyForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassController>(
      builder: (controller) {
        return Form(
          key: controller.globalKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "Resset Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 30.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Please enter your email address to \nrequest a password reset",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white60,
                      fontFamily: "Roboto",
                      fontSize: 17.sp),
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty !";
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: controller.email,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.globalKey.currentState!.validate()) {
                        FirebaseAuthController.firebaseAuthHelper
                            .resetPassword(Users(email: controller.email.text));
                        Get.snackbar(
                          "",
                          "",
                          snackStyle: SnackStyle.FLOATING,
                          margin: EdgeInsets.all(10),
                          titleText: const Text(
                            "*Note",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: 19,
                                color: Color(0xff04BF68)),
                          ),
                          messageText: const Text(
                            "Please check your email !",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontFamily: "Cairo", fontSize: 18),
                          ),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: Text(
                      "SEND",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff04BF68),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15).r),
                        padding: const EdgeInsets.all(15)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
