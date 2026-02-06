import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required String orderNumber,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required DateTime orderTime,
    required String status,
    required String priority,
    required double totalAmount,
    required int itemCount,
    required List<MedicineItemModel> medicines,
    String? prescriptionImageUrl,
    String? deliveryBoyName,
    String? deliveryBoyPhone,
    DateTime? estimatedDeliveryTime,
    String? specialInstructions,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // Convert to domain entity
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      orderNumber: orderNumber,
      customerName: customerName,
      customerPhone: customerPhone,
      deliveryAddress: deliveryAddress,
      orderTime: orderTime,
      status: _statusFromString(status),
      priority: _priorityFromString(priority),
      totalAmount: totalAmount,
      itemCount: itemCount,
      medicines: medicines.map((m) => m.toEntity()).toList(),
      prescriptionImageUrl: prescriptionImageUrl,
      deliveryBoyName: deliveryBoyName,
      deliveryBoyPhone: deliveryBoyPhone,
      estimatedDeliveryTime: estimatedDeliveryTime,
      specialInstructions: specialInstructions,
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      orderNumber: entity.orderNumber,
      customerName: entity.customerName,
      customerPhone: entity.customerPhone,
      deliveryAddress: entity.deliveryAddress,
      orderTime: entity.orderTime,
      status: entity.status.name,
      priority: entity.priority.name,
      totalAmount: entity.totalAmount,
      itemCount: entity.itemCount,
      medicines: entity.medicines
          .map((m) => MedicineItemModel.fromEntity(m))
          .toList(),
      prescriptionImageUrl: entity.prescriptionImageUrl,
      deliveryBoyName: entity.deliveryBoyName,
      deliveryBoyPhone: entity.deliveryBoyPhone,
      estimatedDeliveryTime: entity.estimatedDeliveryTime,
      specialInstructions: entity.specialInstructions,
    );
  }

  static OrderStatus _statusFromString(String status) {
    switch (status) {
      case 'prescriptionVerification':
        return OrderStatus.prescriptionVerification;
      case 'packing':
        return OrderStatus.packing;
      case 'awaitingHandover':
        return OrderStatus.awaitingHandover;
      case 'completed':
        return OrderStatus.completed;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.prescriptionVerification;
    }
  }

  static OrderPriority _priorityFromString(String priority) {
    switch (priority) {
      case 'critical':
        return OrderPriority.critical;
      case 'emergency':
        return OrderPriority.emergency;
      default:
        return OrderPriority.normal;
    }
  }
}

@freezed
abstract class MedicineItemModel with _$MedicineItemModel {
  const MedicineItemModel._();

  const factory MedicineItemModel({
    required String id,
    required String name,
    required String dosage,
    required int quantity,
    required double price,
    String? brandName,
    String? genericName,
    bool? isScheduledDrug,
  }) = _MedicineItemModel;

  factory MedicineItemModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineItemModelFromJson(json);

  MedicineItemEntity toEntity() {
    return MedicineItemEntity(
      id: id,
      name: name,
      dosage: dosage,
      quantity: quantity,
      price: price,
      brandName: brandName,
      genericName: genericName,
      isScheduledDrug: isScheduledDrug,
    );
  }

  factory MedicineItemModel.fromEntity(MedicineItemEntity entity) {
    return MedicineItemModel(
      id: entity.id,
      name: entity.name,
      dosage: entity.dosage,
      quantity: entity.quantity,
      price: entity.price,
      brandName: entity.brandName,
      genericName: entity.genericName,
      isScheduledDrug: entity.isScheduledDrug,
    );
  }
}
