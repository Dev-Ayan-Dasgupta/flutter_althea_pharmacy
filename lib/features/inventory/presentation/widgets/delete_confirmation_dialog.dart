import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/inventory_entity.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final InventoryItemEntity item;

  const DeleteConfirmationDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.delete_forever,
          color: AppColors.error,
          size: 32,
        ),
      ),
      title: Text(
        'Delete Medicine?',
        style: AppTypography.titleLarge(
          isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to delete this medicine from inventory?',
            style: AppTypography.bodyMedium(
              isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: isDark
                  ? AppColors.cardGradientDark
                  : AppColors.cardGradientLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
            ),
            child: Column(
              children: [
                Text(
                  item.medicineName,
                  style: AppTypography.titleSmall(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                if (item.brandName != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    item.brandName!,
                    style: AppTypography.bodySmall(
                      isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  '${item.dosage} • ${item.currentStock} units in stock',
                  style: AppTypography.caption(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber,
                  size: 16,
                  color: AppColors.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This action cannot be undone. All data will be permanently deleted.',
                    style: AppTypography.caption(AppColors.error),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
