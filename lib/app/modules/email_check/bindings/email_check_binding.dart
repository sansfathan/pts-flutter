import 'package:get/get.dart';

import '../controllers/email_check_controller.dart';

class EmailCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailCheckController>(
      () => EmailCheckController(),
    );
  }
}
