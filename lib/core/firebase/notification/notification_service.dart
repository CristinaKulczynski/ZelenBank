import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zelenbank/layers/domain/entities/notification_entity.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupAndroidDetails();
    _initializeNotifications();
  }

  _setupAndroidDetails() {
    androidDetails = const AndroidNotificationDetails(
      'main_notification_channel',
      'main channel',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('notification_icon');
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
    );
  }

  showLocalNotification(NotificationEntity notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
    );
  }
}
