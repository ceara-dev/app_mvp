import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../services/notification_service.dart';
import '../../utils/theme_color.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_button_card.dart';
import '../../widgets/custom_codigo_field.dart';
import '../../widgets/custom_password_field.dart';
import '../../widgets/custom_user_card.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _requestPermissions();
    _configureFirebaseListeners();
    _getToken();
  }

  void _getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print('==============\nTOKEN: $token\n==============');
  }

  void _requestPermissions() {
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }

  void _configureFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        _showNotificationDialog(message.notification);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Handle the notification tap here
    });
  }

  void _showNotificationDialog(RemoteNotification? notification) {
    if (notification == null) return;
    NotificationService().showNotification(
        title: notification.title ?? 'Notification',
        body: notification.body ?? 'No message body');
    /*showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title ?? 'Notification'),
        content: Text(notification.body ?? 'No message body'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    _configureFirebaseListeners();
    return  Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Column(
          children: [
            const CustomUserCard(),
            ElevatedButton(
              child: const Text('INITIATED'),
              onPressed: () {
                 NotificationService().showNotification(
                title: 'Semple title',
                body: 'It works'
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
