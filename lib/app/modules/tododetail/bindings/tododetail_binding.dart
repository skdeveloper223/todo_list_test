import 'package:get/get.dart';

import '../controllers/tododetail_controller.dart';

class TodoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoDetailController>(
      () => TodoDetailController(),
    );
  }
}
