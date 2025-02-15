import 'package:firebase_messaging/firebase_messaging.dart';

class MyFirebaseMessaging {
  Future<void> setupFirebaseMessaging() async {
    await FirebaseMessaging.instance.requestPermission();

    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print("Token FCM: $token");
    } else {
      print("Falha ao obter o token FCM");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print("Novo token FCM: $newToken");
    });
  }
}
