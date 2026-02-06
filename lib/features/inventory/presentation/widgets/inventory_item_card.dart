import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/inventory_entity.dart';

class InventoryItemCard extends StatelessWidget {
  final InventoryItemEntity item;

  const InventoryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _getBorderColor(isDark),
          width: item.needsRestock || item.isExpiringSoon ? 2 : 1,
        ),
        boxShadow: item.needsRestock || item.isExpiringSoon
            ? [
                BoxShadow(
                  color: _getBorderColor(isDark).withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : (isDark ? AppColors.softShadowDark : AppColors.softShadowLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Medicine icon + Status badge
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: _getIconGradient(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.isScheduledDrug == true
                        ? Icons.shield_outlined
                        : Icons.medication,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const Spacer(),
                _buildStatusBadge(isDark),
              ],
            ),

            const SizedBox(height: 16),

            // Medicine Name
            Text(
              item.medicineName,
              style: AppTypography.titleMedium(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // Brand Name
            if (item.brandName != null)
              Text(
                item.brandName!,
                style: AppTypography.bodySmall(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),

            const SizedBox(height: 8),

            // Dosage
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.surfaceVariantDark
                    : AppColors.surfaceVariantLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                item.dosage,
                style: AppTypography.labelSmall(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Divider
            Divider(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),

            const SizedBox(height: 12),

            // Stock Info
            Row(
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 16,
                  color: _getStockColor(isDark),
                ),
                const SizedBox(width: 6),
                Text(
                  'Stock: ',
                  style: AppTypography.labelSmall(
                    isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight,
                  ),
                ),
                Text(
                  '${item.availableStock}',
                  style: AppTypography.titleSmall(_getStockColor(isDark)),
                ),
                if (item.reservedQuantity != null &&
                    item.reservedQuantity! > 0) ...[
                  Text(
                    ' / ${item.currentStock}',
                    style: AppTypography.bodySmall(
                      isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 8),

            // Expiry Info
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: _getExpiryColor(isDark)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item.isExpired
                        ? 'Expired'
                        : 'Expires in ${item.daysUntilExpiry}d',
                    style: AppTypography.labelSmall(_getExpiryColor(isDark)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Price + Rack Location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.unitPrice.toCurrency(),
                  style: AppTypography.titleMedium(AppColors.primaryDark),
                ),
                if (item.rackLocation != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.info.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 12,
                          color: AppColors.info,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.rackLocation!,
                          style: AppTypography.labelSmall(AppColors.info),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            // Chronic Med Badge
            if (item.isChronicMedication == true) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient.scale(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 14,
                      color: AppColors.accentDark,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Chronic Medication',
                      style: AppTypography.labelSmall(AppColors.accentDark),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBorderColor(bool isDark) {
    if (item.stockStatus == StockStatus.outOfStock) return AppColors.error;
    if (item.needsRestock) return AppColors.warning;
    if (item.isExpired) return AppColors.error;
    if (item.isExpiringSoon) return AppColors.warning;
    return isDark ? AppColors.borderDark : AppColors.borderLight;
  }

  LinearGradient _getIconGradient() {
    if (item.stockStatus == StockStatus.outOfStock)
      return AppColors.errorGradient;
    if (item.needsRestock) return AppColors.warningGradient;
    return AppColors.primaryGradient;
  }

  Widget _buildStatusBadge(bool isDark) {
    Color backgroundColor;
    Color textColor;
    String label;

    if (item.isExpired) {
      backgroundColor = AppColors.error.withValues(alpha: 0.15);
      textColor = AppColors.error;
      label = 'EXPIRED';
    } else if (item.stockStatus == StockStatus.outOfStock) {
      backgroundColor = AppColors.error.withValues(alpha: 0.15);
      textColor = AppColors.error;
      label = 'OUT OF STOCK';
    } else if (item.stockStatus == StockStatus.lowStock) {
      backgroundColor = AppColors.warning.withValues(alpha: 0.15);
      textColor = AppColors.warningDark;
      label = 'LOW STOCK';
    } else if (item.isExpiringSoon) {
      backgroundColor = AppColors.warning.withValues(alpha: 0.15);
      textColor = AppColors.warningDark;
      label = 'EXPIRING SOON';
    } else {
      backgroundColor = AppColors.success.withValues(alpha: 0.15);
      textColor = AppColors.success;
      label = 'IN STOCK';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall(
          textColor,
        ).copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  Color _getStockColor(bool isDark) {
    if (item.stockStatus == StockStatus.outOfStock) return AppColors.error;
    if (item.needsRestock) return AppColors.warning;
    return isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
  }

  Color _getExpiryColor(bool isDark) {
    if (item.isExpired) return AppColors.error;
    if (item.isExpiringSoon) return AppColors.warning;
    return isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
  }
}
