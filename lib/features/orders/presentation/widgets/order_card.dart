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
    final isEmergency = order.priority == OrderPriority.emergency;

    return GestureDetector(
      onTap: () {
        context.go('/home/order/${order.id}');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: isEmergency
              ? AppColors.errorGradient
              : (isDark
                    ? AppColors.cardGradientDark
                    : AppColors.cardGradientLight),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isEmergency
              ? [
                  BoxShadow(
                    color: AppColors.error.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : (isDark ? AppColors.softShadowDark : AppColors.softShadowLight),
        ),
        child: Stack(
          children: [
            // Emergency pulse animation
            if (isEmergency) _buildPulseAnimation(),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: Order ID + Priority Badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          order.orderId,
                          style: AppTypography.titleMedium(
                            isEmergency
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
                        color: isEmergency
                            ? Colors.white.withOpacity(0.9)
                            : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          order.customerName,
                          style: AppTypography.bodyMedium(
                            isEmergency
                                ? Colors.white.withOpacity(0.9)
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
                        color: isEmergency
                            ? Colors.white.withOpacity(0.8)
                            : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order.orderTime.toRelativeTime(),
                        style: AppTypography.bodySmall(
                          isEmergency
                              ? Colors.white.withOpacity(0.8)
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
                    color: isEmergency
                        ? Colors.white.withOpacity(0.3)
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
                                isEmergency
                                    ? Colors.white.withOpacity(0.7)
                                    : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${order.items.length}',
                              style: AppTypography.titleMedium(
                                isEmergency
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
                                isEmergency
                                    ? Colors.white.withOpacity(0.7)
                                    : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order.totalAmount.toCurrency(),
                              style: AppTypography.titleMedium(
                                isEmergency
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
                  _buildStatusBadge(isEmergency, isDark),
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
            ? Colors.white.withOpacity(0.2)
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
            order.priorityDisplayText,
            style: AppTypography.labelSmall(Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(bool isEmergency, bool isDark) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (order.status) {
      case OrderStatus.pending:
        backgroundColor = AppColors.info.withOpacity(0.15);
        textColor = AppColors.info;
        icon = Icons.new_releases;
        break;
      case OrderStatus.reviewing:
        backgroundColor = AppColors.warning.withOpacity(0.15);
        textColor = AppColors.warningDark;
        icon = Icons.fact_check_outlined;
        break;
      case OrderStatus.accepted:
        backgroundColor = AppColors.success.withOpacity(0.15);
        textColor = AppColors.success;
        icon = Icons.check_circle_outline;
        break;
      case OrderStatus.preparingInvoice:
        backgroundColor = AppColors.primaryDark.withOpacity(0.15);
        textColor = AppColors.primaryDark;
        icon = Icons.receipt_long;
        break;
      case OrderStatus.readyForPickup:
        backgroundColor = AppColors.accentDark.withOpacity(0.15);
        textColor = AppColors.accentDark;
        icon = Icons.qr_code_2;
        break;
      case OrderStatus.pickedUp:
        backgroundColor = AppColors.warning.withOpacity(0.15);
        textColor = AppColors.warningDark;
        icon = Icons.inventory_2_outlined;
        break;
      case OrderStatus.outForDelivery:
        backgroundColor = AppColors.info.withOpacity(0.15);
        textColor = AppColors.info;
        icon = Icons.local_shipping_outlined;
        break;
      case OrderStatus.delivered:
        backgroundColor = AppColors.success.withOpacity(0.15);
        textColor = AppColors.success;
        icon = Icons.check_circle;
        break;
      case OrderStatus.rejected:
      case OrderStatus.cancelled:
        backgroundColor = AppColors.error.withOpacity(0.15);
        textColor = AppColors.error;
        icon = Icons.cancel;
        break;
    }

    // Override colors for emergency orders
    if (isEmergency) {
      backgroundColor = Colors.white.withOpacity(0.2);
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
              order.statusDisplayText,
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
                color: Colors.white.withOpacity(0.3 * (1 - value)),
                width: 2 + (4 * value),
              ),
            ),
          );
        },
        onEnd: () {
          // Animation will restart automatically
        },
      ),
    );
  }
}
