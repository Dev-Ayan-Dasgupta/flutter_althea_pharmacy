import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.go('/home/order/${order.id}');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: order.isCritical ? AppColors.amberGradient : null,
          color: order.isCritical
              ? null
              : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: order.isCritical
                ? AppColors.amber
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
            width: order.isCritical ? 2 : 1,
          ),
          boxShadow: order.isCritical
              ? [
                  BoxShadow(
                    color: AppColors.amber.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : (isDark ? AppColors.softShadowDark : AppColors.softShadowLight),
        ),
        child: Stack(
          children: [
            // Critical Order Pulse Animation (if critical)
            if (order.isCritical) _buildPulseAnimation(),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Order Number + Priority Badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          order.orderNumber,
                          style: AppTypography.titleMedium(
                            order.isCritical
                                ? Colors.white
                                : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight),
                          ),
                        ),
                      ),
                      _buildPriorityBadge(),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Customer Name
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 16,
                        color: order.isCritical
                            ? Colors.white.withValues(alpha: 0.9)
                            : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          order.customerName,
                          style: AppTypography.bodyMedium(
                            order.isCritical
                                ? Colors.white.withValues(alpha: 0.9)
                                : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Order Time
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: order.isCritical
                            ? Colors.white.withValues(alpha: 0.8)
                            : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order.orderTime.toRelativeTime(),
                        style: AppTypography.bodySmall(
                          order.isCritical
                              ? Colors.white.withValues(alpha: 0.8)
                              : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Divider
                  Divider(
                    color: order.isCritical
                        ? Colors.white.withValues(alpha: 0.3)
                        : (isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight),
                  ),

                  const SizedBox(height: 12),

                  // Items + Amount
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Items',
                              style: AppTypography.labelSmall(
                                order.isCritical
                                    ? Colors.white.withValues(alpha: 0.7)
                                    : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${order.itemCount}',
                              style: AppTypography.titleMedium(
                                order.isCritical
                                    ? Colors.white
                                    : (isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Amount',
                              style: AppTypography.labelSmall(
                                order.isCritical
                                    ? Colors.white.withValues(alpha: 0.7)
                                    : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order.totalAmount.toCurrency(),
                              style: AppTypography.titleMedium(
                                order.isCritical
                                    ? Colors.white
                                    : AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Status Badge
                  _buildStatusBadge(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityBadge() {
    if (order.priority == OrderPriority.normal) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: order.priority == OrderPriority.emergency
            ? AppColors.error
            : AppColors.warning,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            order.priority == OrderPriority.emergency
                ? Icons.local_hospital
                : Icons.priority_high,
            size: 14,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            order.priorityDisplayName,
            style: AppTypography.labelSmall(Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (order.status) {
      case OrderStatus.prescriptionVerification:
        backgroundColor = AppColors.info.withValues(alpha: 0.15);
        textColor = AppColors.info;
        icon = Icons.fact_check_outlined;
        break;
      case OrderStatus.packing:
        backgroundColor = AppColors.warning.withValues(alpha: 0.15);
        textColor = AppColors.warningDark;
        icon = Icons.inventory_2_outlined;
        break;
      case OrderStatus.awaitingHandover:
        backgroundColor = AppColors.primaryDark.withValues(alpha: 0.15);
        textColor = AppColors.primaryDark;
        icon = Icons.local_shipping_outlined;
        break;
      case OrderStatus.completed:
        backgroundColor = AppColors.success.withValues(alpha: 0.15);
        textColor = AppColors.success;
        icon = Icons.check_circle_outline;
        break;
      case OrderStatus.cancelled:
        backgroundColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        icon = Icons.cancel_outlined;
        break;
    }

    // Override colors for critical orders
    if (order.isCritical) {
      backgroundColor = Colors.white.withValues(alpha: 0.2);
      textColor = Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              order.statusDisplayName,
              style: AppTypography.labelMedium(textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPulseAnimation() {
    return Positioned.fill(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1500),
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3 * (1 - value)),
                width: 2 + (4 * value),
              ),
            ),
          );
        },
        onEnd: () {
          // Restart animation
        },
      ),
    );
  }
}
