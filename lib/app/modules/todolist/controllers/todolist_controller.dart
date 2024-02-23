import 'package:get/get.dart';
import 'package:todo_list_test/app/models/todo_model.dart';

import '../../../data/dabasehelper.dart';

class TodolistController extends GetxController {
  //TODO: Implement TodolistController
  var list = <TodoModel>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    list.value = (await DatabaseHelper.queryAllRows()) ?? [];
    print(list.toString());
  }
}
