import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_entity.freezed.dart';

enum StockStatus { inStock, lowStock, outOfStock, reserved }

@freezed
abstract class InventoryItemEntity with _$InventoryItemEntity {
  const InventoryItemEntity._();

  const factory InventoryItemEntity({
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
  }) = _InventoryItemEntity;

  // Helper getters
  StockStatus get stockStatus {
    if (availableStock <= 0) return StockStatus.outOfStock;
    if (availableStock <= minStockLevel) return StockStatus.lowStock;
    if (reservedQuantity != null && reservedQuantity! > 0) {
      return StockStatus.reserved;
    }
    return StockStatus.inStock;
  }

  int get availableStock => currentStock - (reservedQuantity ?? 0);

  int get daysUntilExpiry {
    return expiryDate.difference(DateTime.now()).inDays;
  }

  bool get isExpiringSoon => daysUntilExpiry <= 60 && daysUntilExpiry > 0;

  bool get isExpired => daysUntilExpiry <= 0;

  bool get needsRestock =>
      stockStatus == StockStatus.lowStock ||
      stockStatus == StockStatus.outOfStock;

  String get stockStatusDisplayName {
    switch (stockStatus) {
      case StockStatus.inStock:
        return 'In Stock';
      case StockStatus.lowStock:
        return 'Low Stock';
      case StockStatus.outOfStock:
        return 'Out of Stock';
      case StockStatus.reserved:
        return 'Reserved';
    }
  }
}
