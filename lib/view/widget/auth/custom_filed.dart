import 'package:chat_app/core/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "The field is empty !";
        }
      },
      style: const TextStyle(fontFamily: "Roboto", color: Colors.white),
      decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: Colors.white, fontFamily: "Roboto"),
          prefixIcon: const Icon(
            Icons.person,
            color: Constant.colorSecondary,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: const BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: const BorderSide(color: Colors.white))),
    );
  }
}
