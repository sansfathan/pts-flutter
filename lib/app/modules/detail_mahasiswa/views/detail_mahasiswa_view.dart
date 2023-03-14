import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_flutter/app/config/warna.dart';
import 'package:uts_flutter/app/controllers/mahasiswa_controller.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaView extends GetView<DetailMahasiswaController> {
  final mahasiswaController = Get.put(MahasiswaController());
  final listData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    @override
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('DetailMahasiswaView'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 2),
          // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: Container(
            width: lebar,
            height: tinggi * 0.35,
            decoration: BoxDecoration(
                color: siPutih,
                border: Border.all(color: siIreng, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Biodata Mahasiswa",
                    style: TextStyle(
                        color: siIreng,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      "Nama :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    (listData.data()
                                        as Map<String, dynamic>)['namaSiswa'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      "Tempat/Tgl Lahir :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    (listData.data()
                                        as Map<String, dynamic>)['tempatLahir'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    (listData.data() as Map<String, dynamic>)[
                                        'tanggalLahir'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      "Alamat :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    (listData.data()
                                        as Map<String, dynamic>)['alamat'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: Text(
                                      "Nim :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    (listData.data()
                                            as Map<String, dynamic>)['nim']
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      height: tinggi * 0.15,
                      width: lebar * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                (listData.data()
                                    as Map<String, dynamic>)["fotoSiswa"],
                              ),
                              fit: BoxFit.cover)),
                      // child: Image.network(data['fotoSiswa']),
                    ),
                  ],
                ),
              ],
            ),
            // child: ,
          ),
        ));
  }
}

