import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepository {
  Future<Either<String, List<OrderEntity>>> getOrders();
  Future<Either<String, OrderEntity>> getOrderById(String orderId);
  Future<Either<String, void>> updateOrderStatus(
    String orderId,
    OrderStatus newStatus,
  );
  Stream<List<OrderEntity>> watchOrders();
}
