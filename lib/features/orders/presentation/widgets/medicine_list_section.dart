import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/order_entity.dart';

class MedicineListSection extends StatelessWidget {
  final List<OrderItemEntity> items;

  const MedicineListSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => _MedicineCard(item: item)).toList(),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  final OrderItemEntity item;

  const _MedicineCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(12),
        border: item.availability == ItemAvailability.unavailable
            ? Border.all(color: AppColors.error, width: 2)
            : item.availability == ItemAvailability.substituted
            ? Border.all(color: AppColors.warning, width: 2)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Medicine Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: _getIconGradient(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(_getIcon(), color: Colors.white, size: 24),
              ),

              const SizedBox(width: 12),

              // Medicine Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.medicineName,
                      style: AppTypography.titleMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildAvailabilityBadge(),
                  ],
                ),
              ),

              // Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.price.toCurrency(),
                    style: AppTypography.titleMedium(
                      item.availability == ItemAvailability.unavailable
                          ? AppColors.error
                          : AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    'Qty: ${item.quantity}',
                    style: AppTypography.caption(
                      isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Substitute Information
          if (item.availability == ItemAvailability.substituted &&
              item.substituteName != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.sync_alt,
                    color: AppColors.warning,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Substitute: ${item.substituteName}',
                          style: AppTypography.bodyMedium(
                            AppColors.warningDark,
                          ),
                        ),
                        if (item.substitutePrice != null)
                          Text(
                            item.substitutePrice!.toCurrency(),
                            style: AppTypography.labelSmall(
                              AppColors.warningDark,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Notes
          if (item.notes != null) ...[
            const SizedBox(height: 8),
            Text(
              'Note: ${item.notes}',
              style: AppTypography.caption(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvailabilityBadge() {
    Color color;
    String text;
    IconData icon;

    switch (item.availability) {
      case ItemAvailability.available:
        color = AppColors.success;
        text = 'Available';
        icon = Icons.check_circle;
        break;
      case ItemAvailability.unavailable:
        color = AppColors.error;
        text = 'Out of Stock';
        icon = Icons.cancel;
        break;
      case ItemAvailability.substituted:
        color = AppColors.warning;
        text = 'Substituted';
        icon = Icons.sync_alt;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(text, style: AppTypography.labelSmall(color)),
        ],
      ),
    );
  }

  Gradient _getIconGradient() {
    switch (item.availability) {
      case ItemAvailability.available:
        return AppColors.successGradient;
      case ItemAvailability.unavailable:
        return AppColors.errorGradient;
      case ItemAvailability.substituted:
        return AppColors.warningGradient;
    }
  }

  IconData _getIcon() {
    switch (item.availability) {
      case ItemAvailability.available:
        return Icons.medication;
      case ItemAvailability.unavailable:
        return Icons.block;
      case ItemAvailability.substituted:
        return Icons.sync_alt;
    }
  }
}
