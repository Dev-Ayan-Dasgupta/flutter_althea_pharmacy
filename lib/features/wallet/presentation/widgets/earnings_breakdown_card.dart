import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/wallet_entity.dart';

class EarningsBreakdownCard extends StatelessWidget {
  final WalletEntity wallet;

  const EarningsBreakdownCard({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Calculate percentages (example: 82% pharmacy, 8% delivery, 10% fulfillment)
    final pharmacyPercentage = 0.82;
    final deliveryPercentage = 0.08;
    final fulfillmentPercentage = 0.10;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.pie_chart,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Revenue Split',
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 3-Way Split Visualization
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Expanded(
                  flex: (pharmacyPercentage * 100).toInt(),
                  child: Container(height: 12, color: AppColors.primaryDark),
                ),
                Expanded(
                  flex: (deliveryPercentage * 100).toInt(),
                  child: Container(height: 12, color: AppColors.accentLight),
                ),
                Expanded(
                  flex: (fulfillmentPercentage * 100).toInt(),
                  child: Container(height: 12, color: AppColors.warning),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Breakdown Details
          _buildSplitItem(
            'Your Earnings (Pharmacy)',
            wallet.lifetimeEarnings * pharmacyPercentage,
            '${(pharmacyPercentage * 100).toInt()}%',
            AppColors.primaryDark,
            isDark,
          ),

          const SizedBox(height: 12),

          _buildSplitItem(
            'Delivery Fee',
            wallet.lifetimeEarnings * deliveryPercentage,
            '${(deliveryPercentage * 100).toInt()}%',
            AppColors.accentLight,
            isDark,
          ),

          const SizedBox(height: 12),

          _buildSplitItem(
            'AltheaCare Fulfillment Fee',
            wallet.lifetimeEarnings * fulfillmentPercentage,
            '${(fulfillmentPercentage * 100).toInt()}%',
            AppColors.warning,
            isDark,
          ),

          const SizedBox(height: 16),

          Divider(color: isDark ? AppColors.borderDark : AppColors.borderLight),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Lifetime Earnings',
                style: AppTypography.titleSmall(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              Text(
                wallet.lifetimeEarnings.toCurrency(),
                style: AppTypography.titleLarge(AppColors.primaryDark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSplitItem(
    String label,
    double amount,
    String percentage,
    Color color,
    bool isDark,
  ) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium(
              isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ),
        Text(
          percentage,
          style: AppTypography.labelMedium(
            isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
          ),
        ),
        const SizedBox(width: 12),
        Text(amount.toCurrency(), style: AppTypography.titleSmall(color)),
      ],
    );
  }
}
