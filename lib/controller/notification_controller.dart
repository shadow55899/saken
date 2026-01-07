import 'package:get/get.dart';
import 'package:tapbar/models/app_notification.dart';

class NotificationController extends GetxController {
  RxList<AppNotification> notifications = <AppNotification>[].obs;

  void addNotification(String title, String message) {
    notifications.insert(
      0,
      AppNotification(
        title: title,
        message: message,
        time: DateTime.now(),
      ),
    );
  }
}
