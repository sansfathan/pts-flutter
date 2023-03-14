import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateDataController extends GetxController {
  final data = Get.arguments;

  TextEditingController fotoSiswa = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nim = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    fotoSiswa.text = (data.data() as Map<String, dynamic>)['fotoSiswa'];
    namaSiswa.text = (data.data() as Map<String, dynamic>)['namaSiswa'];
    tempatLahir.text = (data.data() as Map<String, dynamic>)['tempatLahir'];
    tanggalLahir.text = (data.data() as Map<String, dynamic>)['tanggalLahir'];
    alamat.text = (data.data() as Map<String, dynamic>)['alamat'];
    nim.text = (data.data() as Map<String, dynamic>)['nim'].toString();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
