import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
              width: lebar,
              height: tinggi,
              decoration: BoxDecoration(color: siPutih),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5, top: 5),
                    child: IconButton(
                      onPressed: () => Get.toNamed("/login"),
                      icon: Icon(Icons.arrow_back),
                      iconSize: 24,
                      color: siIreng,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: siIreng,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Email Address",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: siIreng),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 15),
                          child: TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                labelText: "Enter Your Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: siIreng),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Mobile Phone",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: siIreng),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                              // controller: controller.password,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Enter Your Mobile Phone",
                                  prefixIcon: Container(
                                    width: lebar * 0.13,
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            child: Text(
                                              "+62",
                                              style: TextStyle(
                                                  fontSize: 17, color: siIreng),
                                            )),
                                        Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 5, 0, 5),
                                            height: tinggi * 0.04,
                                            child: VerticalDivider(
                                              color: siIreng,
                                              width: 2,
                                            ))
                                      ],
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: siIreng),
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: siIreng,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextField(
                            controller: controller.password,
                            style: TextStyle(color: siIreng),
                            cursorColor: siIreng,
                            obscureText:
                                controller.showHidePw.value ? false : true,
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
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: lebar,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: siIreng)),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: siPutih),
                              onPressed: () => authC.signUp(
                                  controller.email.text,
                                  controller.password.text),
                              // onPressed: () {},
                              child: Text(
                                "Sign Up",
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
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: siPutih),
                              // onPressed: () => authC.signInWithGoogle(),
                              onPressed: () {},
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Image.asset("image/Google.png")),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Google",
                                      style: TextStyle(
                                          fontSize: 20, color: siIreng),
                                    ),
                                  )
                                ],
                              )),
                          decoration: BoxDecoration(
                              border: Border.all(color: siIreng),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "have an account?",
                                  style: TextStyle(color: siIreng),
                                )),
                            TextButton(
                                onPressed: () => Get.toNamed("/login"),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: siIreng,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
