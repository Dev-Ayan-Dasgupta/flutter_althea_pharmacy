import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/inventory_entity.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
abstract class InventoryItemModel with _$InventoryItemModel {
  const InventoryItemModel._();

  const factory InventoryItemModel({
    required String id,
    required String medicineId,
    required String medicineName,
    required String dosage,
    String? brandName,
    String? genericName,
    required int currentStock,
    required int minStockLevel,
    int? reservedQuantity,
    required double unitPrice,
    required String batchNumber,
    required DateTime expiryDate,
    required DateTime lastRestocked,
    String? rackLocation,
    bool? isChronicMedication,
    bool? isScheduledDrug,
    String? supplierName,
  }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);

  // Convert to domain entity
  InventoryItemEntity toEntity() {
    return InventoryItemEntity(
      id: id,
      medicineId: medicineId,
      medicineName: medicineName,
      dosage: dosage,
      brandName: brandName,
      genericName: genericName,
      currentStock: currentStock,
      minStockLevel: minStockLevel,
      reservedQuantity: reservedQuantity,
      unitPrice: unitPrice,
      batchNumber: batchNumber,
      expiryDate: expiryDate,
      lastRestocked: lastRestocked,
      rackLocation: rackLocation,
      isChronicMedication: isChronicMedication,
      isScheduledDrug: isScheduledDrug,
      supplierName: supplierName,
    );
  }

  factory InventoryItemModel.fromEntity(InventoryItemEntity entity) {
    return InventoryItemModel(
      id: entity.id,
      medicineId: entity.medicineId,
      medicineName: entity.medicineName,
      dosage: entity.dosage,
      brandName: entity.brandName,
      genericName: entity.genericName,
      currentStock: entity.currentStock,
      minStockLevel: entity.minStockLevel,
      reservedQuantity: entity.reservedQuantity,
      unitPrice: entity.unitPrice,
      batchNumber: entity.batchNumber,
      expiryDate: entity.expiryDate,
      lastRestocked: entity.lastRestocked,
      rackLocation: entity.rackLocation,
      isChronicMedication: entity.isChronicMedication,
      isScheduledDrug: entity.isScheduledDrug,
      supplierName: entity.supplierName,
    );
  }
}
