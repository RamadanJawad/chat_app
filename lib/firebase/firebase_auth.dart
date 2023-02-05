import 'package:chat_app/core/constant.dart';
import 'package:chat_app/firebase/FirebaseFireStoreHelper.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirebaseAuthController {
  FirebaseAuthController._();
  static FirebaseAuthController firebaseAuthHelper = FirebaseAuthController._();

  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid;
  String? id;

  Future createAccount(Users user) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      uid = userCredential.user!.uid;
      FirebaseFireStoreHelper.fireStoreHelper.SaveUserData(user, uid!);
      // SharedPrefController().saveUid(uid: id);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password is too weak");
      } else if (e.code == "email-already-in-use") {
        print("The email already exists for that email");
      } else if (e.code == "invalid-email") {
        print("The email invalid");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> signIn(Users users) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: users.email!, password: users.password!);
      id = userCredential.user!.uid;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-disabled") {
        print("The password is too weak");
      } else if (e.code == "user-not-found") {
        print("The email already exists for that email");
      } else if (e.code == "invalid-email") {
        print("The email invalid");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future resetPassword(Users users) async {
    try {
      await auth.sendPasswordResetEmail(email: users.email!);
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar(
        "",
        "",
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(10),
        titleText: Text(
          "*Note",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 19.sp, color: Constant.colorSecondary),
        ),
        messageText: Text(
          e.message!,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 18.sp),
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future signOut() async {
    await auth.signOut();
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }
}
