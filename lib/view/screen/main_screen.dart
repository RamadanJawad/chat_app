import 'package:chat_app/controller/home_controller.dart';
import 'package:chat_app/view/widget/body_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return const Scaffold(
        backgroundColor: Color(0xff292F3F),
        body:BodyMain() );
  }
}
