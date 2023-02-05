// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/view/widget/auth/drawer_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/view/screen/auth/login_screen.dart';
import 'package:chat_app/view/screen/utils/search_screen.dart';
import 'package:chat_app/view/widget/chat/body_home.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Constant.colorSecondary,
      ),
      drawer: Drawer(
          backgroundColor: Constant.colorPrimary,
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data['imageUrl'].toString()),
                    radius: 50.r,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    snapshot.data['name'],
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Constant.colorSecondary),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const DrawerItem(name: "Profile", icon: Icons.person),
                  const Divider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                  ),
                  const DrawerItem(name: "New Groupe", icon: Icons.group_add),
                  const Divider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                  ),
                  const DrawerItem(
                    name: "Settings",
                    icon: Icons.settings,
                  ),
                  const Divider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                  ),
                  DrawerItem(
                    name: "Logout",
                    icon: Icons.logout,
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offNamed("/login_screen");
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    endIndent: 10,
                    indent: 10,
                  ),
                ],
              );
            },
          )),
      body: const BodyHome(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.chat),
        label: const Text(
          "new chat",
        ),
        backgroundColor: Constant.colorSecondary,
        onPressed: () {
          Get.to(() => const SearchScreen(), transition: Transition.fade);
        },
      ),
    );
  }
}
