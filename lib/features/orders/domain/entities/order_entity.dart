import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

enum OrderStatus {
  prescriptionVerification,
  packing,
  awaitingHandover,
  completed,
  cancelled,
}

enum OrderPriority { normal, critical, emergency }

@freezed
abstract class OrderEntity with _$OrderEntity {
  const OrderEntity._();

  const factory OrderEntity({
    required String id,
    required String orderNumber,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required DateTime orderTime,
    required OrderStatus status,
    required OrderPriority priority,
    required double totalAmount,
    required int itemCount,
    required List<MedicineItemEntity> medicines,
    String? prescriptionImageUrl,
    String? deliveryBoyName,
    String? deliveryBoyPhone,
    DateTime? estimatedDeliveryTime,
    String? specialInstructions,
  }) = _OrderEntity;

  // Helper getters
  bool get isCritical =>
      priority == OrderPriority.critical || priority == OrderPriority.emergency;
  bool get isActive =>
      status != OrderStatus.completed && status != OrderStatus.cancelled;

  String get statusDisplayName {
    switch (status) {
      case OrderStatus.prescriptionVerification:
        return 'Prescription Verification';
      case OrderStatus.packing:
        return 'Packing';
      case OrderStatus.awaitingHandover:
        return 'Awaiting Handover';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get priorityDisplayName {
    switch (priority) {
      case OrderPriority.normal:
        return 'Normal';
      case OrderPriority.critical:
        return 'Critical Care';
      case OrderPriority.emergency:
        return 'Emergency';
    }
  }
}

@freezed
abstract class MedicineItemEntity with _$MedicineItemEntity {
  const factory MedicineItemEntity({
    required String id,
    required String name,
    required String dosage,
    required int quantity,
    required double price,
    String? brandName,
    String? genericName,
    bool? isScheduledDrug,
  }) = _MedicineItemEntity;
}
