// ignore_for_file: unused_local_variable, dead_code, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/auth_controller.dart';
import 'package:uts_flutter/app/controllers/mahasiswa_controller.dart';
import 'package:uts_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  DateTime date = DateTime(2022, 11, 11);
  final mahasiswa = Get.put(MahasiswaController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Mahasiswa"),
          centerTitle: true,
          backgroundColor: siIreng,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () => authC.logOut(),
                child: Icon(
                  Icons.logout_outlined,
                  color: siPutih,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('${date.year}/${date.month}/${date.day}'),
              // Container(
              //   width: lebar,
              //   height: 60,
              //   decoration: BoxDecoration(color: Colors.deepPurple.shade600),
              //   child: Container(
              //     margin: EdgeInsets.only(top: 20),
              //     child: Text(
              //       "DATA MAHASISWA",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: siPutih, fontStyle: FontStyle.italic),
              //     ),
              //   ),
              // ),
              FutureBuilder<QuerySnapshot<Object?>>(
                  future: mahasiswa.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var dataMahasiswa = snapshot.data!.docs;
                      return Wrap(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(dataMahasiswa.length, (index) {
                              return dataMahaSiswa(
                                  // MahasiswaController().deleteData("id"),
                                  foto: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["fotoSiswa"],
                                  nama: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["namaSiswa"],
                                  TtLahir: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["tempatLahir"],
                                  TtLahir2: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["tanggalLahir"],
                                  alamat: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["alamat"],
                                  nim: (dataMahasiswa[index].data()
                                      as Map<String, dynamic>)["nim"],
                                  arguments: dataMahasiswa[index],
                                  delete: (dataMahasiswa[index].id));
                            })),
                      ]);
                      ;
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.CREATE_DATA),
          child: Icon(Icons.add),
        ));
  }
}

Widget dataMahaSiswa(
    {foto, nama, TtLahir, TtLahir2, alamat, nim, arguments, delete, update}) {
  final mahaC = Get.put(MahasiswaController());
  return InkWell(
    onTap: () => Get.toNamed(Routes.DETAIL_MAHASISWA, arguments: arguments),
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 8, right: 8),
        width: 540,
        height: 175,
        decoration: BoxDecoration(
            border: Border.all(color: siIreng),
            borderRadius: BorderRadius.circular(10)),
        // decoration: BoxDecoration(color: Colors.red),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 100,
            height: 110,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              foto,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        "Name :",
                        style: TextStyle(color: siIreng),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, left: 5),
                      child: Text(
                        nama,
                        style: TextStyle(fontSize: 14, color: siIreng),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          "Tempat / Tanggal Lahir :",
                          style: TextStyle(color: siIreng),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 5),
                        child: Text(
                          TtLahir,
                          style: TextStyle(fontSize: 12, color: siIreng),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 5),
                        child: Text(
                          TtLahir2,
                          style: TextStyle(fontSize: 12, color: siIreng),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          "Alamat :",
                          style: TextStyle(color: siIreng),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 5),
                        child: Text(
                          alamat,
                          style: TextStyle(fontSize: 14, color: siIreng),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          "Nim :",
                          style: TextStyle(color: siIreng),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 5),
                        child: Text(
                          nim.toString(),
                          style: TextStyle(fontSize: 14, color: siPutih),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 165),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.UPDATE_DATA,
                              arguments: arguments),
                          child: Text("Update"),
                          style: ElevatedButton.styleFrom(
                            primary:
                                Colors.green, // warna latar belakang tombol
                            textStyle: TextStyle(
                              fontSize: 15, // ukuran teks pada tombol
                              fontWeight:
                                  FontWeight.bold, // tebal teks pada tombol
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10), // padding tombol
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // bentuk tombol
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                          onPressed: () => mahaC.deleteData(delete),
                          child: Text("Delete"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // warna latar belakang tombol
                            textStyle: TextStyle(
                              fontSize: 15, // ukuran teks pada tombol
                              fontWeight:
                                  FontWeight.bold, // tebal teks pada tombol
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10), // padding tombol
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // bentuk tombol
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ),
  );
}
