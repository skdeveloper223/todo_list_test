import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoDetailController extends GetxController {
  final nameController = TextEditingController();
  final decsController = TextEditingController();
  final dateTimeController = TextEditingController();
  var status = false.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
