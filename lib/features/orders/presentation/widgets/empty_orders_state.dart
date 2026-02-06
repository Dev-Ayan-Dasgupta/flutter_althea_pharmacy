import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../screens/orders_queue_screen.dart';

class EmptyOrdersState extends StatelessWidget {
  final OrdersFilter filter;

  const EmptyOrdersState({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String title;
    String subtitle;
    IconData icon;

    switch (filter) {
      case OrdersFilter.active:
        title = 'No Active Orders';
        subtitle = 'All orders are completed or there are no pending orders';
        icon = Icons.inbox_outlined;
        break;
      case OrdersFilter.completed:
        title = 'No Completed Orders';
        subtitle = 'Completed orders will appear here';
        icon = Icons.assignment_turned_in_outlined;
        break;
      case OrdersFilter.all:
        title = 'No Orders Yet';
        subtitle = 'New orders will appear here when customers place them';
        icon = Icons.shopping_bag_outlined;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient.scale(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 60, color: AppColors.primaryDark),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppTypography.headlineSmall(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              subtitle,
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

extension GradientScale on LinearGradient {
  LinearGradient scale(double opacity) {
    return LinearGradient(
      colors: colors.map((c) => c.withValues(alpha: opacity)).toList(),
      begin: begin,
      end: end,
    );
  }
}
