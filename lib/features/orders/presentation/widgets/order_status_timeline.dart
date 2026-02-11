import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/order_entity.dart';

class OrderStatusTimeline extends StatelessWidget {
  final OrderEntity order;

  const OrderStatusTimeline({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.timeline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Order Timeline',
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTimelineItem(
            'Order Placed',
            order.orderTime,
            Icons.shopping_bag,
            true,
            isDark,
          ),
          if (order.acceptedAt != null)
            _buildTimelineItem(
              'Order Accepted',
              order.acceptedAt!,
              Icons.check_circle,
              true,
              isDark,
            ),
          if (order.readyAt != null)
            _buildTimelineItem(
              'Ready for Pickup',
              order.readyAt!,
              Icons.inventory_2,
              true,
              isDark,
            ),
          if (order.pickedUpAt != null)
            _buildTimelineItem(
              'Picked Up',
              order.pickedUpAt!,
              Icons.local_shipping,
              true,
              isDark,
            ),
          if (order.deliveredAt != null)
            _buildTimelineItem(
              'Delivered',
              order.deliveredAt!,
              Icons.done_all,
              true,
              isDark,
              isLast: true,
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    String title,
    DateTime time,
    IconData icon,
    bool isCompleted,
    bool isDark, {
    bool isLast = false,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.success
                    : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isCompleted
                    ? Colors.white
                    : AppColors.textSecondaryLight,
                size: 20,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted
                    ? AppColors.success
                    : (isDark ? AppColors.borderDark : AppColors.borderLight),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    AppTypography.bodyMedium(
                      isCompleted
                          ? (isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight)
                          : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight),
                    ).copyWith(
                      fontWeight: isCompleted
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatTime(time),
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
