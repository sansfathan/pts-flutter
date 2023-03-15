// import 'dart:html';

// ignore_for_file: unused_import, unused_local_variable

// import 'dart:html';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/routes/app_pages.dart';

class MahasiswaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  File? path;
  String url = '';

  addData(String alamat, String fotoSiswa, String namaSiswa, int nim,
      String tanggalLahir, String tempatLahir) async {
    CollectionReference mahaSiswa = firestore.collection('crud-mahasiswa');

    final mahaSiswaData = {
      "alamat": alamat,
      "fotoSiswa": fotoSiswa,
      "namaSiswa": namaSiswa,
      "nim": nim,
      "tanggalLahir": tanggalLahir,
      "tempatLahir": tempatLahir
    };
    try {
      await mahaSiswa.add(mahaSiswaData).then((DocumentReference doc) =>
          Get.defaultDialog(
              title: "Alert",
              middleText: "Berhasil menambahkan data mahasiswa"));
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.defaultDialog(
          title: "Alert", middleText: "Gagal menambahkan data mahasiswa");
      print(e);
    }
  }

  updateData(String id, String alamat, String fotoSiswa, String namaSiswa,
      int nim, String tanggalLahir, String tempatLahir) async {
    final mahasiswaData = {
      "alamat": alamat,
      "fotoSiswa": fotoSiswa,
      "namaSiswa": namaSiswa,
      "nim": nim,
      "tanggalLahir": tanggalLahir,
      "tempatLahir": tempatLahir
    };
    try {
      DocumentReference mahaSiswa =
          firestore.collection('crud-mahasiswa').doc(id);
      await mahaSiswa.update(mahasiswaData);

      Get.defaultDialog(title: 'Alert', middleText: '😊 berhasil menupdate data 😊');
      Get.offNamed(Routes.HOME);
      log("👉👉👉👉👉👉👉👉");
      print(mahasiswaData);
    } catch (error) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menUpdate data');
      log("👉👉👉👉👉👉👉👉 😱😱😱😱😱");
      print(mahasiswaData);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference Slider = firestore.collection('crud-mahasiswa').doc(id);

      Get.defaultDialog(
          title: "yakin Delete ?",
          middleText: "😱😱😱",
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: bgRed),
            onPressed: () async {
              await Slider.delete();
              // await FirebaseAuth.instance.delete();
              Get.offAndToNamed(Routes.HOME);
              print("berhasil Delete");
            },
            child: Text("yes"),
          ),
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: bgColeb5),
            onPressed: () => Get.back(),
            child: Text("No"),
          ));
      // return Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal mendelete data');
      print(e);
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference mahaSiswa = firestore.collection("crud-mahasiswa");

    return await mahaSiswa.get();
  }

  addPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;

      // try {
      await storage.ref("${namaFile}").putFile(file);
      final data = await storage.ref("${namaFile}").getDownloadURL();
      url = data;

      print("Success ======================================");
      print(url);

      return url;
      // } catch (e) {
      //   print("gagal upload ==============================================");
      // }
    } else {
      print("tidak mengirim filename ===================================");
    }
  }
}
