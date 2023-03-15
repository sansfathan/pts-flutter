import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/controllers/auth_controller.dart';
import 'package:uts_flutter/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: controller.streamAuthStatus(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          } else {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
