import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/auth_controller.dart';
import 'package:uts_flutter/app/routes/app_pages.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    final forgotC = Get.put(ForgotPasswordController());

    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: tinggi,
        padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: tinggi * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: IconButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Reset Password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    width: 350,
                    child: Text(
                      "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                      style: TextStyle(color: subjudul, fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Email Address",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    child: TextField(
                      controller: forgotC.email,
                      decoration: InputDecoration(
                          labelText: "Enter Your Email",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: border),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: lebar,
                    height: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: bgLogin2),
                        onPressed: () => authC.resetPassword("email"),
                        child: Text(
                          "Send Instructions",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
