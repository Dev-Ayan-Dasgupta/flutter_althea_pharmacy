import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _TransactionCard(transaction: transactions[index]);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color:
                  (isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight)
                      .withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No transactions yet',
              style: AppTypography.titleMedium(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final TransactionEntity transaction;

  const _TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getIconColor().withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_getIcon(), color: _getIconColor(), size: 20),
              ),

              const SizedBox(width: 12),

              // Transaction Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.typeDisplayName,
                      style: AppTypography.titleSmall(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.orderNumber,
                      style: AppTypography.bodySmall(
                        isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),

              // Amount
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.type == TransactionType.withdrawal
                        ? '- ${transaction.totalAmount.toCurrency()}'
                        : transaction.pharmacyAmount.toCurrency(),
                    style: AppTypography.titleMedium(
                      transaction.type == TransactionType.withdrawal
                          ? AppColors.error
                          : AppColors.success,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildStatusBadge(isDark),
                ],
              ),
            ],
          ),

          if (transaction.type == TransactionType.orderPayment) ...[
            const SizedBox(height: 12),
            Divider(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            const SizedBox(height: 12),

            // Payment Breakdown
            Row(
              children: [
                Expanded(
                  child: _buildBreakdownItem(
                    'Total',
                    transaction.totalAmount.toCurrency(),
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildBreakdownItem(
                    'Delivery',
                    transaction.deliveryFee.toCurrency(),
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildBreakdownItem(
                    'Fee',
                    transaction.fulfillmentFee.toCurrency(),
                    isDark,
                  ),
                ),
              ],
            ),
          ],

          if (transaction.customerName != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 14,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
                const SizedBox(width: 6),
                Text(
                  transaction.customerName!,
                  style: AppTypography.caption(
                    isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight,
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 8),

          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 14,
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
              const SizedBox(width: 6),
              Text(
                transaction.transactionDate.toRelativeTime(),
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIcon() {
    switch (transaction.type) {
      case TransactionType.orderPayment:
        return Icons.shopping_bag_outlined;
      case TransactionType.withdrawal:
        return Icons.account_balance;
      case TransactionType.refund:
        return Icons.replay;
      case TransactionType.adjustment:
        return Icons.edit;
    }
  }

  Color _getIconColor() {
    switch (transaction.type) {
      case TransactionType.orderPayment:
        return AppColors.success;
      case TransactionType.withdrawal:
        return AppColors.accentLight;
      case TransactionType.refund:
        return AppColors.warning;
      case TransactionType.adjustment:
        return AppColors.info;
    }
  }

  Widget _buildStatusBadge(bool isDark) {
    Color backgroundColor;
    Color textColor;

    switch (transaction.status) {
      case TransactionStatus.completed:
        backgroundColor = AppColors.success.withValues(alpha: 0.15);
        textColor = AppColors.success;
        break;
      case TransactionStatus.pending:
        backgroundColor = AppColors.warning.withValues(alpha: 0.15);
        textColor = AppColors.warningDark;
        break;
      case TransactionStatus.processing:
        backgroundColor = AppColors.info.withValues(alpha: 0.15);
        textColor = AppColors.info;
        break;
      case TransactionStatus.failed:
        backgroundColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        transaction.statusDisplayName,
        style: AppTypography.labelSmall(textColor),
      ),
    );
  }

  Widget _buildBreakdownItem(String label, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.caption(
            isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.labelMedium(
            isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}
