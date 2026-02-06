import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mock_orders_respository.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import 'orders_state.dart';

part 'orders_provider.g.dart';

// Repository provider
@riverpod
OrdersRepository ordersRepository(Ref ref) {
  return MockOrdersRepository();
}

// Use case provider
@riverpod
GetOrdersUseCase getOrdersUseCase(Ref ref) {
  return GetOrdersUseCase(ref.watch(ordersRepositoryProvider));
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

    final useCase = ref.read(getOrdersUseCaseProvider);
    final result = await useCase();

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
        // Handle error
      },
      (_) {
        // Reload orders after update
        loadOrders();
      },
    );
  }

  // Filter helpers
  List<OrderEntity> getActiveOrders() {
    return state.maybeWhen(
      loaded: (orders) => orders.where((o) => o.isActive).toList(),
      orElse: () => [],
    );
  }

  List<OrderEntity> getCompletedOrders() {
    return state.maybeWhen(
      loaded: (orders) =>
          orders.where((o) => o.status == OrderStatus.completed).toList(),
      orElse: () => [],
    );
  }
}
