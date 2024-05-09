import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationEntity {
  final int id;
  final String title;
  final String body;
  final String? payload;
  final RemoteMessage? remoteMessage;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
    this.remoteMessage,
  });
}
