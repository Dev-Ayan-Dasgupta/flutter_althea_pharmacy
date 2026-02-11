import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/providers/permission_provider.dart';
import '../../../auth/domain/entities/role_entity.dart';

class QuickActionsCard extends ConsumerWidget {
  final dynamic wallet;
  final VoidCallback onWithdraw;

  const QuickActionsCard({
    super.key,
    required this.wallet,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final canWithdraw = ref.watch(
      hasPermissionProvider(Permission.withdrawFunds),
    );

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
                child: const Icon(Icons.bolt, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Quick Actions',
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Withdraw Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canWithdraw
                  ? onWithdraw
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'You do not have permission to withdraw funds',
                          ),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    },
              icon: Icon(canWithdraw ? Icons.send : Icons.lock),
              label: Text(canWithdraw ? 'Withdraw Funds' : 'Restricted'),
              style: ElevatedButton.styleFrom(
                backgroundColor: canWithdraw
                    ? AppColors.primaryDark
                    : Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // View Details Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // Navigate to detailed earnings
                context.go('/home/wallet/analytics');
              },
              icon: const Icon(Icons.analytics_outlined),
              label: const Text('View Detailed Analytics'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
