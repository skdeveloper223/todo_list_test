import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list_test/app/models/todo_model.dart';

import '../../../data/dabasehelper.dart';
import '../../../data/utils.dart';

class TodoaddController extends GetxController {
  //TODO: Implement TodoaddController
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final dateTimeController = TextEditingController();
  DateTime? time;
  var status = false.obs;
  @override
  void onInit() {
    print(status.toString());
    super.onInit();
  }

  validation() async {
    if (Utils().isValidationEmpty(nameController.text)) {
      Utils().showToast(message: "Please enter name", context: Get.context!);
    } else if (Utils().isValidationEmpty(descController.text)) {
      Utils().showToast(message: "Please enter description", context: Get.context!);
    } else if (Utils().isValidationEmpty(dateTimeController.text)) {
      Utils().showToast(message: "Please select time", context: Get.context!);
    } else {
      var item = TodoModel(name: nameController.text, description: descController.text, timeTemp: time!.millisecondsSinceEpoch, status: status.value);
      var id = await DatabaseHelper.insert(item);
      printAction(id.toString());
    }
  }
}
