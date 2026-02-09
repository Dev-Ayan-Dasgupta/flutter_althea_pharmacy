import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_entity.dart';

part 'order_action_entity.freezed.dart';

@freezed
abstract class OrderActionEntity with _$OrderActionEntity {
  const factory OrderActionEntity.accept({
    required String orderId,
    required List<OrderItemEntity> items,
    String? notes,
  }) = AcceptOrderAction;

  const factory OrderActionEntity.reject({
    required String orderId,
    required String reason,
  }) = RejectOrderAction;

  const factory OrderActionEntity.partialAccept({
    required String orderId,
    required List<OrderItemEntity> availableItems,
    required List<OrderItemEntity> unavailableItems,
    String? notes,
  }) = PartialAcceptOrderAction;

  const factory OrderActionEntity.generateInvoice({required String orderId}) =
      GenerateInvoiceAction;

  const factory OrderActionEntity.generateQR({required String orderId}) =
      GenerateQRAction;

  const factory OrderActionEntity.markReady({required String orderId}) =
      MarkReadyAction;

  const factory OrderActionEntity.confirmPickup({
    required String orderId,
    required String qrData,
  }) = ConfirmPickupAction;

  const factory OrderActionEntity.updateLocation({
    required String orderId,
    required double lat,
    required double lng,
  }) = UpdateLocationAction;

  const factory OrderActionEntity.markDelivered({required String orderId}) =
      MarkDeliveredAction;
}
