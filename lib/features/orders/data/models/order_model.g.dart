// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  orderId: json['orderId'] as String,
  customerName: json['customerName'] as String,
  customerPhone: json['customerPhone'] as String,
  deliveryAddress: json['deliveryAddress'] as String,
  distance: (json['distance'] as num).toDouble(),
  orderTime: DateTime.parse(json['orderTime'] as String),
  status: json['status'] as String,
  priority: json['priority'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  prescriptionUrl: json['prescriptionUrl'] as String?,
  notes: json['notes'] as String?,
  rejectionReason: json['rejectionReason'] as String?,
  invoiceUrl: json['invoiceUrl'] as String?,
  qrCode: json['qrCode'] as String?,
  deliveryPartnerId: json['deliveryPartnerId'] as String?,
  deliveryPartnerName: json['deliveryPartnerName'] as String?,
  deliveryPartnerPhone: json['deliveryPartnerPhone'] as String?,
  deliveryPartnerLat: (json['deliveryPartnerLat'] as num?)?.toDouble(),
  deliveryPartnerLng: (json['deliveryPartnerLng'] as num?)?.toDouble(),
  acceptedAt: json['acceptedAt'] == null
      ? null
      : DateTime.parse(json['acceptedAt'] as String),
  readyAt: json['readyAt'] == null
      ? null
      : DateTime.parse(json['readyAt'] as String),
  pickedUpAt: json['pickedUpAt'] == null
      ? null
      : DateTime.parse(json['pickedUpAt'] as String),
  deliveredAt: json['deliveredAt'] == null
      ? null
      : DateTime.parse(json['deliveredAt'] as String),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'deliveryAddress': instance.deliveryAddress,
      'distance': instance.distance,
      'orderTime': instance.orderTime.toIso8601String(),
      'status': instance.status,
      'priority': instance.priority,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'prescriptionUrl': instance.prescriptionUrl,
      'notes': instance.notes,
      'rejectionReason': instance.rejectionReason,
      'invoiceUrl': instance.invoiceUrl,
      'qrCode': instance.qrCode,
      'deliveryPartnerId': instance.deliveryPartnerId,
      'deliveryPartnerName': instance.deliveryPartnerName,
      'deliveryPartnerPhone': instance.deliveryPartnerPhone,
      'deliveryPartnerLat': instance.deliveryPartnerLat,
      'deliveryPartnerLng': instance.deliveryPartnerLng,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'readyAt': instance.readyAt?.toIso8601String(),
      'pickedUpAt': instance.pickedUpAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
    };

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: json['id'] as String,
      medicineName: json['medicineName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      availability: json['availability'] as String,
      substituteId: json['substituteId'] as String?,
      substituteName: json['substituteName'] as String?,
      substitutePrice: (json['substitutePrice'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineName': instance.medicineName,
      'quantity': instance.quantity,
      'price': instance.price,
      'availability': instance.availability,
      'substituteId': instance.substituteId,
      'substituteName': instance.substituteName,
      'substitutePrice': instance.substitutePrice,
      'notes': instance.notes,
    };
