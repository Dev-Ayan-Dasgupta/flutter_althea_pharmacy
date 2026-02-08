import 'package:dartz/dartz.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';

class MockNotificationRepository implements NotificationRepository {
  final List<NotificationEntity> _mockNotifications = [
    NotificationEntity(
      id: 'NOTIF001',
      type: NotificationType.newOrder,
      priority: NotificationPriority.critical,
      title: 'New Emergency Order!',
      message:
          'Order #ALT2026001 from Ramesh Kumar requires immediate attention',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      actionRoute: '/home/order/ORD001',
    ),
    NotificationEntity(
      id: 'NOTIF002',
      type: NotificationType.lowStock,
      priority: NotificationPriority.high,
      title: 'Low Stock Alert',
      message: 'Metformin (500mg) is running low. Only 15 units remaining.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
      actionRoute: '/home/inventory',
    ),
    NotificationEntity(
      id: 'NOTIF003',
      type: NotificationType.expiringMedicine,
      priority: NotificationPriority.medium,
      title: 'Medicines Expiring Soon',
      message: 'Vitamin C (500mg) expires in 15 days. Consider promotions.',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: false,
      actionRoute: '/home/inventory',
    ),
    NotificationEntity(
      id: 'NOTIF004',
      type: NotificationType.paymentReceived,
      priority: NotificationPriority.low,
      title: 'Payment Received',
      message: '₹1,230.00 credited for Order #ALT2026005',
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: true,
      actionRoute: '/home/wallet',
    ),
    NotificationEntity(
      id: 'NOTIF005',
      type: NotificationType.orderUpdate,
      priority: NotificationPriority.medium,
      title: 'Order Delivered',
      message: 'Order #ALT2026003 has been successfully delivered',
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      isRead: true,
    ),
    NotificationEntity(
      id: 'NOTIF006',
      type: NotificationType.systemAlert,
      priority: NotificationPriority.low,
      title: 'App Update Available',
      message: 'Version 1.1.0 is now available. Update for new features!',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
  ];

  @override
  Future<Either<String, List<NotificationEntity>>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      _mockNotifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return Right(_mockNotifications);
    } catch (e) {
      return Left('Failed to load notifications: $e');
    }
  }

  @override
  Future<Either<String, void>> markAsRead(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final index = _mockNotifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        _mockNotifications[index] = _mockNotifications[index].copyWith(
          isRead: true,
        );
      }
      return const Right(null);
    } catch (e) {
      return Left('Failed to mark as read: $e');
    }
  }

  @override
  Future<Either<String, void>> markAllAsRead() async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      for (var i = 0; i < _mockNotifications.length; i++) {
        _mockNotifications[i] = _mockNotifications[i].copyWith(isRead: true);
      }
      return const Right(null);
    } catch (e) {
      return Left('Failed to mark all as read: $e');
    }
  }

  @override
  Future<Either<String, void>> deleteNotification(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      _mockNotifications.removeWhere((n) => n.id == id);
      return const Right(null);
    } catch (e) {
      return Left('Failed to delete notification: $e');
    }
  }

  @override
  Stream<List<NotificationEntity>> watchNotifications() {
    return Stream.periodic(
      const Duration(seconds: 10),
      (_) => _mockNotifications,
    );
  }

  @override
  int getUnreadCount() {
    return _mockNotifications.where((n) => !n.isRead).length;
  }
}
