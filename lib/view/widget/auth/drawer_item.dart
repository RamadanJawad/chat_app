import 'package:chat_app/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.name, required this.icon, this.onTap});

  final String name;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: Constant.colorPrimary,
            padding: const EdgeInsets.all(10),
            elevation: 0),
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          name,
          style: GoogleFonts.lato(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
