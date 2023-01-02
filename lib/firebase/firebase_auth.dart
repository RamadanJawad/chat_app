import 'package:chat_app/core/shared_perf.dart';
import 'package:chat_app/firebase/FirebaseFireStoreHelper.dart';
import 'package:chat_app/models/UsersModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthController {
  FirebaseAuthController._();
  static FirebaseAuthController firebaseAuthHelper = FirebaseAuthController._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future createAccount(Users user) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      String id = userCredential.user!.uid;

      FirebaseFireStoreHelper.fireStoreHelper.SaveUserData(user, id);
      
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
        margin: EdgeInsets.all(10),
        titleText: const Text(
          "*Note",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontFamily: "Cairo", fontSize: 19, color: Color(0xff04BF68)),
        ),
        messageText: Text(
          e.message!,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontFamily: "Cairo", fontSize: 18),
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
