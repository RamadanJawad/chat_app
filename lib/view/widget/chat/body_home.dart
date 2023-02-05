import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/view/screen/utils/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('messages')
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                  animating: true,
                ),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data.docs.length < 1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/chat.png",
                      color: Colors.white,
                      width: double.infinity,
                      height: 200.h,
                    ),
                    Text(
                      "No Chats Available !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          ),
                    ),
                  ],
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var friendId = snapshot.data.docs[index].id;
                    var lastMsg = snapshot.data.docs[index]['last_msg'];
                    return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(friendId)
                          .get(),
                      builder: (context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          var friend = asyncSnapshot.data;
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15).r,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(friend['imageUrl']),
                                  radius: 25.r),
                              title: Text(
                                friend['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                              subtitle: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "$lastMsg",
                                      style: TextStyle(
                                          color: Colors.grey.shade400),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Get.to(() => ChatScreen(
                                    friendId: friend['id'],
                                    friendName: friend['name'],
                                    friendImage: friend['imageUrl'],
                                    currentUser: FirebaseAuth
                                        .instance.currentUser!.uid));
                              },
                            ),
                          );
                        }
                        return const LinearProgressIndicator();
                      },
                    );
                  });
            }
            return Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
                animating: true,
              ),
            );
          });
    });
  }
}
