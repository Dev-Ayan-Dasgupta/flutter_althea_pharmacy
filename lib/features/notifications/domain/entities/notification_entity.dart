import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

enum NotificationType {
  newOrder,
  lowStock,
  expiringMedicine,
  orderUpdate,
  paymentReceived,
  systemAlert,
}

enum NotificationPriority { low, medium, high, critical }

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const NotificationEntity._();

  const factory NotificationEntity({
    required String id,
    required NotificationType type,
    required NotificationPriority priority,
    required String title,
    required String message,
    required DateTime timestamp,
    required bool isRead,
    String? actionRoute,
    Map<String, dynamic>? actionData,
    String? imageUrl,
  }) = _NotificationEntity;

  String get typeDisplayName {
    switch (type) {
      case NotificationType.newOrder:
        return 'New Order';
      case NotificationType.lowStock:
        return 'Low Stock Alert';
      case NotificationType.expiringMedicine:
        return 'Expiring Soon';
      case NotificationType.orderUpdate:
        return 'Order Update';
      case NotificationType.paymentReceived:
        return 'Payment Received';
      case NotificationType.systemAlert:
        return 'System Alert';
    }
  }
}
