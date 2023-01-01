import 'dart:io';
import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/view/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyMain extends StatelessWidget {
  const BodyMain({super.key});

  @override
  Widget build(BuildContext context) {
    String path = SharedPrefController().image!;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: FileImage(File(path)),
                      radius: 25.r,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Welcome ",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "Tajawal",
                          color: Colors.white),
                    ),
                    Text(
                      SharedPrefController().username!,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormField(
                  controller: controller.username,
                  style: const TextStyle(
                      fontFamily: "Tajawal", color: Colors.white),
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        child: const Icon(
                          Icons.close,
                          color: Color(0xff04BF68),
                        ),
                        onTap: () {
                          controller.username.clear();
                        },
                      ),
                      labelText: "Enter Your Ussername",
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.onSearch,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(15),
                        backgroundColor: Color(0xff04BF68),
                        foregroundColor: Colors.white),
                    child: const Text("Search"),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                controller.userMap != null
                    ? ListTile(
                        onTap: () {
                          Get.to(() => ChatScreen(
                              currentUser: controller.currentMap!['id'],
                              friendId: controller.userMap!['id'],
                              friendName: controller.userMap!['name'],
                              friendImage: controller.userMap!['imageUrl']));
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              controller.userMap!['imageUrl'].toString()),
                          radius: 25,
                        ),
                        title: Text(
                          controller.userMap!['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          controller.userMap!['email'],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(Icons.chat, color: Colors.white),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
