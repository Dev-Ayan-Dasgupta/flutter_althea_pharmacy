import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/wallet_entity.dart';

class QuickActionsCard extends StatelessWidget {
  final WalletEntity wallet;
  final VoidCallback onWithdraw;

  const QuickActionsCard({
    super.key,
    required this.wallet,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: AppTypography.titleMedium(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 16),

          // Withdraw Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: wallet.availableBalance >= 100 ? onWithdraw : null,
              icon: const Icon(Icons.account_balance),
              label: const Text('Withdraw to Bank'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Info Text
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: 16, color: AppColors.info),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Minimum withdrawal: ₹100\nAvailable: ${wallet.availableBalance.toCurrency()}',
                    style: AppTypography.caption(AppColors.info),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Divider(color: isDark ? AppColors.borderDark : AppColors.borderLight),

          const SizedBox(height: 16),

          // Total Withdrawn
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Withdrawn',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              Text(
                wallet.totalWithdrawn.toCurrency(),
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
