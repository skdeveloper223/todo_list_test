import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils.dart';
import '../controllers/todoadd_controller.dart';

class TodoaddView extends GetView<TodoaddController> {
  const TodoaddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TodoaddView'),
          centerTitle: true,
        ),
        body: GetBuilder<TodoaddController>(builder: (logic) {
          return Column(
            children: [
              TextField(
                controller: controller.nameController,
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: controller.descController,
                keyboardType: TextInputType.text,
              ),
              TextField(
                onTap: () {
                  Utils().selectDate(context);
                },
                controller: controller.dateTimeController,
                keyboardType: TextInputType.text,
                enabled: true,
              ),
              Switch(
                  value: controller.status.value,
                  onChanged: (value) {
                    controller.status.value = value;
                  }),
              ElevatedButton(
                onPressed: () {
                  controller.validation();
                },
                child: const Text("Submit"),
              )
            ],
          );
        }));
  }
}
