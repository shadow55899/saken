import 'package:apartment/controller/login_controller.dart';
import 'package:apartment/providers/user_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          onPressed: () {
            controller.logout();
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
