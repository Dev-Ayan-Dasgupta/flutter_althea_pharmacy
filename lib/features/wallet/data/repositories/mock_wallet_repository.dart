import 'package:dartz/dartz.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../models/wallet_model.dart';
import '../models/transaction_model.dart';

class MockWalletRepository implements WalletRepository {
  WalletModel _mockWallet = WalletModel(
    pharmacyId: 'pharmacy_001',
    pendingBalance: 2850.00, // Orders awaiting delivery confirmation
    availableBalance: 8450.00, // Ready to withdraw
    totalWithdrawn: 25000.00,
    lifetimeEarnings: 36300.00,
    totalOrders: 48,
    lastUpdated: DateTime.now(),
  );

  final List<TransactionModel> _mockTransactions = [
    // Recent completed order
    TransactionModel(
      id: 'TXN001',
      orderId: 'ORD005',
      orderNumber: '#ALT2026005',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(hours: 5)),
      totalAmount: 1500.00,
      pharmacyAmount: 1230.00,
      deliveryFee: 40.00,
      fulfillmentFee: 230.00,
      customerName: 'Meera Singh',
      deliveryBoyName: 'Sanjay Kumar',
    ),

    // Pending order (not yet delivered)
    TransactionModel(
      id: 'TXN002',
      orderId: 'ORD003',
      orderNumber: '#ALT2026003',
      type: 'orderPayment',
      status: 'pending',
      transactionDate: DateTime.now().subtract(const Duration(hours: 2)),
      totalAmount: 850.00,
      pharmacyAmount: 697.50,
      deliveryFee: 40.00,
      fulfillmentFee: 112.50,
      customerName: 'Anita Das',
      deliveryBoyName: 'Rahul Sen',
      notes: 'Awaiting delivery confirmation',
    ),

    // Recent withdrawal
    TransactionModel(
      id: 'TXN003',
      orderId: 'WD001',
      orderNumber: 'WD-20260206-001',
      type: 'withdrawal',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 1)),
      totalAmount: 5000.00,
      pharmacyAmount: 5000.00,
      deliveryFee: 0,
      fulfillmentFee: 0,
      withdrawalMethod: 'Bank Transfer',
      referenceNumber: 'UTR2026020601234',
    ),

    // Completed orders from yesterday
    TransactionModel(
      id: 'TXN004',
      orderId: 'ORD004',
      orderNumber: '#ALT2026004',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(
        const Duration(days: 1, hours: 8),
      ),
      totalAmount: 620.00,
      pharmacyAmount: 509.00,
      deliveryFee: 30.00,
      fulfillmentFee: 81.00,
      customerName: 'Suresh Patel',
      deliveryBoyName: 'Amit Roy',
    ),

    TransactionModel(
      id: 'TXN005',
      orderId: 'ORD002',
      orderNumber: '#ALT2026002',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 2)),
      totalAmount: 2450.00,
      pharmacyAmount: 2011.50,
      deliveryFee: 50.00,
      fulfillmentFee: 388.50,
      customerName: 'Priya Sharma',
      deliveryBoyName: 'Amit Roy',
    ),

    // Emergency order - higher fulfillment fee
    TransactionModel(
      id: 'TXN006',
      orderId: 'ORD001',
      orderNumber: '#ALT2026001',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 3)),
      totalAmount: 1250.00,
      pharmacyAmount: 1000.00,
      deliveryFee: 50.00,
      fulfillmentFee: 200.00,
      customerName: 'Ramesh Kumar',
      deliveryBoyName: 'Sanjay Kumar',
      notes: 'Emergency order - expedited fulfillment',
    ),

    // Older withdrawal
    TransactionModel(
      id: 'TXN007',
      orderId: 'WD002',
      orderNumber: 'WD-20260203-001',
      type: 'withdrawal',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 3)),
      totalAmount: 10000.00,
      pharmacyAmount: 10000.00,
      deliveryFee: 0,
      fulfillmentFee: 0,
      withdrawalMethod: 'Bank Transfer',
      referenceNumber: 'UTR2026020301234',
    ),

    // Refund case
    TransactionModel(
      id: 'TXN008',
      orderId: 'ORD999',
      orderNumber: '#ALT2026999',
      type: 'refund',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 4)),
      totalAmount: -800.00,
      pharmacyAmount: -656.00,
      deliveryFee: -40.00,
      fulfillmentFee: -104.00,
      customerName: 'Customer Refund',
      notes: 'Order cancelled - medicine not available',
    ),

    // More completed orders
    TransactionModel(
      id: 'TXN009',
      orderId: 'ORD101',
      orderNumber: '#ALT2026101',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 5)),
      totalAmount: 3200.00,
      pharmacyAmount: 2624.00,
      deliveryFee: 60.00,
      fulfillmentFee: 516.00,
      customerName: 'Anjali Verma',
      deliveryBoyName: 'Rahul Sen',
    ),

    TransactionModel(
      id: 'TXN010',
      orderId: 'ORD102',
      orderNumber: '#ALT2026102',
      type: 'orderPayment',
      status: 'completed',
      transactionDate: DateTime.now().subtract(const Duration(days: 6)),
      totalAmount: 1800.00,
      pharmacyAmount: 1476.00,
      deliveryFee: 40.00,
      fulfillmentFee: 284.00,
      customerName: 'Vikram Singh',
      deliveryBoyName: 'Sanjay Kumar',
    ),
  ];

  @override
  Future<Either<String, WalletEntity>> getWallet() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      return Right(_mockWallet.toEntity());
    } catch (e) {
      return Left('Failed to load wallet: $e');
    }
  }

  @override
  Future<Either<String, List<TransactionEntity>>> getTransactions() async {
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final entities = _mockTransactions.map((m) => m.toEntity()).toList();
      // Sort by date descending
      entities.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
      return Right(entities);
    } catch (e) {
      return Left('Failed to load transactions: $e');
    }
  }

  @override
  Future<Either<String, void>> withdrawFunds(double amount) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      if (amount > _mockWallet.availableBalance) {
        return const Left('Insufficient balance');
      }

      if (amount < 100) {
        return const Left('Minimum withdrawal amount is ₹100');
      }

      // Update wallet
      _mockWallet = _mockWallet.copyWith(
        availableBalance: _mockWallet.availableBalance - amount,
        totalWithdrawn: _mockWallet.totalWithdrawn + amount,
        lastUpdated: DateTime.now(),
      );

      // Add withdrawal transaction
      _mockTransactions.insert(
        0,
        TransactionModel(
          id: 'TXN_${DateTime.now().millisecondsSinceEpoch}',
          orderId: 'WD_${DateTime.now().millisecondsSinceEpoch}',
          orderNumber: 'WD-${DateTime.now().toString().substring(0, 10)}-001',
          type: 'withdrawal',
          status: 'processing',
          transactionDate: DateTime.now(),
          totalAmount: amount,
          pharmacyAmount: amount,
          deliveryFee: 0,
          fulfillmentFee: 0,
          withdrawalMethod: 'Bank Transfer',
          referenceNumber: 'UTR${DateTime.now().millisecondsSinceEpoch}',
          notes: 'Withdrawal request initiated',
        ),
      );

      return const Right(null);
    } catch (e) {
      return Left('Failed to process withdrawal: $e');
    }
  }

  @override
  Stream<WalletEntity> watchWallet() {
    return Stream.periodic(
      const Duration(seconds: 10),
      (_) => _mockWallet.toEntity(),
    );
  }
}
