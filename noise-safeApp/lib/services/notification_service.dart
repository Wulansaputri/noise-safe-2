import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  // LOCAL NOTIFICATION
  static final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // INIT
  static Future<void> initialize() async {

    // REQUEST PERMISSION
    await FirebaseMessaging.instance.requestPermission();

    // INIT LOCAL NOTIFICATION
    const AndroidInitializationSettings
        androidSettings =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const InitializationSettings settings =
        InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPlugin
        .initialize(settings);

    // GET FCM TOKEN
    String? token =
        await FirebaseMessaging.instance.getToken();

    print("FCM TOKEN:");
    print(token);

    // FOREGROUND MESSAGE
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {

        showNotification(message);
      },
    );

    // OPEN NOTIFICATION
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {

        print(
          "NOTIFICATION CLICKED",
        );
      },
    );
  }

  // SHOW LOCAL NOTIFICATION
  static Future<void> showNotification(
    RemoteMessage message,
  ) async {

    const AndroidNotificationDetails
        androidDetails =
        AndroidNotificationDetails(
      'noise_safe_channel',
      'Noise Safe Notification',

      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details =
        NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? "No Title",
      message.notification?.body ?? "No Body",
      details,
    );
  }
}