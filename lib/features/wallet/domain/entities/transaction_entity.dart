import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

enum TransactionType { orderPayment, withdrawal, refund, adjustment }

enum TransactionStatus { pending, completed, failed, processing }

@freezed
abstract class TransactionEntity with _$TransactionEntity {
  const TransactionEntity._();

  const factory TransactionEntity({
    required String id,
    required String orderId,
    required String orderNumber,
    required TransactionType type,
    required TransactionStatus status,
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
  }) = _TransactionEntity;

  String get typeDisplayName {
    switch (type) {
      case TransactionType.orderPayment:
        return 'Order Payment';
      case TransactionType.withdrawal:
        return 'Withdrawal';
      case TransactionType.refund:
        return 'Refund';
      case TransactionType.adjustment:
        return 'Adjustment';
    }
  }

  String get statusDisplayName {
    switch (status) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.processing:
        return 'Processing';
    }
  }
}
