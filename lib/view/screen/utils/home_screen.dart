import 'dart:io';

import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/view/screen/auth/login_screen.dart';
import 'package:chat_app/view/screen/utils/search_screen.dart';
import 'package:chat_app/view/widget/chat/body_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String path = SharedPrefController().image!;
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Constant.colorSecondary,
      ),
      drawer: Drawer(
        backgroundColor: Constant.colorPrimary,
        child: Column(
          children: [
            Spacer(),
            CircleAvatar(
              backgroundImage: FileImage(File(path)),
              radius: 50.r,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome ",
                  style: TextStyle(
                      fontSize: 21.sp,
                      fontFamily: "Tajawal",
                      color: Colors.white),
                ),
                Text(
                  SharedPrefController().username!,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.bold,
                      color: Constant.colorSecondary),
                ),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Get.to(() => const LoginScreen(),
                      transition: Transition.fade);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: const BodyHome(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: Constant.colorSecondary,
        onPressed: () {
          Get.to(() => SearchScreen(), transition: Transition.fade);
        },
      ),
    );
  }
}
