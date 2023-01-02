import 'package:chat_app/controller/photo_controller.dart';
import 'package:chat_app/view/widget/auth/body_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPhotoScreen extends StatelessWidget {
  const SelectPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SelectPhotoController controller = Get.put(SelectPhotoController());
    return const Scaffold(
        backgroundColor: const Color(0xff292F3F), body: BodySelectPhoto());
  }
}
