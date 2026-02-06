// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryItemModel _$InventoryItemModelFromJson(Map<String, dynamic> json) =>
    _InventoryItemModel(
      id: json['id'] as String,
      medicineId: json['medicineId'] as String,
      medicineName: json['medicineName'] as String,
      dosage: json['dosage'] as String,
      brandName: json['brandName'] as String?,
      genericName: json['genericName'] as String?,
      currentStock: (json['currentStock'] as num).toInt(),
      minStockLevel: (json['minStockLevel'] as num).toInt(),
      reservedQuantity: (json['reservedQuantity'] as num?)?.toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      batchNumber: json['batchNumber'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      lastRestocked: DateTime.parse(json['lastRestocked'] as String),
      rackLocation: json['rackLocation'] as String?,
      isChronicMedication: json['isChronicMedication'] as bool?,
      isScheduledDrug: json['isScheduledDrug'] as bool?,
      supplierName: json['supplierName'] as String?,
    );

Map<String, dynamic> _$InventoryItemModelToJson(_InventoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineId': instance.medicineId,
      'medicineName': instance.medicineName,
      'dosage': instance.dosage,
      'brandName': instance.brandName,
      'genericName': instance.genericName,
      'currentStock': instance.currentStock,
      'minStockLevel': instance.minStockLevel,
      'reservedQuantity': instance.reservedQuantity,
      'unitPrice': instance.unitPrice,
      'batchNumber': instance.batchNumber,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'lastRestocked': instance.lastRestocked.toIso8601String(),
      'rackLocation': instance.rackLocation,
      'isChronicMedication': instance.isChronicMedication,
      'isScheduledDrug': instance.isScheduledDrug,
      'supplierName': instance.supplierName,
    };
