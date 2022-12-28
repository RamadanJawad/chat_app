import 'package:chat_app/view/screen/launch_screen.dart';
import 'package:chat_app/view/screen/login_screen.dart';
import 'package:chat_app/view/screen/main_screen.dart';
import 'package:chat_app/view/screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
              GetPage(name: "/main_screen", page: () => const MainScreen()),
              GetPage(
                  name: "/register_screen", page: () => const SignUpScreen()),
              GetPage(name: "/login_screen", page: () => const LoginScreen()),
            ],
          );
        });
  }
}
