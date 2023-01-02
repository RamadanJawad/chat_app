import 'package:chat_app/core/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPassword extends StatelessWidget {
  const CustomPassword({super.key, required this.obscureText, required this.controller, this.function});

  final bool obscureText;
  final TextEditingController controller;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "The field is empty !";
        } else if (value.length < 8) {
          return "The password is too short !";
        }
      },
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(fontFamily: "Roboto", color: Colors.white),
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          labelText: "Enter Your Password",
          labelStyle:
              const TextStyle(color: Colors.white, fontFamily: "Roboto"),
          prefixIcon: const Icon(
            Icons.lock,
            color: Constant.colorSecondary,
          ),
          suffixIcon: InkWell(
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Constant.colorSecondary,
            ),
            onTap: function,
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
