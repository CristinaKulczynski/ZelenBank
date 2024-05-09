import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/domain/entities/notification_entity.dart';

void main() {
  final NotificationEntity tNotificationEntity = NotificationEntity(
    id: 123,
    title: 'title',
    body: 'body',
  );

  test(
      'Should be a notification entity and field data types should be string and integers',
      () {
    expect(tNotificationEntity, isA<NotificationEntity>());
    expect(tNotificationEntity.id, isA<int>());
    expect(tNotificationEntity.title, isA<String>());
  });
}
