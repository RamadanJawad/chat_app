import 'package:chat_app/core/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  SingleMessage({required this.message, required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            constraints: BoxConstraints(maxWidth: 220.w),
            decoration: BoxDecoration(
                color: isMe ? Colors.black : Constant.colorSecondary,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Text(
              "$message ",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Tajawal", fontSize: 17.sp),
            )),
      ],
    );
  }
}
