import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/inventory_entity.dart';

class InventoryStatsCards extends StatelessWidget {
  final List<InventoryItemEntity> items;

  const InventoryStatsCards({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final lowStockCount = items.where((i) => i.needsRestock).length;
    final expiringCount = items
        .where((i) => i.isExpiringSoon || i.isExpired)
        .length;
    final totalValue = items.fold<double>(
      0,
      (sum, item) => sum + (item.availableStock * item.unitPrice),
    );

    return Padding(
      padding: ResponsivePadding.horizontal(context),
      child: Responsive(
        mobile: _buildMobileLayout(lowStockCount, expiringCount, totalValue),
        tablet: _buildTabletLayout(lowStockCount, expiringCount, totalValue),
        desktop: _buildDesktopLayout(lowStockCount, expiringCount, totalValue),
      ),
    );
  }

  Widget _buildMobileLayout(int lowStock, int expiring, double totalValue) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                Icons.inventory_2_outlined,
                'Total Items',
                '${items.length}',
                AppColors.primaryGradient,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                Icons.warning_amber_outlined,
                'Low Stock',
                '$lowStock',
                AppColors.errorGradient,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                Icons.schedule_outlined,
                'Expiring Soon',
                '$expiring',
                AppColors.warningGradient,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                Icons.currency_rupee,
                'Stock Value',
                '₹${(totalValue / 1000).toStringAsFixed(1)}K',
                AppColors.accentGradient,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletLayout(int lowStock, int expiring, double totalValue) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            Icons.inventory_2_outlined,
            'Total Items',
            '${items.length}',
            AppColors.primaryGradient,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            Icons.warning_amber_outlined,
            'Low Stock',
            '$lowStock',
            AppColors.errorGradient,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            Icons.schedule_outlined,
            'Expiring Soon',
            '$expiring',
            AppColors.warningGradient,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            Icons.currency_rupee,
            'Stock Value',
            '₹${(totalValue / 1000).toStringAsFixed(1)}K',
            AppColors.accentGradient,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(int lowStock, int expiring, double totalValue) {
    return _buildTabletLayout(lowStock, expiring, totalValue);
  }

  Widget _buildStatCard(
    IconData icon,
    String label,
    String value,
    LinearGradient gradient,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient, // Keep original gradients for stat cards
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          Text(value, style: AppTypography.headlineMedium(Colors.white)),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.9)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
