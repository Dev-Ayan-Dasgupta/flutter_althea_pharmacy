// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  orderNumber: json['orderNumber'] as String,
  customerName: json['customerName'] as String,
  customerPhone: json['customerPhone'] as String,
  deliveryAddress: json['deliveryAddress'] as String,
  orderTime: DateTime.parse(json['orderTime'] as String),
  status: json['status'] as String,
  priority: json['priority'] as String,
  totalAmount: (json['totalAmount'] as num).toDouble(),
  itemCount: (json['itemCount'] as num).toInt(),
  medicines: (json['medicines'] as List<dynamic>)
      .map((e) => MedicineItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  prescriptionImageUrl: json['prescriptionImageUrl'] as String?,
  deliveryBoyName: json['deliveryBoyName'] as String?,
  deliveryBoyPhone: json['deliveryBoyPhone'] as String?,
  estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
      ? null
      : DateTime.parse(json['estimatedDeliveryTime'] as String),
  specialInstructions: json['specialInstructions'] as String?,
);

Map<String, dynamic> _$OrderModelToJson(
  _OrderModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'customerName': instance.customerName,
  'customerPhone': instance.customerPhone,
  'deliveryAddress': instance.deliveryAddress,
  'orderTime': instance.orderTime.toIso8601String(),
  'status': instance.status,
  'priority': instance.priority,
  'totalAmount': instance.totalAmount,
  'itemCount': instance.itemCount,
  'medicines': instance.medicines,
  'prescriptionImageUrl': instance.prescriptionImageUrl,
  'deliveryBoyName': instance.deliveryBoyName,
  'deliveryBoyPhone': instance.deliveryBoyPhone,
  'estimatedDeliveryTime': instance.estimatedDeliveryTime?.toIso8601String(),
  'specialInstructions': instance.specialInstructions,
};

_MedicineItemModel _$MedicineItemModelFromJson(Map<String, dynamic> json) =>
    _MedicineItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      brandName: json['brandName'] as String?,
      genericName: json['genericName'] as String?,
      isScheduledDrug: json['isScheduledDrug'] as bool?,
    );

Map<String, dynamic> _$MedicineItemModelToJson(_MedicineItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'quantity': instance.quantity,
      'price': instance.price,
      'brandName': instance.brandName,
      'genericName': instance.genericName,
      'isScheduledDrug': instance.isScheduledDrug,
    };
