import 'package:get/get.dart';

import '../controllers/create_data_controller.dart';

class CreateDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDataController>(
      () => CreateDataController(),
    );
  }
}
