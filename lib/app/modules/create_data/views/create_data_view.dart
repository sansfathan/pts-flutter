// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/mahasiswa_controller.dart';
import 'package:uts_flutter/app/modules/detail_mahasiswa/controllers/detail_mahasiswa_controller.dart';

import '../controllers/create_data_controller.dart';

class CreateDataView extends GetView<CreateDataController> {
  DateTime date = DateTime.now();
  final mahasiswaC = Get.put(MahasiswaController());
  final createC = Get.put(CreateDataController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create data mahasiswa'),
        centerTitle: true,
        backgroundColor: siIreng,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: ElevatedButton(
                          onPressed: () => controller.uploadGambar(),
                          child: Text("Upload Gambar")),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CustomInput(
                          controller: controller.namaSiswa,
                          label: 'nama mahasiswa ',
                          hint: 'Masukkan nama mahasiswa',
                          obscure: false),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CustomInput(
                          controller: controller.tempatLahir,
                          label: 'nama tempat Lahir ',
                          hint: 'Masukkan tempat lahir',
                          obscure: false),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CustomInput(
                          controller: controller.tanggalLahir,
                          label: 'nama tanggal Lahir ',
                          hint: 'Masukkan tanggal lahir',
                          obscure: false),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CustomInput(
                          controller: controller.alamat,
                          label: 'nama alamat ',
                          hint: 'Masukkan alamat',
                          obscure: false),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CustomInput(
                          controller: controller.nim,
                          label: 'nama nim ',
                          hint: 'Masukkan nim',
                          obscure: false),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              margin: EdgeInsets.only(top: 40),
              child: InkWell(
                  onTap: () {
                    mahasiswaC.addData(
                        controller.alamat.text,
                        controller.fotoSiswa.text,
                        controller.namaSiswa.text,
                        int.parse(
                          controller.nim.text,
                        ),
                        controller.tanggalLahir.text,
                        controller.tempatLahir.text);
                  },
                  child: Container(
                    width: lebar,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: siPutih,
                        border: Border.all(color: siIreng, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Buat Slider',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

Widget CustomInput({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: bgPolos1,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: siIreng, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}

Widget CustomInput2({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: bgPolos1,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: siIreng, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}
