import 'package:dartz/dartz.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../models/order_model.dart';

class MockOrdersRepository implements OrdersRepository {
  // Mock data
  final List<OrderModel> _mockOrders = [
    // Emergency Order
    OrderModel(
      id: 'ORD001',
      orderNumber: '#ALT2026001',
      customerName: 'Ramesh Kumar',
      customerPhone: '+91 98765 43210',
      deliveryAddress: '23, MG Road, Rajarhat, Kolkata - 700135',
      orderTime: DateTime.now().subtract(const Duration(minutes: 15)),
      status: 'prescriptionVerification',
      priority: 'emergency',
      totalAmount: 1250.00,
      itemCount: 4,
      prescriptionImageUrl: 'https://example.com/prescription1.jpg',
      specialInstructions: 'Patient has high fever. Urgent delivery needed.',
      estimatedDeliveryTime: DateTime.now().add(const Duration(minutes: 30)),
      medicines: [
        const MedicineItemModel(
          id: 'MED001',
          name: 'Paracetamol',
          dosage: '500mg',
          quantity: 10,
          price: 50.00,
          brandName: 'Crocin',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED002',
          name: 'Azithromycin',
          dosage: '500mg',
          quantity: 6,
          price: 180.00,
          brandName: 'Azee',
          isScheduledDrug: true,
        ),
        const MedicineItemModel(
          id: 'MED003',
          name: 'Cetrizine',
          dosage: '10mg',
          quantity: 10,
          price: 20.00,
          brandName: 'Cetirizine',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED004',
          name: 'Vitamin C',
          dosage: '500mg',
          quantity: 15,
          price: 150.00,
          brandName: 'Limcee',
          isScheduledDrug: false,
        ),
      ],
    ),

    // Critical Care Order
    OrderModel(
      id: 'ORD002',
      orderNumber: '#ALT2026002',
      customerName: 'Priya Sharma',
      customerPhone: '+91 87654 32109',
      deliveryAddress: '45, Salt Lake, Sector V, Kolkata - 700091',
      orderTime: DateTime.now().subtract(const Duration(minutes: 45)),
      status: 'packing',
      priority: 'critical',
      totalAmount: 2450.00,
      itemCount: 5,
      prescriptionImageUrl: 'https://example.com/prescription2.jpg',
      specialInstructions: 'Chronic patient - diabetes medication',
      estimatedDeliveryTime: DateTime.now().add(const Duration(hours: 1)),
      deliveryBoyName: 'Amit Roy',
      deliveryBoyPhone: '+91 76543 21098',
      medicines: [
        const MedicineItemModel(
          id: 'MED005',
          name: 'Metformin',
          dosage: '500mg',
          quantity: 30,
          price: 450.00,
          brandName: 'Glycomet',
          isScheduledDrug: true,
        ),
        const MedicineItemModel(
          id: 'MED006',
          name: 'Glimepiride',
          dosage: '2mg',
          quantity: 30,
          price: 600.00,
          brandName: 'Amaryl',
          isScheduledDrug: true,
        ),
        const MedicineItemModel(
          id: 'MED007',
          name: 'Atorvastatin',
          dosage: '10mg',
          quantity: 30,
          price: 800.00,
          brandName: 'Atorlip',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED008',
          name: 'Aspirin',
          dosage: '75mg',
          quantity: 30,
          price: 300.00,
          brandName: 'Ecosprin',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED009',
          name: 'Pantoprazole',
          dosage: '40mg',
          quantity: 30,
          price: 300.00,
          brandName: 'Pan',
          isScheduledDrug: false,
        ),
      ],
    ),

    // Normal Order - Awaiting Handover
    OrderModel(
      id: 'ORD003',
      orderNumber: '#ALT2026003',
      customerName: 'Anita Das',
      customerPhone: '+91 65432 10987',
      deliveryAddress: '12, Park Street, Kolkata - 700016',
      orderTime: DateTime.now().subtract(const Duration(hours: 2)),
      status: 'awaitingHandover',
      priority: 'normal',
      totalAmount: 850.00,
      itemCount: 3,
      prescriptionImageUrl: 'https://example.com/prescription3.jpg',
      estimatedDeliveryTime: DateTime.now().add(const Duration(minutes: 45)),
      deliveryBoyName: 'Rahul Sen',
      deliveryBoyPhone: '+91 54321 09876',
      medicines: [
        const MedicineItemModel(
          id: 'MED010',
          name: 'Amoxicillin',
          dosage: '500mg',
          quantity: 15,
          price: 300.00,
          brandName: 'Novamox',
          isScheduledDrug: true,
        ),
        const MedicineItemModel(
          id: 'MED011',
          name: 'Ibuprofen',
          dosage: '400mg',
          quantity: 10,
          price: 150.00,
          brandName: 'Brufen',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED012',
          name: 'Omeprazole',
          dosage: '20mg',
          quantity: 14,
          price: 400.00,
          brandName: 'Omez',
          isScheduledDrug: false,
        ),
      ],
    ),

    // Normal Order - Verification
    OrderModel(
      id: 'ORD004',
      orderNumber: '#ALT2026004',
      customerName: 'Suresh Patel',
      customerPhone: '+91 43210 98765',
      deliveryAddress: '78, New Town, Action Area 1, Kolkata - 700156',
      orderTime: DateTime.now().subtract(const Duration(minutes: 5)),
      status: 'prescriptionVerification',
      priority: 'normal',
      totalAmount: 620.00,
      itemCount: 2,
      prescriptionImageUrl: 'https://example.com/prescription4.jpg',
      estimatedDeliveryTime: DateTime.now().add(
        const Duration(hours: 1, minutes: 30),
      ),
      medicines: [
        const MedicineItemModel(
          id: 'MED013',
          name: 'Montelukast',
          dosage: '10mg',
          quantity: 30,
          price: 420.00,
          brandName: 'Montek',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED014',
          name: 'Levocetrizine',
          dosage: '5mg',
          quantity: 30,
          price: 200.00,
          brandName: 'Levocet',
          isScheduledDrug: false,
        ),
      ],
    ),

    // Completed Order
    OrderModel(
      id: 'ORD005',
      orderNumber: '#ALT2026005',
      customerName: 'Meera Singh',
      customerPhone: '+91 32109 87654',
      deliveryAddress: '56, Ballygunge, Kolkata - 700019',
      orderTime: DateTime.now().subtract(const Duration(hours: 5)),
      status: 'completed',
      priority: 'normal',
      totalAmount: 1500.00,
      itemCount: 6,
      prescriptionImageUrl: 'https://example.com/prescription5.jpg',
      deliveryBoyName: 'Sanjay Kumar',
      deliveryBoyPhone: '+91 21098 76543',
      medicines: [
        const MedicineItemModel(
          id: 'MED015',
          name: 'Multivitamin',
          dosage: 'Daily',
          quantity: 30,
          price: 450.00,
          brandName: 'Revital',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED016',
          name: 'Calcium',
          dosage: '500mg',
          quantity: 30,
          price: 350.00,
          brandName: 'Shelcal',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED017',
          name: 'Vitamin D3',
          dosage: '60000 IU',
          quantity: 4,
          price: 200.00,
          brandName: 'Uprise D3',
          isScheduledDrug: false,
        ),
        const MedicineItemModel(
          id: 'MED018',
          name: 'Omega 3',
          dosage: '1000mg',
          quantity: 30,
          price: 500.00,
          brandName: 'Omega Plus',
          isScheduledDrug: false,
        ),
      ],
    ),
  ];

  @override
  Future<Either<String, List<OrderEntity>>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    try {
      final entities = _mockOrders.map((model) => model.toEntity()).toList();
      // Sort by priority (emergency first) then by order time
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
  Future<Either<String, OrderEntity>> getOrderById(String orderId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final order = _mockOrders.firstWhere((o) => o.id == orderId);
      return Right(order.toEntity());
    } catch (e) {
      return const Left('Order not found');
    }
  }

  @override
  Future<Either<String, void>> updateOrderStatus(
    String orderId,
    OrderStatus newStatus,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final index = _mockOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        _mockOrders[index] = _mockOrders[index].copyWith(
          status: newStatus.name,
        );
        return const Right(null);
      }
      return const Left('Order not found');
    } catch (e) {
      return Left('Failed to update order: $e');
    }
  }

  @override
  Stream<List<OrderEntity>> watchOrders() {
    // For mock, just emit the list periodically
    return Stream.periodic(
      const Duration(seconds: 5),
      (_) => _mockOrders.map((m) => m.toEntity()).toList(),
    );
  }
}
