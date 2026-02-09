import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/order_entity.dart';

class OrderActionsSection extends StatelessWidget {
  final OrderEntity order;
  final Function(OrderStatus) onUpdateStatus;

  const OrderActionsSection({
    super.key,
    required this.order,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(top: false, child: _buildActionButtons(context, order)),
    );
  }

  Widget _buildActionButtons(BuildContext context, OrderEntity order) {
    // For pending orders, show Accept/Reject buttons
    if (order.status == OrderStatus.pending) {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _showRejectDialog(context),
              icon: const Icon(Icons.cancel_outlined),
              label: const Text('Reject'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: () => _showAcceptDialog(context),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Review & Accept'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      );
    }

    // For other statuses, show single action button
    String? buttonText;
    OrderStatus? nextStatus;
    IconData? icon;
    Color? color;

    switch (order.status) {
      case OrderStatus.reviewing:
        buttonText = 'Complete Review';
        nextStatus = OrderStatus.accepted;
        icon = Icons.check_circle_outline;
        color = AppColors.success;
        break;
      case OrderStatus.accepted:
        buttonText = 'Generate Invoice';
        nextStatus = OrderStatus.preparingInvoice;
        icon = Icons.receipt_long;
        color = AppColors.primaryDark;
        break;
      case OrderStatus.preparingInvoice:
        buttonText = 'Generate QR Code';
        nextStatus = OrderStatus.readyForPickup;
        icon = Icons.qr_code;
        color = AppColors.primaryDark;
        break;
      case OrderStatus.readyForPickup:
        return const SizedBox.shrink(); // QR scanner will handle this
      case OrderStatus.pickedUp:
      case OrderStatus.outForDelivery:
        buttonText = 'Mark as Delivered';
        nextStatus = OrderStatus.delivered;
        icon = Icons.check_circle;
        color = AppColors.success;
        break;
      default:
        return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () =>
            _showConfirmationDialog(context, buttonText!, nextStatus!),
        icon: Icon(icon),
        label: Text(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  void _showAcceptDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Accept Order',
          style: AppTypography.titleLarge(
            Theme.of(context).textTheme.titleLarge!.color!,
          ),
        ),
        content: Text(
          'Proceed to check item availability?',
          style: AppTypography.bodyMedium(
            Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to item checker
              context.go('/home/order/${order.id}/check-items');
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
            child: const Text('Check Items'),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Reject Order',
          style: AppTypography.titleLarge(
            Theme.of(context).textTheme.titleLarge!.color!,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please provide a reason for rejection:',
              style: AppTypography.bodyMedium(
                Theme.of(context).textTheme.bodyMedium!.color!,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Reason for rejection',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.isNotEmpty) {
                Navigator.pop(context);
                onUpdateStatus(OrderStatus.rejected);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Reject Order'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    String action,
    OrderStatus nextStatus,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirm Action',
          style: AppTypography.titleLarge(
            Theme.of(context).textTheme.titleLarge!.color!,
          ),
        ),
        content: Text(
          'Are you sure you want to: $action?',
          style: AppTypography.bodyMedium(
            Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (nextStatus == OrderStatus.preparingInvoice) {
                // Navigate to invoice screen instead of just updating status
                context.go('/home/order/${order.id}/invoice');
              } else {
                onUpdateStatus(nextStatus);
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
