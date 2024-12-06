import 'package:get/get.dart';

import '../../services/auth/auth_service.dart';
import '../../services/chat/chat_service.dart';

class InitialViewModel implements  Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<ChatService>(() => ChatService());

  }
}