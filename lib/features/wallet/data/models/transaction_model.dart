import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction_entity.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  const factory TransactionModel({
    required String id,
    required String orderId,
    required String orderNumber,
    required String type,
    required String status,
    required DateTime transactionDate,
    required double totalAmount,
    required double pharmacyAmount,
    required double deliveryFee,
    required double fulfillmentFee,
    String? customerName,
    String? deliveryBoyName,
    String? withdrawalMethod,
    String? referenceNumber,
    String? notes,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      orderId: orderId,
      orderNumber: orderNumber,
      type: _typeFromString(type),
      status: _statusFromString(status),
      transactionDate: transactionDate,
      totalAmount: totalAmount,
      pharmacyAmount: pharmacyAmount,
      deliveryFee: deliveryFee,
      fulfillmentFee: fulfillmentFee,
      customerName: customerName,
      deliveryBoyName: deliveryBoyName,
      withdrawalMethod: withdrawalMethod,
      referenceNumber: referenceNumber,
      notes: notes,
    );
  }

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      orderId: entity.orderId,
      orderNumber: entity.orderNumber,
      type: entity.type.name,
      status: entity.status.name,
      transactionDate: entity.transactionDate,
      totalAmount: entity.totalAmount,
      pharmacyAmount: entity.pharmacyAmount,
      deliveryFee: entity.deliveryFee,
      fulfillmentFee: entity.fulfillmentFee,
      customerName: entity.customerName,
      deliveryBoyName: entity.deliveryBoyName,
      withdrawalMethod: entity.withdrawalMethod,
      referenceNumber: entity.referenceNumber,
      notes: entity.notes,
    );
  }

  static TransactionType _typeFromString(String type) {
    switch (type) {
      case 'withdrawal':
        return TransactionType.withdrawal;
      case 'refund':
        return TransactionType.refund;
      case 'adjustment':
        return TransactionType.adjustment;
      default:
        return TransactionType.orderPayment;
    }
  }

  static TransactionStatus _statusFromString(String status) {
    switch (status) {
      case 'completed':
        return TransactionStatus.completed;
      case 'failed':
        return TransactionStatus.failed;
      case 'processing':
        return TransactionStatus.processing;
      default:
        return TransactionStatus.pending;
    }
  }
}
