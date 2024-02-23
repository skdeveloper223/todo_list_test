import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todolist_controller.dart';

class TodolistView extends GetView<TodolistController> {
  const TodolistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodolistController>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TodolistView'),
          centerTitle: true,
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Container();
        }),
      );
    });
  }
}
