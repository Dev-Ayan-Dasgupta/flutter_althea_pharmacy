// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/permission_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../domain/entities/inventory_entity.dart';
import 'export.dart';

class InventoryItemCard extends ConsumerWidget {
  final InventoryItemEntity item;
  final Function(String id, int newStock)? onStockAdjusted;
  final Function(String id)? onDeleted;

  const InventoryItemCard({
    super.key,
    required this.item,
    this.onStockAdjusted,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final canEdit = ref.watch(hasPermissionProvider(Permission.editInventory));
    final canDelete = ref.watch(
      hasPermissionProvider(Permission.deleteInventory),
    );

    return InkWell(
      onTap: canEdit ? () => _showEditDialog(context) : null,
      onLongPress: (canEdit || canDelete)
          ? () => _showOptionsMenu(context, ref)
          : null,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.cardGradientDark
              : AppColors.cardGradientLight,
          borderRadius: BorderRadius.circular(16),
          boxShadow: item.needsRestock || item.isExpiringSoon
              ? [
                  BoxShadow(
                    color: _getBorderColor(isDark).withValues(alpha: 0.2),
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
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
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
                  Icon(
                    Icons.schedule,
                    size: 16,
                    color: _getExpiryColor(isDark),
                  ),
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

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddInventoryDialog(item: item),
    ).then((result) {
      if (result != null && result is InventoryItemEntity) {
        // You'll need to access provider here via callback or context
        if (context.mounted)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medicine updated successfully!'),
              backgroundColor: AppColors.success,
            ),
          );
      }
    });
  }

  void _showOptionsMenu(BuildContext context, WidgetRef ref) {
    final canEdit = ref.read(hasPermissionProvider(Permission.editInventory));
    final canAdjust = ref.read(hasPermissionProvider(Permission.adjustStock));
    final canDelete = ref.read(
      hasPermissionProvider(Permission.deleteInventory),
    );

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                item.medicineName,
                style: AppTypography.titleMedium(
                  Theme.of(context).textTheme.titleMedium!.color!,
                ),
              ),
            ),
            const Divider(height: 1),
            if (canEdit)
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Details'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditDialog(context);
                },
              ),
            if (canAdjust)
              ListTile(
                leading: const Icon(Icons.tune),
                title: const Text('Adjust Stock'),
                onTap: () {
                  Navigator.pop(context);
                  _showStockAdjustmentDialog(context);
                },
              ),
            if (canDelete) ...[
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.delete, color: AppColors.error),
                title: const Text(
                  'Delete',
                  style: TextStyle(color: AppColors.error),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmation(context);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showStockAdjustmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StockAdjustmentDialog(item: item),
    ).then((result) {
      if (result != null && result is Map<String, dynamic>) {
        final newStock = result['newStock'] as int;
        onStockAdjusted?.call(item.id, newStock);
      }
    });
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(item: item),
    ).then((confirmed) {
      if (confirmed == true) {
        onDeleted?.call(item.id);
      }
    });
  }
}
