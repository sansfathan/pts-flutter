import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uts_flutter/app/controllers/mahasiswa_controller.dart';

class CreateDataController extends GetxController {
  final active = true.obs;

  TextEditingController fotoSiswa = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nim = TextEditingController();


  uploadGambar() async{
    String data = await MahasiswaController().addPhoto();
    fotoSiswa.text = data;
    print(data);
  }
 
  final count = 0.obs;
  @override
  void onInit() {
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
