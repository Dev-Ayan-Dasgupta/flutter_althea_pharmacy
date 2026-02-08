import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';
import '../widgets/export.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  bool _isPrescriptionExpanded = true;

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(ordersProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ordersState.maybeWhen(
        loaded: (orders) {
          final order = orders.firstWhere(
            (o) => o.id == widget.orderId,
            orElse: () => throw Exception('Order not found'),
          );

          return _buildOrderDetail(context, order, isDark);
        },
        orElse: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetail(
    BuildContext context,
    OrderEntity order,
    bool isDark,
  ) {
    return Column(
      children: [
        Expanded(
          child: ResponsiveContainer(
            child: SingleChildScrollView(
              child: Responsive(
                mobile: _buildMobileLayout(context, order, isDark),
                tablet: _buildTabletLayout(context, order, isDark),
                desktop: _buildDesktopLayout(context, order, isDark),
              ),
            ),
          ),
        ),

        // Compliance Footer
        const ComplianceFooter(),

        // Action Buttons (fixed at bottom)
        if (order.isActive)
          OrderActionsSection(
            order: order,
            onUpdateStatus: (newStatus) {
              ref
                  .read(ordersProvider.notifier)
                  .updateOrderStatus(order.id, newStatus);
              context.pop();
            },
          ),
      ],
    );
  }

  // Mobile Layout: Stacked vertically
  Widget _buildMobileLayout(
    BuildContext context,
    OrderEntity order,
    bool isDark,
  ) {
    return Padding(
      padding: ResponsivePadding.all(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Header
          _buildOrderHeader(context, order, isDark),

          const SizedBox(height: 24),

          // Customer Info
          CustomerInfoSection(order: order),

          const SizedBox(height: 24),

          // Prescription Viewer (Collapsible)
          if (order.prescriptionImageUrl != null) ...[
            _buildSectionHeader(
              context,
              'Prescription',
              Icons.receipt_long,
              isDark,
              isExpanded: _isPrescriptionExpanded,
              onToggle: () {
                setState(() {
                  _isPrescriptionExpanded = !_isPrescriptionExpanded;
                });
              },
            ),
            const SizedBox(height: 12),
            if (_isPrescriptionExpanded)
              PrescriptionViewer(imageUrl: order.prescriptionImageUrl!),
            const SizedBox(height: 24),
          ],

          // Medicine List
          _buildSectionHeader(
            context,
            'Medicines (${order.itemCount})',
            Icons.medication,
            isDark,
          ),
          const SizedBox(height: 12),
          MedicineListSection(medicines: order.medicines),

          const SizedBox(height: 100), // Space for action buttons
        ],
      ),
    );
  }

  // Tablet Layout: Similar to mobile but with more spacing
  Widget _buildTabletLayout(
    BuildContext context,
    OrderEntity order,
    bool isDark,
  ) {
    return _buildMobileLayout(context, order, isDark);
  }

  // Desktop Layout: Split screen (Prescription left, Details right)
  Widget _buildDesktopLayout(
    BuildContext context,
    OrderEntity order,
    bool isDark,
  ) {
    return Padding(
      padding: ResponsivePadding.all(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Prescription Viewer
          if (order.prescriptionImageUrl != null)
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(
                    context,
                    'Prescription',
                    Icons.receipt_long,
                    isDark,
                  ),
                  const SizedBox(height: 16),
                  PrescriptionViewer(
                    imageUrl: order.prescriptionImageUrl!,
                    height: 700,
                  ),
                ],
              ),
            ),

          if (order.prescriptionImageUrl != null) const SizedBox(width: 32),

          // Right: Order Details
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderHeader(context, order, isDark),
                const SizedBox(height: 24),
                CustomerInfoSection(order: order),
                const SizedBox(height: 24),
                _buildSectionHeader(
                  context,
                  'Medicines (${order.itemCount})',
                  Icons.medication,
                  isDark,
                ),
                const SizedBox(height: 12),
                MedicineListSection(medicines: order.medicines),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader(
    BuildContext context,
    OrderEntity order,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: order.isCritical
            ? AppColors.amberGradient
            : AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (order.isCritical ? AppColors.amber : AppColors.primaryDark)
                .withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.orderNumber,
                  style: AppTypography.headlineSmall(Colors.white),
                ),
              ),
              if (order.isCritical)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.priority_high,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        order.priorityDisplayName,
                        style: AppTypography.labelSmall(Colors.white),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 8),
              Text(
                'Ordered ${order.orderTime.toRelativeTime()}',
                style: AppTypography.bodyMedium(
                  Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 8),
              Text(
                'Status: ${order.statusDisplayName}',
                style: AppTypography.bodyMedium(
                  Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: AppTypography.labelSmall(
                        Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.totalAmount.toCurrency(),
                      style: AppTypography.headlineSmall(Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Items',
                      style: AppTypography.labelSmall(
                        Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${order.itemCount}',
                      style: AppTypography.headlineSmall(Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
    bool isDark, {
    bool? isExpanded,
    VoidCallback? onToggle,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: AppTypography.titleLarge(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ),
        if (onToggle != null)
          IconButton(
            icon: Icon(
              isExpanded! ? Icons.expand_less : Icons.expand_more,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            onPressed: onToggle,
          ),
      ],
    );
  }
}
