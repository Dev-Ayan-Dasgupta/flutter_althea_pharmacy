import 'package:flutter/material.dart';
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
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(top: false, child: _buildActionButton(context, order)),
    );
  }

  Widget _buildActionButton(BuildContext context, OrderEntity order) {
    String buttonText;
    OrderStatus nextStatus;
    IconData icon;

    switch (order.status) {
      case OrderStatus.prescriptionVerification:
        buttonText = 'Verify & Start Packing';
        nextStatus = OrderStatus.packing;
        icon = Icons.check_circle_outline;
        break;
      case OrderStatus.packing:
        buttonText = 'Mark as Ready for Handover';
        nextStatus = OrderStatus.awaitingHandover;
        icon = Icons.inventory_2_outlined;
        break;
      case OrderStatus.awaitingHandover:
        buttonText = 'Complete Handover';
        nextStatus = OrderStatus.completed;
        icon = Icons.local_shipping_outlined;
        break;
      default:
        return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () =>
            _showConfirmationDialog(context, buttonText, nextStatus),
        icon: Icon(icon),
        label: Text(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
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
              onUpdateStatus(nextStatus);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
