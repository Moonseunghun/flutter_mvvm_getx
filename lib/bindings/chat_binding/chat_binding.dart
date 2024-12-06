import 'package:get/get.dart';

import '../../controllers/auth/login_view_model.dart';
import '../../controllers/chat/chat_viewModel.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<LoginController>(() => LoginController());

  }
}
