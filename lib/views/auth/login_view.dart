import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/login_view_model.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  controller.login(
                    usernameController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                child: const Text("Login"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
