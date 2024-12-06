import 'package:flutter/material.dart';
import '../../controllers/chat/chat_viewModel.dart';

class ChatInputWidget extends StatelessWidget {
  final ChatController controller;
  final TextEditingController textController = TextEditingController();

  ChatInputWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (controller.replyingTo.value != null)
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(Icons.reply, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Replying to: ${controller.replyingTo.value!.message}",
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () => controller.cancelReply(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Enter your message",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.sendMessage(textController.text.trim());
                  textController.clear();
                },
                icon: const Icon(Icons.send),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
