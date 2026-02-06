import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/order_entity.dart';

class MedicineListSection extends StatelessWidget {
  final List<MedicineItemEntity> medicines;

  const MedicineListSection({super.key, required this.medicines});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: medicines
          .map((medicine) => _MedicineCard(medicine: medicine))
          .toList(),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  final MedicineItemEntity medicine;

  const _MedicineCard({required this.medicine});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
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
                  gradient: AppColors.primaryGradient.scale(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.medication,
                  color: AppColors.primaryDark,
                  size: 24,
                ),
              ),

              const SizedBox(width: 12),

              // Medicine Name & Brand
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: AppTypography.titleMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    if (medicine.brandName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        medicine.brandName!,
                        style: AppTypography.bodySmall(
                          isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Scheduled Drug Badge
              if (medicine.isScheduledDrug == true)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified_user,
                        size: 14,
                        color: AppColors.warningDark,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'H',
                        style: AppTypography.labelSmall(AppColors.warningDark),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Dosage, Quantity, Price
          Row(
            children: [
              _buildInfoChip(
                context,
                Icons.science_outlined,
                medicine.dosage,
                isDark,
              ),
              const SizedBox(width: 8),
              _buildInfoChip(
                context,
                Icons.tag,
                'Qty: ${medicine.quantity}',
                isDark,
              ),
              const Spacer(),
              Text(
                medicine.price.toCurrency(),
                style: AppTypography.titleMedium(AppColors.primaryDark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String label,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceVariantDark
            : AppColors.surfaceVariantLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.labelSmall(
              isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
