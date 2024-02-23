import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tododetail_controller.dart';

class TodoDetailView extends GetView<TodoDetailController> {
  const TodoDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
