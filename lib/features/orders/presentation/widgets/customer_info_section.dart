import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/order_entity.dart';

class CustomerInfoSection extends StatelessWidget {
  final OrderEntity order;

  const CustomerInfoSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
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
          Text(
            'Customer Information',
            style: AppTypography.titleMedium(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 16),

          // Customer Name
          _buildInfoRow(
            context,
            Icons.person_outline,
            'Name',
            order.customerName,
            isDark,
          ),

          const SizedBox(height: 12),

          // Phone
          _buildInfoRow(
            context,
            Icons.phone_outlined,
            'Phone',
            order.customerPhone,
            isDark,
            onTap: () {
              Clipboard.setData(ClipboardData(text: order.customerPhone));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Phone copied to clipboard')),
              );
            },
          ),

          const SizedBox(height: 12),

          // Address
          _buildInfoRow(
            context,
            Icons.location_on_outlined,
            'Delivery Address',
            order.deliveryAddress,
            isDark,
            maxLines: 3,
          ),

          if (order.specialInstructions != null) ...[
            const SizedBox(height: 12),
            _buildInfoRow(
              context,
              Icons.info_outline,
              'Special Instructions',
              order.specialInstructions!,
              isDark,
              maxLines: 3,
              valueColor: AppColors.warning,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    bool isDark, {
    int maxLines = 1,
    Color? valueColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 20,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTypography.labelSmall(
                      isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTypography.bodyMedium(
                      valueColor ??
                          (isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight),
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.copy,
                size: 16,
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
          ],
        ),
      ),
    );
  }
}
