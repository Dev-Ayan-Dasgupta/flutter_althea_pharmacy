import 'package:dartz/dartz.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<String, List<NotificationEntity>>> getNotifications();
  Future<Either<String, void>> markAsRead(String id);
  Future<Either<String, void>> markAllAsRead();
  Future<Either<String, void>> deleteNotification(String id);
  Stream<List<NotificationEntity>> watchNotifications();
  int getUnreadCount();
}
