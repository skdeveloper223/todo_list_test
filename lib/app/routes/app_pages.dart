import 'package:get/get.dart';

import '../modules/todoadd/bindings/todoadd_binding.dart';
import '../modules/todoadd/views/todoadd_view.dart';
import '../modules/tododetail/bindings/tododetail_binding.dart';
import '../modules/tododetail/views/tododetail_view.dart';
import '../modules/todolist/bindings/todolist_binding.dart';
import '../modules/todolist/views/todolist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TODOLIST;

  static final routes = [
    GetPage(
      name: _Paths.TODOLIST,
      page: () => const TodolistView(),
      binding: TodolistBinding(),
    ),
    GetPage(
      name: _Paths.TODOADD,
      page: () => const TodoaddView(),
      binding: TodoaddBinding(),
    ),
    GetPage(
      name: _Paths.TODODETAIL,
      page: () => const TodoDetailView(),
      binding: TodoDetailBinding(),
    ),
  ];
}
