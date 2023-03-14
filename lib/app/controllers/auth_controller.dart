// ignore_for_file: unused_import, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> streamAuthStatus() => auth.authStateChanges();

  login(String emailAddress, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      print("===================");
      print(credential.toString());
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
            title: "perhatian", middleText: "user tidak di temukan");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
            title: "perhatian",
            middleText: "password salah silahkan isi dengan benar!");
      }
    }
  }

  signUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
            title: "perhatian",
            middleText:
                "email anda sudah di pakai silahkan isi dengan email yg lain");
      }
    } catch (e) {
      print(e);
    }
  }
  
  logOut() {
    Get.defaultDialog(
        title: "yakin Log Out?",
        middleText: "Log Out bro",
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bgRed),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Get.offAndToNamed(Routes.LOGIN);
            print("berhasil Log Out");
          },
          child: Text("yes"),
        ),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bgColeb5),
          onPressed: () => Get.back(),
          child: Text("No"),
        ));
  }

  
  resetPassword(String email) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: email);
      Get.toNamed(Routes.EMAIL_CHECK);
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Alert", middleText: "Gagal reset password");
      print(e);
    }
  }
  
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Get.offAllNamed(Routes.HOME);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
