import 'package:chat_app/core/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageTextField extends StatelessWidget {
  final String currentId;
  final String friendId;

  MessageTextField(this.currentId, this.friendId);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constant.colorPrimary,
      padding: const EdgeInsetsDirectional.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Type your Message",
                hintStyle: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 18.sp,
                    color: Colors.white),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20).r),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20).r)),
          )),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () async {
              if (controller.text.isNotEmpty) {
                String message = controller.text;
                controller.clear();
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(currentId)
                    .collection('messages')
                    .doc(friendId)
                    .collection('chats')
                    .add({
                  "senderId": currentId,
                  "receiverId": friendId,
                  "message": message,
                  "type": "text",
                  "time": DateTime.now(),
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(currentId)
                      .collection('messages')
                      .doc(friendId)
                      .set({
                    'last_msg': message,
                  });
                });

                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(friendId)
                    .collection('messages')
                    .doc(currentId)
                    .collection("chats")
                    .add({
                  "senderId": currentId,
                  "receiverId": friendId,
                  "message": message,
                  "type": "text",
                  "time": DateTime.now(),
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(friendId)
                      .collection('messages')
                      .doc(currentId)
                      .set({"last_msg": message});
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration:const BoxDecoration(
                  shape: BoxShape.circle, color: Constant.colorSecondary),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
