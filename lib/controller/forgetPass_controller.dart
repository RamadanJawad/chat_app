import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController{
  late TextEditingController email;
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    
  }
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    
  }
}