import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';
import '../entities/order_action_entity.dart';

abstract class OrderRepository {
  Future<Either<String, List<OrderEntity>>> getOrders();
  Future<Either<String, OrderEntity>> getOrderById(String id);
  Future<Either<String, void>> updateOrderStatus(String id, OrderStatus status);

  // New methods for order tracking
  Future<Either<String, void>> acceptOrder(AcceptOrderAction action);
  Future<Either<String, void>> rejectOrder(RejectOrderAction action);
  Future<Either<String, void>> partialAcceptOrder(
    PartialAcceptOrderAction action,
  );
  Future<Either<String, String>> generateInvoice(String orderId);
  Future<Either<String, String>> generateQRCode(String orderId);
  Future<Either<String, void>> confirmPickup(String orderId, String qrData);
  Future<Either<String, void>> updateDeliveryLocation(
    String orderId,
    double lat,
    double lng,
  );
  Future<Either<String, void>> markDelivered(String orderId);
}
