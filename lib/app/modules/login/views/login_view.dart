import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/auth_controller.dart';
import 'package:uts_flutter/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          body: Container(
            width: lebar,
            height: tinggi,
            padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15, color: siIreng),
                  ),
                ),
                Container(
                  child: Text(
                    "Hi , Welcome back! 🛐",
                    style: TextStyle(color: siIreng, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Email Address",
                    style: TextStyle(color: siIreng, fontSize: 15),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        labelText: "Enter Your Email !",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: siIreng))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Password",
                    style: TextStyle(color: siIreng, fontSize: 15),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: controller.password,
                    style: TextStyle(color: siIreng),
                    cursorColor: siIreng,
                    obscureText: controller.showHidePw.value ? false : true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.changeEyes(),
                          icon: Icon(
                            controller.showHidePw.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: siIreng,
                          ),
                        ),
                        labelText: "Enter Your Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: siIreng),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                    child: Text(
                      "Fogot Password",
                      style:
                          TextStyle(fontSize: 15, color: Color(0xfff1B1B1b1)),
                    ),
                  ),
                ),
                Container(
                  width: lebar,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: siIreng)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: siPutih),
                      onPressed: () => authC.login(
                          controller.email.text, controller.password.text),
                      // onPressed: () => Get.toNamed(Routes.HOME_ADMIN),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: siIreng),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        child: Divider(
                          color: siIreng,
                        ),
                      ),
                      Text(
                        "Or Login With",
                        style: TextStyle(fontSize: 15, color: siIreng),
                      ),
                      Container(
                        width: 120,
                        child: Divider(
                          color: siIreng,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: lebar * 0.85,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: siPutih),
                      // onPressed: () => authC.signInWithGoogle(),
                      onPressed: () => authC.signInWithGoogle(),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Image.asset("image/Google.png")),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Google",
                              style: TextStyle(fontSize: 20, color: siIreng),
                            ),
                          )
                        ],
                      )),
                  decoration: BoxDecoration(
                      border: Border.all(color: siIreng),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Dont`have an account?",
                            style: TextStyle(color: siIreng),
                          )),
                      TextButton(
                          onPressed: () => Get.toNamed("/register"),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: siIreng, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
