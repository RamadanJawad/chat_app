import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/view/screen/auth/launch_screen.dart';
import 'package:chat_app/view/screen/auth/login_screen.dart';
import 'package:chat_app/view/screen/auth/signup_screen.dart';
import 'package:chat_app/view/screen/utils/home_screen.dart';
import 'package:chat_app/view/screen/utils/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPreferences();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 803),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LaunchScreen(),
            getPages: [
              GetPage(name: "/search_screen", page: () => const SearchScreen()),
              GetPage(name: "/home_screen", page: () => const HomeScreen()),
              GetPage(
                  name: "/register_screen", page: () => const SignUpScreen()),
              GetPage(name: "/login_screen", page: () => const LoginScreen()),
            ],
          );
        });
  }
}
