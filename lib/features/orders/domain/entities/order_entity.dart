import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

enum OrderStatus {
  pending, // New order arrived
  reviewing, // Pharmacy checking items
  accepted, // Pharmacy accepted
  preparingInvoice, // Generating invoice
  readyForPickup, // QR generated, waiting for delivery partner
  pickedUp, // Delivery partner picked up
  outForDelivery, // Out for delivery
  delivered, // Delivered to customer
  rejected, // Pharmacy rejected
  cancelled, // Order cancelled
}

enum OrderPriority { normal, urgent, emergency }

enum ItemAvailability { available, unavailable, substituted }

@freezed
abstract class OrderEntity with _$OrderEntity {
  const OrderEntity._();
  const factory OrderEntity({
    required String id,
    required String orderId,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required double distance,
    required DateTime orderTime,
    required OrderStatus status,
    required OrderPriority priority,
    required List<OrderItemEntity> items,
    required double totalAmount,
    String? prescriptionUrl,
    String? notes,
    String? rejectionReason,
    String? invoiceUrl,
    String? qrCode,
    String? deliveryPartnerId,
    String? deliveryPartnerName,
    String? deliveryPartnerPhone,
    double? deliveryPartnerLat,
    double? deliveryPartnerLng,
    DateTime? acceptedAt,
    DateTime? readyAt,
    DateTime? pickedUpAt,
    DateTime? deliveredAt,
  }) = _OrderEntity;

  // Helper getters
  bool get isPending =>
      status == OrderStatus.pending || status == OrderStatus.reviewing;

  bool get isActive =>
      status != OrderStatus.delivered &&
      status != OrderStatus.rejected &&
      status != OrderStatus.cancelled;

  bool get isCompleted =>
      status == OrderStatus.delivered ||
      status == OrderStatus.rejected ||
      status == OrderStatus.cancelled;

  bool get canAccept =>
      status == OrderStatus.pending || status == OrderStatus.reviewing;

  bool get canGenerateInvoice => status == OrderStatus.accepted;

  bool get canGenerateQR =>
      status == OrderStatus.preparingInvoice && invoiceUrl != null;

  bool get isReadyForPickup => status == OrderStatus.readyForPickup;

  bool get isOutForDelivery =>
      status == OrderStatus.outForDelivery || status == OrderStatus.pickedUp;

  String get statusDisplayText {
    switch (status) {
      case OrderStatus.pending:
        return 'New Order';
      case OrderStatus.reviewing:
        return 'Reviewing';
      case OrderStatus.accepted:
        return 'Accepted';
      case OrderStatus.preparingInvoice:
        return 'Preparing Invoice';
      case OrderStatus.readyForPickup:
        return 'Ready for Pickup';
      case OrderStatus.pickedUp:
        return 'Picked Up';
      case OrderStatus.outForDelivery:
        return 'Out for Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.rejected:
        return 'Rejected';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get priorityDisplayText {
    switch (priority) {
      case OrderPriority.emergency:
        return 'Emergency';
      case OrderPriority.urgent:
        return 'Urgent';
      case OrderPriority.normal:
        return 'Normal';
    }
  }
}

@freezed
abstract class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required String id,
    required String medicineName,
    required int quantity,
    required double price,
    required ItemAvailability availability,
    String? substituteId,
    String? substituteName,
    double? substitutePrice,
    String? notes,
  }) = _OrderItemEntity;
}
