import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';

class ItemCheckerScreen extends ConsumerStatefulWidget {
  final String orderId;

  const ItemCheckerScreen({super.key, required this.orderId});

  @override
  ConsumerState<ItemCheckerScreen> createState() => _ItemCheckerScreenState();
}

class _ItemCheckerScreenState extends ConsumerState<ItemCheckerScreen> {
  late List<OrderItemEntity> _items;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadOrderItems();
  }

  void _loadOrderItems() {
    final ordersState = ref.read(ordersProvider);
    ordersState.maybeWhen(
      loaded: (orders) {
        final order = orders.firstWhere((o) => o.id == widget.orderId);
        _items = List.from(order.items);
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Check Item Availability',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouterHelper(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Progress Indicator
          _buildProgressIndicator(),

          // Items List
          Expanded(
            child: ResponsiveContainer(
              child: ListView.builder(
                padding: ResponsivePadding.all(context),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _buildItemCard(_items[index], index, isDark);
                },
              ),
            ),
          ),

          // Bottom Actions
          _buildBottomActions(isDark),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final checkedCount = _items
        .where(
          (item) =>
              item.availability != ItemAvailability.available ||
              item.availability == ItemAvailability.unavailable ||
              item.availability == ItemAvailability.substituted,
        )
        .length;
    final progress = _items.isEmpty ? 0.0 : checkedCount / _items.length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Checking Progress',
                style: AppTypography.titleMedium(Colors.white),
              ),
              Text(
                '$checkedCount / ${_items.length}',
                style: AppTypography.titleMedium(Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(OrderItemEntity item, int index, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: _getIconGradient(item.availability),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.medication, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.medicineName,
                      style: AppTypography.titleMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Qty: ${item.quantity}',
                          style: AppTypography.bodySmall(
                            isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          item.price.toCurrency(),
                          style: AppTypography.bodySmall(AppColors.primaryDark),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Availability Status Buttons
          Row(
            children: [
              Expanded(
                child: _buildStatusButton(
                  'Available',
                  Icons.check_circle,
                  AppColors.success,
                  item.availability == ItemAvailability.available,
                  () => _updateItemAvailability(
                    index,
                    ItemAvailability.available,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatusButton(
                  'Substitute',
                  Icons.sync_alt,
                  AppColors.warning,
                  item.availability == ItemAvailability.substituted,
                  () => _showSubstituteDialog(index),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatusButton(
                  'Out of Stock',
                  Icons.cancel,
                  AppColors.error,
                  item.availability == ItemAvailability.unavailable,
                  () => _updateItemAvailability(
                    index,
                    ItemAvailability.unavailable,
                  ),
                ),
              ),
            ],
          ),

          // Substitute Info (if applicable)
          if (item.availability == ItemAvailability.substituted &&
              item.substituteName != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.warning,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Substitute: ${item.substituteName}',
                          style: AppTypography.bodyMedium(
                            AppColors.warningDark,
                          ),
                        ),
                        if (item.substitutePrice != null)
                          Text(
                            'Price: ${item.substitutePrice!.toCurrency()}',
                            style: AppTypography.caption(AppColors.warningDark),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    color: AppColors.warning,
                    onPressed: () => _showSubstituteDialog(index),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusButton(
    String label,
    IconData icon,
    Color color,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : color, size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.labelSmall(
                isSelected ? Colors.white : color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions(bool isDark) {
    final availableCount = _items
        .where((i) => i.availability == ItemAvailability.available)
        .length;
    final unavailableCount = _items
        .where((i) => i.availability == ItemAvailability.unavailable)
        .length;
    final substitutedCount = _items
        .where((i) => i.availability == ItemAvailability.substituted)
        .length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryChip(
                  'Available',
                  availableCount,
                  AppColors.success,
                ),
                _buildSummaryChip(
                  'Substitute',
                  substitutedCount,
                  AppColors.warning,
                ),
                _buildSummaryChip(
                  'Out of Stock',
                  unavailableCount,
                  AppColors.error,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Action Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _handleSubmit,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : const Icon(Icons.check_circle),
                label: Text(
                  _isLoading ? 'Processing...' : 'Confirm & Continue',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryChip(String label, int count, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('$count', style: AppTypography.titleMedium(color)),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.caption(color)),
      ],
    );
  }

  void _updateItemAvailability(int index, ItemAvailability availability) {
    setState(() {
      _items[index] = _items[index].copyWith(
        availability: availability,
        // Clear substitute info if not substituted
        substituteName: availability == ItemAvailability.substituted
            ? _items[index].substituteName
            : null,
        substitutePrice: availability == ItemAvailability.substituted
            ? _items[index].substitutePrice
            : null,
      );
    });
  }

  void _showSubstituteDialog(int index) {
    final nameController = TextEditingController(
      text: _items[index].substituteName ?? '',
    );
    final priceController = TextEditingController(
      text: _items[index].substitutePrice?.toStringAsFixed(2) ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Substitute Medicine'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Substitute Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                prefixText: '₹ ',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                setState(() {
                  _items[index] = _items[index].copyWith(
                    availability: ItemAvailability.substituted,
                    substituteName: nameController.text,
                    substitutePrice: double.tryParse(priceController.text) ?? 0,
                  );
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor(ItemAvailability availability) {
    switch (availability) {
      case ItemAvailability.available:
        return AppColors.success;
      case ItemAvailability.unavailable:
        return AppColors.error;
      case ItemAvailability.substituted:
        return AppColors.warning;
    }
  }

  Gradient _getIconGradient(ItemAvailability availability) {
    switch (availability) {
      case ItemAvailability.available:
        return AppColors.successGradient;
      case ItemAvailability.unavailable:
        return AppColors.errorGradient;
      case ItemAvailability.substituted:
        return AppColors.warningGradient;
    }
  }

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);

    final availableItems = _items
        .where(
          (i) =>
              i.availability == ItemAvailability.available ||
              i.availability == ItemAvailability.substituted,
        )
        .toList();

    final unavailableItems = _items
        .where((i) => i.availability == ItemAvailability.unavailable)
        .toList();

    bool success;
    if (unavailableItems.isEmpty) {
      // Full accept
      success = await ref
          .read(ordersProvider.notifier)
          .acceptOrder(widget.orderId, _items);
    } else {
      // Partial accept
      success = await ref
          .read(ordersProvider.notifier)
          .partialAcceptOrder(
            widget.orderId,
            availableItems,
            unavailableItems,
            notes: 'Some items unavailable',
          );
    }

    setState(() => _isLoading = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            unavailableItems.isEmpty
                ? 'Order accepted successfully!'
                : 'Order partially accepted',
          ),
          backgroundColor: AppColors.success,
        ),
      );

      // Navigate to invoice screen (state is now updated)
      context.go('/home/order/${widget.orderId}/invoice');
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update order. Please try again.'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
