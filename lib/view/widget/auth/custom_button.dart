import 'package:chat_app/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, required this.function});

  final String name;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          name,
          style: TextStyle(fontFamily: "Roboto"),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Constant.colorSecondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15).r),
            padding: const EdgeInsets.all(15)),
      ),
    );
  }
}
