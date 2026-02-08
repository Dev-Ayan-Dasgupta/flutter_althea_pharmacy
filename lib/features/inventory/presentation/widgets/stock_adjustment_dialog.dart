import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/inventory_entity.dart';

enum AdjustmentType { add, remove, set }

class StockAdjustmentDialog extends StatefulWidget {
  final InventoryItemEntity item;

  const StockAdjustmentDialog({super.key, required this.item});

  @override
  State<StockAdjustmentDialog> createState() => _StockAdjustmentDialogState();
}

class _StockAdjustmentDialogState extends State<StockAdjustmentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _reasonController = TextEditingController();

  AdjustmentType _adjustmentType = AdjustmentType.add;
  bool _isProcessing = false;

  @override
  void dispose() {
    _quantityController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  int get _newStock {
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    switch (_adjustmentType) {
      case AdjustmentType.add:
        return widget.item.currentStock + quantity;
      case AdjustmentType.remove:
        return widget.item.currentStock - quantity;
      case AdjustmentType.set:
        return quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adjust Stock',
                  style: AppTypography.titleLarge(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  widget.item.medicineName,
                  style: AppTypography.bodySmall(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Stock Info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Stock:',
                      style: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    Text(
                      '${widget.item.currentStock} units',
                      style: AppTypography.titleMedium(AppColors.info),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Adjustment Type Selector
              Text(
                'Adjustment Type',
                style: AppTypography.labelMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 8),
              SegmentedButton<AdjustmentType>(
                segments: const [
                  ButtonSegment(
                    value: AdjustmentType.add,
                    label: Text('Add'),
                    icon: Icon(Icons.add, size: 18),
                  ),
                  ButtonSegment(
                    value: AdjustmentType.remove,
                    label: Text('Remove'),
                    icon: Icon(Icons.remove, size: 18),
                  ),
                  ButtonSegment(
                    value: AdjustmentType.set,
                    label: Text('Set'),
                    icon: Icon(Icons.edit, size: 18),
                  ),
                ],
                selected: {_adjustmentType},
                onSelectionChanged: (Set<AdjustmentType> newSelection) {
                  setState(() {
                    _adjustmentType = newSelection.first;
                    _quantityController.clear();
                  });
                },
              ),

              const SizedBox(height: 20),

              // Quantity Input
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                decoration: InputDecoration(
                  labelText: _adjustmentType == AdjustmentType.set
                      ? 'New Stock Quantity'
                      : 'Quantity',
                  hintText: '0',
                  prefixIcon: Icon(
                    _adjustmentType == AdjustmentType.add
                        ? Icons.add_circle_outline
                        : _adjustmentType == AdjustmentType.remove
                        ? Icons.remove_circle_outline
                        : Icons.edit,
                  ),
                  helperText: _quantityController.text.isNotEmpty
                      ? 'New stock will be: $_newStock units'
                      : null,
                  helperStyle: AppTypography.caption(
                    _newStock < 0 ? AppColors.error : AppColors.success,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  final quantity = int.tryParse(value);
                  if (quantity == null || quantity <= 0) {
                    return 'Please enter valid quantity';
                  }
                  if (_adjustmentType == AdjustmentType.remove &&
                      quantity > widget.item.currentStock) {
                    return 'Cannot remove more than current stock';
                  }
                  return null;
                },
                onChanged: (_) => setState(() {}), // Update helper text
              ),

              const SizedBox(height: 16),

              // Reason (Optional)
              TextFormField(
                controller: _reasonController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Reason (Optional)',
                  hintText: 'e.g., Restocked, Damaged, Expired',
                  prefixIcon: Icon(Icons.note),
                ),
              ),

              const SizedBox(height: 16),

              // Warning for Remove
              if (_adjustmentType == AdjustmentType.remove)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_amber,
                        size: 16,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Stock will be reduced. This action cannot be undone.',
                          style: AppTypography.caption(AppColors.warning),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isProcessing ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isProcessing ? null : _handleAdjustment,
          style: ElevatedButton.styleFrom(
            backgroundColor: _adjustmentType == AdjustmentType.remove
                ? AppColors.error
                : AppColors.primaryDark,
          ),
          child: _isProcessing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : const Text('Confirm'),
        ),
      ],
    );
  }

  void _handleAdjustment() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isProcessing = true);

      // Return adjustment details
      final result = {
        'newStock': _newStock,
        'adjustmentType': _adjustmentType.name,
        'quantity': int.parse(_quantityController.text),
        'reason': _reasonController.text.trim(),
      };

      Navigator.pop(context, result);
    }
  }
}
