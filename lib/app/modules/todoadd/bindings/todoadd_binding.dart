import 'package:get/get.dart';

import '../controllers/todoadd_controller.dart';

class TodoaddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoaddController>(
      () => TodoaddController(),
    );
  }
}
