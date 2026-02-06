import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../screens/inventory_screen.dart';

class InventoryFilterChips extends StatelessWidget {
  final InventoryFilter currentFilter;
  final Function(InventoryFilter) onFilterChanged;

  const InventoryFilterChips({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: ResponsivePadding.horizontal(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              context,
              'All Items',
              Icons.grid_view,
              InventoryFilter.all,
              isDark,
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              context,
              'Low Stock',
              Icons.warning_amber,
              InventoryFilter.lowStock,
              isDark,
              color: AppColors.error,
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              context,
              'Expiring Soon',
              Icons.schedule,
              InventoryFilter.expiringSoon,
              isDark,
              color: AppColors.warning,
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              context,
              'Chronic Meds',
              Icons.favorite_outline,
              InventoryFilter.chronic,
              isDark,
              color: AppColors.accentLight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    IconData icon,
    InventoryFilter filter,
    bool isDark, {
    Color? color,
  }) {
    final isSelected = currentFilter == filter;
    final chipColor = color ?? AppColors.primaryDark;

    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: isSelected ? Colors.white : chipColor),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (_) => onFilterChanged(filter),
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      selectedColor: chipColor,
      checkmarkColor: Colors.white,
      labelStyle: AppTypography.labelMedium(
        isSelected
            ? Colors.white
            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
      ),
      side: BorderSide(
        color: isSelected
            ? chipColor
            : (isDark ? AppColors.borderDark : AppColors.borderLight),
      ),
    );
  }
}
