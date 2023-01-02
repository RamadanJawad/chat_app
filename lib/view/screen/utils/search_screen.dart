import 'package:chat_app/controller/search_controller.dart';
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/view/widget/chat/body_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController());
    return Scaffold(
        backgroundColor: Constant.colorPrimary,
        appBar: AppBar(
          backgroundColor: Constant.colorSecondary,
          title: Text("Search in Users"),
        ),
        body: BodyMain());
  }
}
