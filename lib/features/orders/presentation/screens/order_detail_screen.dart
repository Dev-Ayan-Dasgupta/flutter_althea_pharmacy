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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ordersState.maybeWhen(
        loaded: (orders) {
          try {
            final order = orders.firstWhere((o) => o.id == widget.orderId);
            return _buildOrderDetail(context, order, isDark);
          } catch (e) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order not found',
                    style: AppTypography.titleMedium(AppColors.error),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            );
          }
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
              Navigator.of(context).pop(); // Go back after action
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
          if (order.prescriptionUrl != null) ...[
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
              PrescriptionViewer(imageUrl: order.prescriptionUrl!),
            const SizedBox(height: 24),
          ],

          // Medicine List
          _buildSectionHeader(
            context,
            'Medicines (${order.items.length})',
            Icons.medication,
            isDark,
          ),
          const SizedBox(height: 12),
          MedicineListSection(items: order.items),

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
          if (order.prescriptionUrl != null)
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
                    imageUrl: order.prescriptionUrl!,
                    height: 700,
                  ),
                ],
              ),
            ),

          if (order.prescriptionUrl != null) const SizedBox(width: 32),

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
                  'Medicines (${order.items.length})',
                  Icons.medication,
                  isDark,
                ),
                const SizedBox(height: 12),
                MedicineListSection(items: order.items),
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
    final isEmergency = order.priority == OrderPriority.emergency;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isEmergency
            ? AppColors.errorGradient
            : AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (isEmergency ? AppColors.error : AppColors.primaryDark)
                .withValues(alpha: 0.3),
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
                  order.orderId,
                  style: AppTypography.headlineSmall(Colors.white),
                ),
              ),
              if (order.priority != OrderPriority.normal)
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
                      Icon(
                        order.priority == OrderPriority.emergency
                            ? Icons.local_hospital
                            : Icons.priority_high,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        order.priorityDisplayText,
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
                'Status: ${order.statusDisplayText}',
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
                      '${order.items.length}',
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
