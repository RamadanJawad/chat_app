import 'package:chat_app/controller/launch_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LaunchController controller = Get.put(LaunchController());
    return Scaffold(
      backgroundColor: Color(0xff292F3F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          FadeTransition(
            opacity: controller.curve,
            child: Image.asset(
              "assets/images/logo.png",
              height: 200.h,
              width: double.infinity,
            ),
          ),
          Spacer(),
          const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
              animating: true,
              
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
