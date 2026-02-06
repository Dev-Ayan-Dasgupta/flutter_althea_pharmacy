// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      orderNumber: json['orderNumber'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      pharmacyAmount: (json['pharmacyAmount'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      fulfillmentFee: (json['fulfillmentFee'] as num).toDouble(),
      customerName: json['customerName'] as String?,
      deliveryBoyName: json['deliveryBoyName'] as String?,
      withdrawalMethod: json['withdrawalMethod'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'orderNumber': instance.orderNumber,
      'type': instance.type,
      'status': instance.status,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'pharmacyAmount': instance.pharmacyAmount,
      'deliveryFee': instance.deliveryFee,
      'fulfillmentFee': instance.fulfillmentFee,
      'customerName': instance.customerName,
      'deliveryBoyName': instance.deliveryBoyName,
      'withdrawalMethod': instance.withdrawalMethod,
      'referenceNumber': instance.referenceNumber,
      'notes': instance.notes,
    };
