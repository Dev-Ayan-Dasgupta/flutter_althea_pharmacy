import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../data/repositories/mock_notification_repository.dart';
import 'notification_state.dart';

part 'notification_provider.g.dart';

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  return MockNotificationRepository();
}

@riverpod
class Notifications extends _$Notifications {
  @override
  NotificationState build() {
    loadNotifications();
    return const NotificationState.initial();
  }

  Future<void> loadNotifications() async {
    state = const NotificationState.loading();

    final repository = ref.read(notificationRepositoryProvider);
    final result = await repository.getNotifications();

    result.fold(
      (error) => state = NotificationState.error(error),
      (notifications) => state = NotificationState.loaded(notifications),
    );
  }

  Future<void> markAsRead(String id) async {
    final repository = ref.read(notificationRepositoryProvider);
    await repository.markAsRead(id);
    loadNotifications();
  }

  Future<void> markAllAsRead() async {
    final repository = ref.read(notificationRepositoryProvider);
    await repository.markAllAsRead();
    loadNotifications();
  }

  Future<void> deleteNotification(String id) async {
    final repository = ref.read(notificationRepositoryProvider);
    await repository.deleteNotification(id);
    loadNotifications();
  }

  int getUnreadCount() {
    final repository = ref.read(notificationRepositoryProvider);
    return repository.getUnreadCount();
  }
}
