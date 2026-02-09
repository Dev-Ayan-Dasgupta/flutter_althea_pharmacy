import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_entity.freezed.dart';

@freezed
abstract class InvoiceEntity with _$InvoiceEntity {
  const factory InvoiceEntity({
    required String invoiceNumber,
    required String orderId,
    required DateTime generatedAt,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required String pharmacyName,
    required String pharmacyAddress,
    required String pharmacyPhone,
    required String pharmacyGSTIN,
    required String pharmacyLicense,
    required List<InvoiceItemEntity> items,
    required double subtotal,
    required double cgst,
    required double sgst,
    required double deliveryFee,
    required double total,
    String? notes,
  }) = _InvoiceEntity;
}

@freezed
abstract class InvoiceItemEntity with _$InvoiceItemEntity {
  const factory InvoiceItemEntity({
    required String name,
    required int quantity,
    required double unitPrice,
    required double total,
    bool? isSubstitute,
  }) = _InvoiceItemEntity;
}
