import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/inventory_entity.dart';

class AddInventoryDialog extends StatefulWidget {
  final InventoryItemEntity? item; // null for add, item for edit

  const AddInventoryDialog({super.key, this.item});

  @override
  State<AddInventoryDialog> createState() => _AddInventoryDialogState();
}

class _AddInventoryDialogState extends State<AddInventoryDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _medicineNameController;
  late TextEditingController _brandNameController;
  late TextEditingController _genericNameController;
  late TextEditingController _dosageController;
  late TextEditingController _currentStockController;
  late TextEditingController _minStockController;
  late TextEditingController _unitPriceController;
  late TextEditingController _batchNumberController;
  late TextEditingController _rackLocationController;
  late TextEditingController _supplierNameController;

  late DateTime _expiryDate;
  bool _isChronicMedication = false;
  bool _isScheduledDrug = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();

    final item = widget.item;
    _medicineNameController = TextEditingController(
      text: item?.medicineName ?? '',
    );
    _brandNameController = TextEditingController(text: item?.brandName ?? '');
    _genericNameController = TextEditingController(
      text: item?.genericName ?? '',
    );
    _dosageController = TextEditingController(text: item?.dosage ?? '');
    _currentStockController = TextEditingController(
      text: item?.currentStock.toString() ?? '',
    );
    _minStockController = TextEditingController(
      text: item?.minStockLevel.toString() ?? '50',
    );
    _unitPriceController = TextEditingController(
      text: item?.unitPrice.toString() ?? '',
    );
    _batchNumberController = TextEditingController(
      text: item?.batchNumber ?? '',
    );
    _rackLocationController = TextEditingController(
      text: item?.rackLocation ?? '',
    );
    _supplierNameController = TextEditingController(
      text: item?.supplierName ?? '',
    );

    _expiryDate =
        item?.expiryDate ?? DateTime.now().add(const Duration(days: 365));
    _isChronicMedication = item?.isChronicMedication ?? false;
    _isScheduledDrug = item?.isScheduledDrug ?? false;
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _brandNameController.dispose();
    _genericNameController.dispose();
    _dosageController.dispose();
    _currentStockController.dispose();
    _minStockController.dispose();
    _unitPriceController.dispose();
    _batchNumberController.dispose();
    _rackLocationController.dispose();
    _supplierNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isEditing = widget.item != null;

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.medication,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isEditing ? 'Edit Medicine' : 'Add Medicine to Inventory',
                      style: AppTypography.titleLarge(Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Medicine Name
                      TextFormField(
                        controller: _medicineNameController,
                        decoration: const InputDecoration(
                          labelText: 'Medicine Name *',
                          hintText: 'e.g., Paracetamol',
                          prefixIcon: Icon(Icons.medication),
                        ),
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Required' : null,
                      ),

                      const SizedBox(height: 16),

                      // Brand Name & Generic Name (Row)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _brandNameController,
                              decoration: const InputDecoration(
                                labelText: 'Brand Name',
                                hintText: 'e.g., Crocin',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _genericNameController,
                              decoration: const InputDecoration(
                                labelText: 'Generic Name',
                                hintText: 'e.g., Paracetamol',
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Dosage
                      TextFormField(
                        controller: _dosageController,
                        decoration: const InputDecoration(
                          labelText: 'Dosage *',
                          hintText: 'e.g., 500mg',
                          prefixIcon: Icon(Icons.science),
                        ),
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Required' : null,
                      ),

                      const SizedBox(height: 16),

                      // Current Stock & Min Stock (Row)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _currentStockController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Current Stock *',
                                hintText: '0',
                                prefixIcon: Icon(Icons.inventory_2),
                              ),
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _minStockController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                labelText: 'Min Stock Level *',
                                hintText: '50',
                                prefixIcon: Icon(Icons.warning_amber),
                              ),
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Unit Price
                      TextFormField(
                        controller: _unitPriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Unit Price (₹) *',
                          hintText: '0.00',
                          prefixIcon: Icon(Icons.currency_rupee),
                        ),
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Required' : null,
                      ),

                      const SizedBox(height: 16),

                      // Batch Number & Rack Location (Row)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _batchNumberController,
                              decoration: const InputDecoration(
                                labelText: 'Batch Number *',
                                hintText: 'e.g., MED2024A',
                              ),
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _rackLocationController,
                              decoration: const InputDecoration(
                                labelText: 'Rack Location',
                                hintText: 'e.g., A-12',
                                prefixIcon: Icon(Icons.location_on),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Expiry Date
                      InkWell(
                        onTap: () => _selectExpiryDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Expiry Date *',
                            prefixIcon: Icon(Icons.calendar_today),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                          ),
                          child: Text(
                            '${_expiryDate.day}/${_expiryDate.month}/${_expiryDate.year}',
                            style: AppTypography.bodyMedium(
                              isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Supplier Name
                      TextFormField(
                        controller: _supplierNameController,
                        decoration: const InputDecoration(
                          labelText: 'Supplier Name',
                          hintText: 'e.g., MedSupply Co.',
                          prefixIcon: Icon(Icons.business),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Checkboxes
                      CheckboxListTile(
                        value: _isChronicMedication,
                        onChanged: (value) {
                          setState(() => _isChronicMedication = value ?? false);
                        },
                        title: Text(
                          'Chronic Medication',
                          style: AppTypography.bodyMedium(
                            isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        subtitle: Text(
                          'For long-term conditions (diabetes, hypertension, etc.)',
                          style: AppTypography.caption(
                            isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                        secondary: const Icon(
                          Icons.favorite,
                          color: AppColors.accentLight,
                        ),
                      ),

                      CheckboxListTile(
                        value: _isScheduledDrug,
                        onChanged: (value) {
                          setState(() => _isScheduledDrug = value ?? false);
                        },
                        title: Text(
                          'Scheduled Drug (H/H1/X)',
                          style: AppTypography.bodyMedium(
                            isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        subtitle: Text(
                          'Requires prescription verification',
                          style: AppTypography.caption(
                            isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                        secondary: const Icon(
                          Icons.shield,
                          color: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _isProcessing
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isProcessing ? null : _handleSave,
                      child: _isProcessing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(isEditing ? 'Update' : 'Add'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)), // 10 years
    );

    if (picked != null) {
      setState(() => _expiryDate = picked);
    }
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isProcessing = true);

      // Create inventory item
      final newItem = InventoryItemEntity(
        id: widget.item?.id ?? 'INV_${DateTime.now().millisecondsSinceEpoch}',
        medicineId:
            widget.item?.medicineId ??
            'MED_${DateTime.now().millisecondsSinceEpoch}',
        medicineName: _medicineNameController.text.trim(),
        dosage: _dosageController.text.trim(),
        brandName: _brandNameController.text.trim().isEmpty
            ? null
            : _brandNameController.text.trim(),
        genericName: _genericNameController.text.trim().isEmpty
            ? null
            : _genericNameController.text.trim(),
        currentStock: int.parse(_currentStockController.text),
        minStockLevel: int.parse(_minStockController.text),
        reservedQuantity: widget.item?.reservedQuantity ?? 0,
        unitPrice: double.parse(_unitPriceController.text),
        batchNumber: _batchNumberController.text.trim(),
        expiryDate: _expiryDate,
        lastRestocked: DateTime.now(),
        rackLocation: _rackLocationController.text.trim().isEmpty
            ? null
            : _rackLocationController.text.trim(),
        isChronicMedication: _isChronicMedication,
        isScheduledDrug: _isScheduledDrug,
        supplierName: _supplierNameController.text.trim().isEmpty
            ? null
            : _supplierNameController.text.trim(),
      );

      // Return the item to parent
      Navigator.pop(context, newItem);
    }
  }
}
