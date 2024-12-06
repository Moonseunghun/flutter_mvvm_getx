import '../../model/chat/user_chat.dart';

class ChatService {
  Future<List<ChatMessage>> fetchInitialMessages() async {
    await Future.delayed(Duration(seconds: 1)); // 서버 요청 시뮬레이션
    return [
      ChatMessage(sender: 'Kwayedza', message: '네, 잘 알겠습니다.', timestamp: DateTime.now()),
    ];
  }

  Future<ChatMessage> sendMessage(String message) async {
    await Future.delayed(Duration(milliseconds: 500)); // 전송 딜레이 시뮬레이션
    return ChatMessage(sender: 'Me', message: message, timestamp: DateTime.now());
  }
}
