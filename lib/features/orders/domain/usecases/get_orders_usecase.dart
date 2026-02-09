import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';
import '../repositories/orders_repository.dart';

class GetOrdersUseCase {
  final OrderRepository repository;

  GetOrdersUseCase(this.repository);

  Future<Either<String, List<OrderEntity>>> call() async {
    return await repository.getOrders();
  }
}
