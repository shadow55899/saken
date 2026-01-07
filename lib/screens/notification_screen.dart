import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapbar/controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications".tr)),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Text(
              "No notifications yet".tr,
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final n = controller.notifications[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  n.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(n.message),
                trailing: Text(
                  "${n.time.hour.toString().padLeft(2, '0')}:${n.time.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
