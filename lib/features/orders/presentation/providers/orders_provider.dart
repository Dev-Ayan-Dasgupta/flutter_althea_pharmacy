import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mock_orders_respository.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_action_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../providers/orders_state.dart';

part 'orders_provider.g.dart';

// Repository provider
@riverpod
OrderRepository ordersRepository(Ref ref) {
  return MockOrdersRepository();
}

// Orders state provider
@riverpod
class Orders extends _$Orders {
  @override
  OrdersState build() {
    loadOrders();
    return const OrdersState.initial();
  }

  Future<void> loadOrders() async {
    state = const OrdersState.loading();

    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.getOrders();

    result.fold(
      (error) => state = OrdersState.error(error),
      (orders) => state = OrdersState.loaded(orders),
    );
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.updateOrderStatus(orderId, newStatus);

    result.fold(
      (error) {
        // Handle error - could show snackbar
      },
      (_) {
        // Reload orders after update
        loadOrders();
      },
    );
  }

  // Accept order with items
  Future<bool> acceptOrder(
    String orderId,
    List<OrderItemEntity> items, {
    String? notes,
  }) async {
    final repository = ref.read(ordersRepositoryProvider);
    final action = AcceptOrderAction(
      orderId: orderId,
      items: items,
      notes: notes,
    );

    final result = await repository.acceptOrder(action);

    return result.fold(
      (error) {
        // Handle error
        return false;
      },
      (_) {
        loadOrders();
        return true;
      },
    );
  }

  // Reject order
  Future<bool> rejectOrder(String orderId, String reason) async {
    final repository = ref.read(ordersRepositoryProvider);
    final action = RejectOrderAction(orderId: orderId, reason: reason);

    final result = await repository.rejectOrder(action);

    return result.fold((error) => false, (_) {
      loadOrders();
      return true;
    });
  }

  // Partial accept order
  Future<bool> partialAcceptOrder(
    String orderId,
    List<OrderItemEntity> availableItems,
    List<OrderItemEntity> unavailableItems, {
    String? notes,
  }) async {
    final repository = ref.read(ordersRepositoryProvider);
    final action = PartialAcceptOrderAction(
      orderId: orderId,
      availableItems: availableItems,
      unavailableItems: unavailableItems,
      notes: notes,
    );

    final result = await repository.partialAcceptOrder(action);

    return result.fold((error) => false, (_) {
      loadOrders();
      return true;
    });
  }

  // Generate invoice
  Future<String?> generateInvoice(String orderId) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.generateInvoice(orderId);

    return result.fold((error) => null, (invoiceUrl) {
      loadOrders();
      return invoiceUrl;
    });
  }

  // Generate QR Code
  Future<String?> generateQRCode(String orderId) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.generateQRCode(orderId);

    return result.fold((error) => null, (qrData) {
      loadOrders();
      return qrData;
    });
  }

  // Confirm pickup with QR scan
  Future<bool> confirmPickup(String orderId, String qrData) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.confirmPickup(orderId, qrData);

    return result.fold((error) => false, (_) {
      loadOrders();
      return true;
    });
  }

  // Update delivery location
  Future<bool> updateDeliveryLocation(
    String orderId,
    double lat,
    double lng,
  ) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.updateDeliveryLocation(orderId, lat, lng);

    return result.fold((error) => false, (_) {
      loadOrders();
      return true;
    });
  }

  // Mark as delivered
  Future<bool> markDelivered(String orderId) async {
    final repository = ref.read(ordersRepositoryProvider);
    final result = await repository.markDelivered(orderId);

    return result.fold((error) => false, (_) {
      loadOrders();
      return true;
    });
  }

  // Filter helpers
  List<OrderEntity> getPendingOrders() {
    return state.maybeWhen(
      loaded: (orders) =>
          orders.where((o) => o.status == OrderStatus.pending).toList(),
      orElse: () => [],
    );
  }

  List<OrderEntity> getActiveOrders() {
    return state.maybeWhen(
      loaded: (orders) => orders.where((o) {
        return o.status != OrderStatus.delivered &&
            o.status != OrderStatus.rejected &&
            o.status != OrderStatus.cancelled;
      }).toList(),
      orElse: () => [],
    );
  }

  List<OrderEntity> getCompletedOrders() {
    return state.maybeWhen(
      loaded: (orders) => orders
          .where(
            (o) =>
                o.status == OrderStatus.delivered ||
                o.status == OrderStatus.rejected ||
                o.status == OrderStatus.cancelled,
          )
          .toList(),
      orElse: () => [],
    );
  }

  List<OrderEntity> getInProgressOrders() {
    return state.maybeWhen(
      loaded: (orders) => orders.where((o) {
        return o.status == OrderStatus.accepted ||
            o.status == OrderStatus.preparingInvoice ||
            o.status == OrderStatus.readyForPickup ||
            o.status == OrderStatus.pickedUp ||
            o.status == OrderStatus.outForDelivery;
      }).toList(),
      orElse: () => [],
    );
  }
}
