import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/email_check_controller.dart';

class EmailCheckView extends GetView<EmailCheckController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmailCheckView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EmailCheckView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
