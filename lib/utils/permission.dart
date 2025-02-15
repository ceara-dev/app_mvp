import 'package:permission_handler/permission_handler.dart';

class NotificationPermission {
   Future<bool> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.notification.request();
      return result.isGranted;
    }
  }

  Future<bool> checkNotificationPermission() async {
    var status = await Permission.notification.status;
    return status.isGranted; 
  }
}
