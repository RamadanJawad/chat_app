import 'package:chat_app/controller/chat_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/view/widget/chat/message.dart';
import 'package:chat_app/view/widget/chat/single_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final String currentUser;
  final String friendId;
  final String friendName;
  final String friendImage;

  const ChatScreen({
    required this.friendId,
    required this.friendName,
    required this.friendImage,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        backgroundColor: Constant.colorSecondary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(friendImage),
              radius: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(friendId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      child: Column(
                        children: [
                          Text(friendName),
                          Text(
                            snapshot.data!['status'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xff292F3F),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(currentUser)
                    .collection('messages')
                    .doc(friendId)
                    .collection('chats')
                    .orderBy("date", descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length < 1) {
                      return const Center(
                        child: Text("Say Hi"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        reverse: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          bool isMe = snapshot.data.docs[index]['senderId'] ==
                              currentUser;
                          return SingleMessage(
                              message: snapshot.data.docs[index]['message'],
                              isMe: isMe);
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          )),
          MessageTextField(currentUser, friendId),
        ],
      ),
    );
  }
}
