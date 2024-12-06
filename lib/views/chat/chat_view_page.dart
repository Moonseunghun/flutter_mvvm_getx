import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat/chat_viewModel.dart';
import '../widget/chat_input_widget.dart';

class ChatView extends StatelessWidget {
  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        actions: [
          // IconButton(
          //   // onPressed: controller.switchUser,
          //   icon: const Icon(Icons.swap_horiz),
          //   tooltip: "Switch User",
          // ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final message = controller.messages.reversed.toList()[index];
                  final isCurrentUser = message.sender == controller.currentUser.value;

                  return Align(
                    alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color: isCurrentUser ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: Radius.circular(isCurrentUser ? 12 : 0),
                          bottomRight: Radius.circular(isCurrentUser ? 0 : 12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isCurrentUser)
                            Text(
                              message.sender,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            message.message,
                            style: TextStyle(
                              color: isCurrentUser ? Colors.white : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 10,
                                color: isCurrentUser ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          ChatInputWidget(controller: controller),
        ],
      ),
    );
  }
}
