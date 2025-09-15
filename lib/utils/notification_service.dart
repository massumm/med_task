import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// A service class for handling local notifications.
class NotificationService {
  // Static instance of FlutterLocalNotificationsPlugin.
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  /// Initializes the notification service.
  ///
  /// Sets up Android-specific initialization settings and initializes the
  /// notification plugin.
  static Future<void> init() async {
    const AndroidInitializationSettings androidInit =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
    InitializationSettings(android: androidInit);

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {

      },
    );
  }

  /// Shows a local notification.
  ///
  /// [title] The title of the notification.
  /// [body] The body content of the notification.
  static Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'download_channel',
      'Downloads',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _notifications.show(0, title, body, details);
  }
}
