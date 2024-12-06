import 'package:get/get.dart';
import '../../model/chat/user_chat.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var currentUser = "User1".obs;
  var replyingTo = Rx<ChatMessage?>(null);


  final Map<String, List<String>> _autoReplies = {
    "hello": ["안녕 !", "웬일ㄹ로 ?", "ㅇㅇ 다음에 보자 "],
    "how are you": ["I'm fine, thank you! How about you?", "I'm doing great!"],
    "bye": ["Goodbye!", "See you soon!", "Take care!"],
    "default": ["I'm not sure how to respond to that.", "Can you elaborate?"],
  };


  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(ChatMessage(
        sender: currentUser.value,
        message: message,
        timestamp: DateTime.now(),
      ));

      replyingTo.value = null;

      _generateAutoReply(message);
    }
  }

  // 자동 답변 생성 함수
  void _generateAutoReply(String userMessage) {
    // 상대방(봇)으로 전환
    Future.delayed(const Duration(seconds: 1), () {
      String botReply = _getAutoReply(userMessage.toLowerCase());
      messages.add(ChatMessage(
        sender: "Bot",
        message: botReply,
        timestamp: DateTime.now(),
      ));
    });
  }

  // 자동 답변 선택 로직
  String _getAutoReply(String userMessage) {
    for (final key in _autoReplies.keys) {
      if (userMessage.contains(key)) {
        final replies = _autoReplies[key]!;
        return replies[_randomIndex(replies.length)];
      }
    }
    // 기본 답변
    final defaultReplies = _autoReplies["default"]!;
    return defaultReplies[_randomIndex(defaultReplies.length)];
  }

  // 랜덤 인덱스 생성
  int _randomIndex(int length) => (length > 1) ? (DateTime.now().millisecondsSinceEpoch % length) : 0;

  // Reply 관련 함수들
  void replyToMessage(ChatMessage message) {
    replyingTo.value = message;
  }

  void cancelReply() {
    replyingTo.value = null;
  }
}
