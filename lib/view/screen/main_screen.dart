import 'dart:io';
import 'package:chat_app/core/shared_perf.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String path = SharedPrefController().image!;
    return Scaffold(
        backgroundColor: Color(0xff292F3F),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: FileImage(File(path)),
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    SharedPrefController().username!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Tajawal",
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
