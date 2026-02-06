import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../screens/inventory_screen.dart';

class EmptyInventoryState extends StatelessWidget {
  final InventoryFilter filter;

  const EmptyInventoryState({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String title;
    String subtitle;
    IconData icon;

    switch (filter) {
      case InventoryFilter.lowStock:
        title = 'No Low Stock Items';
        subtitle = 'All medicines are adequately stocked';
        icon = Icons.check_circle_outline;
        break;
      case InventoryFilter.expiringSoon:
        title = 'No Expiring Items';
        subtitle = 'No medicines expiring in the next 60 days';
        icon = Icons.check_circle_outline;
        break;
      case InventoryFilter.chronic:
        title = 'No Chronic Medications';
        subtitle = 'No chronic medications found in inventory';
        icon = Icons.favorite_outline;
        break;
      case InventoryFilter.all:
        title = 'No Inventory Items';
        subtitle = 'Start adding medicines to your inventory';
        icon = Icons.inventory_2_outlined;
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
