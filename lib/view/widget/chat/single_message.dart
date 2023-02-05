import 'package:chat_app/core/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;
  SingleMessage(
      {required this.message, required this.isMe, required this.time});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                constraints: BoxConstraints(maxWidth: 220.w),
                decoration: BoxDecoration(
                    color: isMe ? Colors.orange : Constant.colorSecondary,
                    borderRadius: isMe
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))
                        : const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                child: Text(
                  "$message ",
                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                )),
          ],
        ),
        Container(
          margin: isMe
              ? const EdgeInsets.only(right: 20)
              : const EdgeInsets.only(left: 20),
          width: double.infinity,
          child: Text(
            time,
            style: TextStyle(color: Colors.white60),
            textAlign: isMe ? TextAlign.right : TextAlign.left,
          ),
        ),
      ],
    );
  }
}
