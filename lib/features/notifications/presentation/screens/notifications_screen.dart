import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/extensions.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../../domain/entities/notification_entity.dart';
import '../providers/notification_provider.dart';
import '../providers/notification_state.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  bool _showUnreadOnly = false;

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: const Text('Mark all as read'),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(context);
                    ref.read(notificationsProvider.notifier).markAllAsRead();
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    _showUnreadOnly ? Icons.visibility_off : Icons.visibility,
                  ),
                  title: Text(
                    _showUnreadOnly ? 'Show all' : 'Show unread only',
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(context);
                    setState(() => _showUnreadOnly = !_showUnreadOnly);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(notificationsProvider.notifier).loadNotifications(),
        color: AppColors.primaryDark,
        child: notificationState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
            ),
          ),
          loaded: (notifications) {
            final filteredNotifications = _showUnreadOnly
                ? notifications.where((n) => !n.isRead).toList()
                : notifications;

            if (filteredNotifications.isEmpty) {
              return _buildEmptyState(isDark);
            }

            return ResponsiveContainer(
              child: ListView.separated(
                padding: ResponsivePadding.all(context),
                itemCount: filteredNotifications.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _NotificationCard(
                    notification: filteredNotifications[index],
                    onTap: () {
                      final notification = filteredNotifications[index];
                      if (!notification.isRead) {
                        ref
                            .read(notificationsProvider.notifier)
                            .markAsRead(notification.id);
                      }
                      if (notification.actionRoute != null) {
                        context.go(notification.actionRoute!);
                      }
                    },
                    onDismissed: () {
                      ref
                          .read(notificationsProvider.notifier)
                          .deleteNotification(filteredNotifications[index].id);
                    },
                  );
                },
              ),
            );
          },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.error.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading notifications',
                  style: AppTypography.titleMedium(AppColors.error),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: AppTypography.bodyMedium(
                    Theme.of(context).textTheme.bodyMedium!.color!,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradientSubtle,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _showUnreadOnly
                  ? Icons.mark_email_read
                  : Icons.notifications_none,
              size: 60,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _showUnreadOnly ? 'All caught up!' : 'No notifications yet',
            style: AppTypography.headlineSmall(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              _showUnreadOnly
                  ? 'You have no unread notifications'
                  : 'New notifications will appear here',
              style: AppTypography.bodyMedium(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Notification Card Widget
class _NotificationCard extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  const _NotificationCard({
    required this.notification,
    required this.onTap,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDismissed(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: notification.isRead
                ? (isDark
                      ? AppColors.cardGradientDark
                      : AppColors.cardGradientLight)
                : (isDark
                      ? AppColors.primaryGradientSubtleDark
                      : AppColors.primaryGradientSubtle),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: notification.isRead
                  ? (isDark ? AppColors.borderDark : AppColors.borderLight)
                  : AppColors.primaryDark.withValues(alpha: 0.3),
              width: notification.isRead ? 1 : 2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: _getIconGradient(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_getIcon(), color: Colors.white, size: 24),
              ),

              const SizedBox(width: 12),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: AppTypography.titleSmall(
                              isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryDark,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notification.message,
                      style: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getPriorityColor().withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            notification.typeDisplayName,
                            style: AppTypography.labelSmall(
                              _getPriorityColor(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          notification.timestamp.toRelativeTime(),
                          style: AppTypography.caption(
                            isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (notification.type) {
      case NotificationType.newOrder:
        return Icons.shopping_bag;
      case NotificationType.lowStock:
        return Icons.inventory_2;
      case NotificationType.expiringMedicine:
        return Icons.schedule;
      case NotificationType.orderUpdate:
        return Icons.update;
      case NotificationType.paymentReceived:
        return Icons.account_balance_wallet;
      case NotificationType.systemAlert:
        return Icons.info;
    }
  }

  LinearGradient _getIconGradient() {
    switch (notification.priority) {
      case NotificationPriority.critical:
        return AppColors.errorGradient;
      case NotificationPriority.high:
        return AppColors.warningGradient;
      case NotificationPriority.medium:
        return AppColors.accentGradient;
      case NotificationPriority.low:
        return AppColors.successGradient;
    }
  }

  Color _getPriorityColor() {
    switch (notification.priority) {
      case NotificationPriority.critical:
        return AppColors.error;
      case NotificationPriority.high:
        return AppColors.warning;
      case NotificationPriority.medium:
        return AppColors.accentLight;
      case NotificationPriority.low:
        return AppColors.success;
    }
  }
}
