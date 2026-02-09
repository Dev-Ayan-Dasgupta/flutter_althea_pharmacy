import 'package:dartz/dartz.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_action_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../models/order_model.dart';

class MockOrdersRepository implements OrderRepository {
  // Mock data storage
  final List<OrderModel> _mockOrders = [
    // Emergency Order
    OrderModel(
      id: 'ORD001',
      orderId: '#ALT2026001',
      customerName: 'Ramesh Kumar',
      customerPhone: '+91 98765 43210',
      deliveryAddress: '23, MG Road, Rajarhat, Kolkata - 700135',
      distance: 2.5,
      orderTime: DateTime.now().subtract(const Duration(minutes: 15)),
      status: 'pending',
      priority: 'emergency',
      totalAmount: 1250.00,
      prescriptionUrl: 'https://picsum.photos/800/1200?random=1',
      notes: 'Patient has high fever. Urgent delivery needed.',
      items: [
        const OrderItemModel(
          id: 'ITEM001',
          medicineName: 'Paracetamol 500mg',
          quantity: 10,
          price: 50.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM002',
          medicineName: 'Azithromycin 500mg',
          quantity: 6,
          price: 180.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM003',
          medicineName: 'Cetrizine 10mg',
          quantity: 10,
          price: 20.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM004',
          medicineName: 'Vitamin C 500mg',
          quantity: 15,
          price: 150.00,
          availability: 'available',
        ),
      ],
    ),

    // Urgent Order
    OrderModel(
      id: 'ORD002',
      orderId: '#ALT2026002',
      customerName: 'Priya Sharma',
      customerPhone: '+91 87654 32109',
      deliveryAddress: '45, Salt Lake, Sector V, Kolkata - 700091',
      distance: 4.2,
      orderTime: DateTime.now().subtract(const Duration(minutes: 45)),
      status: 'accepted',
      priority: 'urgent',
      totalAmount: 2450.00,
      prescriptionUrl: 'https://picsum.photos/800/1200?random=2',
      notes: 'Chronic patient - diabetes medication',
      acceptedAt: DateTime.now().subtract(const Duration(minutes: 40)),
      items: [
        const OrderItemModel(
          id: 'ITEM005',
          medicineName: 'Metformin 500mg',
          quantity: 30,
          price: 450.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM006',
          medicineName: 'Glimepiride 2mg',
          quantity: 30,
          price: 600.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM007',
          medicineName: 'Atorvastatin 10mg',
          quantity: 30,
          price: 800.00,
          availability: 'available',
        ),
      ],
    ),

    // Normal Order - Ready for Pickup
    OrderModel(
      id: 'ORD003',
      orderId: '#ALT2026003',
      customerName: 'Anita Das',
      customerPhone: '+91 65432 10987',
      deliveryAddress: '12, Park Street, Kolkata - 700016',
      distance: 1.8,
      orderTime: DateTime.now().subtract(const Duration(hours: 2)),
      status: 'readyForPickup',
      priority: 'normal',
      totalAmount: 850.00,
      prescriptionUrl: 'https://picsum.photos/800/1200?random=3',
      acceptedAt: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 50),
      ),
      readyAt: DateTime.now().subtract(const Duration(minutes: 30)),
      qrCode: 'QR_ORD003_DATA',
      invoiceUrl: 'https://example.com/invoice/ORD003.pdf',
      items: [
        const OrderItemModel(
          id: 'ITEM010',
          medicineName: 'Amoxicillin 500mg',
          quantity: 15,
          price: 300.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM011',
          medicineName: 'Ibuprofen 400mg',
          quantity: 10,
          price: 150.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM012',
          medicineName: 'Omeprazole 20mg',
          quantity: 14,
          price: 400.00,
          availability: 'available',
        ),
      ],
    ),

    // Out for Delivery
    OrderModel(
      id: 'ORD004',
      orderId: '#ALT2026004',
      customerName: 'Suresh Patel',
      customerPhone: '+91 43210 98765',
      deliveryAddress: '78, New Town, Action Area 1, Kolkata - 700156',
      distance: 5.5,
      orderTime: DateTime.now().subtract(const Duration(hours: 3)),
      status: 'outForDelivery',
      priority: 'normal',
      totalAmount: 620.00,
      prescriptionUrl: 'https://picsum.photos/800/1200?random=4',
      acceptedAt: DateTime.now().subtract(
        const Duration(hours: 2, minutes: 50),
      ),
      readyAt: DateTime.now().subtract(const Duration(hours: 2)),
      pickedUpAt: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 30),
      ),
      qrCode: 'QR_ORD004_DATA',
      invoiceUrl: 'https://example.com/invoice/ORD004.pdf',
      deliveryPartnerId: 'DP001',
      deliveryPartnerName: 'Rahul Sen',
      deliveryPartnerPhone: '+91 98765 00001',
      deliveryPartnerLat: 22.5726,
      deliveryPartnerLng: 88.3639,
      items: [
        const OrderItemModel(
          id: 'ITEM013',
          medicineName: 'Montelukast 10mg',
          quantity: 30,
          price: 420.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM014',
          medicineName: 'Levocetrizine 5mg',
          quantity: 30,
          price: 200.00,
          availability: 'available',
        ),
      ],
    ),

    // Completed Order
    OrderModel(
      id: 'ORD005',
      orderId: '#ALT2026005',
      customerName: 'Meera Singh',
      customerPhone: '+91 32109 87654',
      deliveryAddress: '56, Ballygunge, Kolkata - 700019',
      distance: 3.2,
      orderTime: DateTime.now().subtract(const Duration(hours: 5)),
      status: 'delivered',
      priority: 'normal',
      totalAmount: 1500.00,
      prescriptionUrl: 'https://picsum.photos/800/1200?random=5',
      acceptedAt: DateTime.now().subtract(
        const Duration(hours: 4, minutes: 50),
      ),
      readyAt: DateTime.now().subtract(const Duration(hours: 4)),
      pickedUpAt: DateTime.now().subtract(
        const Duration(hours: 3, minutes: 30),
      ),
      deliveredAt: DateTime.now().subtract(const Duration(hours: 2)),
      qrCode: 'QR_ORD005_DATA',
      invoiceUrl: 'https://example.com/invoice/ORD005.pdf',
      deliveryPartnerId: 'DP002',
      deliveryPartnerName: 'Sanjay Kumar',
      deliveryPartnerPhone: '+91 98765 00002',
      items: [
        const OrderItemModel(
          id: 'ITEM015',
          medicineName: 'Multivitamin Daily',
          quantity: 30,
          price: 450.00,
          availability: 'available',
        ),
        const OrderItemModel(
          id: 'ITEM016',
          medicineName: 'Calcium 500mg',
          quantity: 30,
          price: 350.00,
          availability: 'available',
        ),
      ],
    ),
  ];

  @override
  Future<Either<String, List<OrderEntity>>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final entities = _mockOrders.map((model) => model.toEntity()).toList();
      // Sort by priority then by order time
      entities.sort((a, b) {
        if (a.priority != b.priority) {
          return b.priority.index.compareTo(a.priority.index);
        }
        return b.orderTime.compareTo(a.orderTime);
      });
      return Right(entities);
    } catch (e) {
      return Left('Failed to load orders: $e');
    }
  }

  @override
  Future<Either<String, OrderEntity>> getOrderById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final order = _mockOrders.firstWhere((o) => o.id == id);
      return Right(order.toEntity());
    } catch (e) {
      return const Left('Order not found');
    }
  }

  @override
  Future<Either<String, void>> updateOrderStatus(
    String id,
    OrderStatus status,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == id);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(status: status.name);
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to update order: $e');
    }
  }

  @override
  Future<Either<String, void>> acceptOrder(AcceptOrderAction action) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == action.orderId);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'accepted',
          acceptedAt: DateTime.now(),
          items: action.items
              .map((item) => OrderItemModel.fromEntity(item))
              .toList(),
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to accept order: $e');
    }
  }

  @override
  Future<Either<String, void>> rejectOrder(RejectOrderAction action) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == action.orderId);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'rejected',
          rejectionReason: action.reason,
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to reject order: $e');
    }
  }

  @override
  Future<Either<String, void>> partialAcceptOrder(
    PartialAcceptOrderAction action,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == action.orderId);
      if (index != -1) {
        final allItems = [...action.availableItems, ...action.unavailableItems];
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'accepted',
          acceptedAt: DateTime.now(),
          items: allItems
              .map((item) => OrderItemModel.fromEntity(item))
              .toList(),
          notes: action.notes,
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to partially accept order: $e');
    }
  }

  @override
  Future<Either<String, String>> generateInvoice(String orderId) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        final invoiceUrl = 'https://example.com/invoice/$orderId.pdf';
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'preparingInvoice',
          invoiceUrl: invoiceUrl,
        );
        return Right(invoiceUrl);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to generate invoice: $e');
    }
  }

  @override
  Future<Either<String, String>> generateQRCode(String orderId) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        final qrData = 'QR_${orderId}_${DateTime.now().millisecondsSinceEpoch}';
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'readyForPickup',
          qrCode: qrData,
          readyAt: DateTime.now(),
        );
        return Right(qrData);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to generate QR code: $e');
    }
  }

  @override
  Future<Either<String, void>> confirmPickup(
    String orderId,
    String qrData,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        final order = _mockOrders[index];
        if (order.qrCode == qrData) {
          _mockOrders[index] = order.copyWith(
            status: 'pickedUp',
            pickedUpAt: DateTime.now(),
            deliveryPartnerId: 'DP${DateTime.now().millisecondsSinceEpoch}',
            deliveryPartnerName: 'Delivery Partner ${index + 1}',
            deliveryPartnerPhone: '+91 98765 000${index + 1}',
          );
          return const Right(null);
        }
        return const Left('Invalid QR code');
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to confirm pickup: $e');
    }
  }

  @override
  Future<Either<String, void>> updateDeliveryLocation(
    String orderId,
    double lat,
    double lng,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(
          deliveryPartnerLat: lat,
          deliveryPartnerLng: lng,
          status: 'outForDelivery',
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to update location: $e');
    }
  }

  @override
  Future<Either<String, void>> markDelivered(String orderId) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: 'delivered',
          deliveredAt: DateTime.now(),
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to mark as delivered: $e');
    }
  }
}
