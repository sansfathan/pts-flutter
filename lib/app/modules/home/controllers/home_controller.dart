import 'dart:developer';

import 'package:get/get.dart';
import 'package:uts_flutter/app/controllers/mahasiswa_controller.dart';

class HomeController extends GetxController {
  // ignore: todo
  //TODO: Implement HomeController
  var data;

  final count = 0.obs;
  @override
  void onInit() {
    data = MahasiswaController().getData();
    super.onInit();
    log("======👈👈 🛐🛐🛐🛐 👉👉");
    print(data);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
