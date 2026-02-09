import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required String orderId,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required double distance,
    required DateTime orderTime,
    required String status,
    required String priority,
    required List<OrderItemModel> items,
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
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // Convert to domain entity
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      orderId: orderId,
      customerName: customerName,
      customerPhone: customerPhone,
      deliveryAddress: deliveryAddress,
      distance: distance,
      orderTime: orderTime,
      status: _statusFromString(status),
      priority: _priorityFromString(priority),
      items: items.map((item) => item.toEntity()).toList(),
      totalAmount: totalAmount,
      prescriptionUrl: prescriptionUrl,
      notes: notes,
      rejectionReason: rejectionReason,
      invoiceUrl: invoiceUrl,
      qrCode: qrCode,
      deliveryPartnerId: deliveryPartnerId,
      deliveryPartnerName: deliveryPartnerName,
      deliveryPartnerPhone: deliveryPartnerPhone,
      deliveryPartnerLat: deliveryPartnerLat,
      deliveryPartnerLng: deliveryPartnerLng,
      acceptedAt: acceptedAt,
      readyAt: readyAt,
      pickedUpAt: pickedUpAt,
      deliveredAt: deliveredAt,
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      orderId: entity.orderId,
      customerName: entity.customerName,
      customerPhone: entity.customerPhone,
      deliveryAddress: entity.deliveryAddress,
      distance: entity.distance,
      orderTime: entity.orderTime,
      status: entity.status.name,
      priority: entity.priority.name,
      items: entity.items
          .map((item) => OrderItemModel.fromEntity(item))
          .toList(),
      totalAmount: entity.totalAmount,
      prescriptionUrl: entity.prescriptionUrl,
      notes: entity.notes,
      rejectionReason: entity.rejectionReason,
      invoiceUrl: entity.invoiceUrl,
      qrCode: entity.qrCode,
      deliveryPartnerId: entity.deliveryPartnerId,
      deliveryPartnerName: entity.deliveryPartnerName,
      deliveryPartnerPhone: entity.deliveryPartnerPhone,
      deliveryPartnerLat: entity.deliveryPartnerLat,
      deliveryPartnerLng: entity.deliveryPartnerLng,
      acceptedAt: entity.acceptedAt,
      readyAt: entity.readyAt,
      pickedUpAt: entity.pickedUpAt,
      deliveredAt: entity.deliveredAt,
    );
  }

  static OrderStatus _statusFromString(String status) {
    switch (status) {
      case 'pending':
        return OrderStatus.pending;
      case 'reviewing':
        return OrderStatus.reviewing;
      case 'accepted':
        return OrderStatus.accepted;
      case 'preparingInvoice':
        return OrderStatus.preparingInvoice;
      case 'readyForPickup':
        return OrderStatus.readyForPickup;
      case 'pickedUp':
        return OrderStatus.pickedUp;
      case 'outForDelivery':
        return OrderStatus.outForDelivery;
      case 'delivered':
        return OrderStatus.delivered;
      case 'rejected':
        return OrderStatus.rejected;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }

  static OrderPriority _priorityFromString(String priority) {
    switch (priority) {
      case 'urgent':
        return OrderPriority.urgent;
      case 'emergency':
        return OrderPriority.emergency;
      default:
        return OrderPriority.normal;
    }
  }
}

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();

  const factory OrderItemModel({
    required String id,
    required String medicineName,
    required int quantity,
    required double price,
    required String availability,
    String? substituteId,
    String? substituteName,
    double? substitutePrice,
    String? notes,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  OrderItemEntity toEntity() {
    return OrderItemEntity(
      id: id,
      medicineName: medicineName,
      quantity: quantity,
      price: price,
      availability: _availabilityFromString(availability),
      substituteId: substituteId,
      substituteName: substituteName,
      substitutePrice: substitutePrice,
      notes: notes,
    );
  }

  factory OrderItemModel.fromEntity(OrderItemEntity entity) {
    return OrderItemModel(
      id: entity.id,
      medicineName: entity.medicineName,
      quantity: entity.quantity,
      price: entity.price,
      availability: entity.availability.name,
      substituteId: entity.substituteId,
      substituteName: entity.substituteName,
      substitutePrice: entity.substitutePrice,
      notes: entity.notes,
    );
  }

  static ItemAvailability _availabilityFromString(String availability) {
    switch (availability) {
      case 'unavailable':
        return ItemAvailability.unavailable;
      case 'substituted':
        return ItemAvailability.substituted;
      default:
        return ItemAvailability.available;
    }
  }
}
