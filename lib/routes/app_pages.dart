import 'package:anychat_demo/views/chat/chat_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bindings/chat_binding/chat_binding.dart';
import '../bindings/login_binding/login_binding.dart';
import '../views/auth/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
