import 'package:chat_app/controller/photo_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get_state_manager/get_state_manager.dart';

class BodySelectPhoto extends StatelessWidget {
  const BodySelectPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectPhotoController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: controller.file == null
                        ? null
                        : FileImage(File(controller.file!.path)),
                    child: controller.file == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Color(0xff04BF68),
                          )
                        : null),
              ),
            )
          ],
        );
      },
    );
  }
}
