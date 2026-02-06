import 'package:dartz/dartz.dart';
import '../../domain/entities/inventory_entity.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../models/inventory_model.dart';

class MockInventoryRepository implements InventoryRepository {
  final List<InventoryItemModel> _mockInventory = [
    // Chronic Medication - Low Stock
    InventoryItemModel(
      id: 'INV001',
      medicineId: 'MED001',
      medicineName: 'Metformin',
      dosage: '500mg',
      brandName: 'Glycomet',
      genericName: 'Metformin Hydrochloride',
      currentStock: 45,
      minStockLevel: 100,
      reservedQuantity: 30,
      unitPrice: 15.00,
      batchNumber: 'MET2024A',
      expiryDate: DateTime.now().add(const Duration(days: 180)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 15)),
      rackLocation: 'A-12',
      isChronicMedication: true,
      isScheduledDrug: true,
      supplierName: 'MedSupply Co.',
    ),

    // Out of Stock
    InventoryItemModel(
      id: 'INV002',
      medicineId: 'MED002',
      medicineName: 'Azithromycin',
      dosage: '500mg',
      brandName: 'Azee',
      genericName: 'Azithromycin',
      currentStock: 0,
      minStockLevel: 50,
      reservedQuantity: 0,
      unitPrice: 30.00,
      batchNumber: 'AZI2024B',
      expiryDate: DateTime.now().add(const Duration(days: 120)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 30)),
      rackLocation: 'B-05',
      isChronicMedication: false,
      isScheduledDrug: true,
      supplierName: 'PharmaCorp',
    ),

    // Expiring Soon (45 days)
    InventoryItemModel(
      id: 'INV003',
      medicineId: 'MED003',
      medicineName: 'Paracetamol',
      dosage: '500mg',
      brandName: 'Crocin',
      genericName: 'Paracetamol',
      currentStock: 250,
      minStockLevel: 100,
      reservedQuantity: 10,
      unitPrice: 5.00,
      batchNumber: 'PAR2023C',
      expiryDate: DateTime.now().add(const Duration(days: 45)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 90)),
      rackLocation: 'C-08',
      isChronicMedication: false,
      isScheduledDrug: false,
      supplierName: 'MediPlus',
    ),

    // Chronic Med - Good Stock
    InventoryItemModel(
      id: 'INV004',
      medicineId: 'MED004',
      medicineName: 'Amlodipine',
      dosage: '5mg',
      brandName: 'Amlong',
      genericName: 'Amlodipine Besylate',
      currentStock: 180,
      minStockLevel: 80,
      reservedQuantity: 20,
      unitPrice: 8.00,
      batchNumber: 'AML2024D',
      expiryDate: DateTime.now().add(const Duration(days: 240)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 5)),
      rackLocation: 'A-15',
      isChronicMedication: true,
      isScheduledDrug: false,
      supplierName: 'HealthFirst',
    ),

    // In Stock
    InventoryItemModel(
      id: 'INV005',
      medicineId: 'MED005',
      medicineName: 'Omeprazole',
      dosage: '20mg',
      brandName: 'Omez',
      genericName: 'Omeprazole',
      currentStock: 300,
      minStockLevel: 50,
      reservedQuantity: 14,
      unitPrice: 28.00,
      batchNumber: 'OME2024E',
      expiryDate: DateTime.now().add(const Duration(days: 365)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 2)),
      rackLocation: 'D-03',
      isChronicMedication: false,
      isScheduledDrug: false,
      supplierName: 'MedSupply Co.',
    ),

    // Chronic Med - Low Stock
    InventoryItemModel(
      id: 'INV006',
      medicineId: 'MED006',
      medicineName: 'Atorvastatin',
      dosage: '10mg',
      brandName: 'Atorlip',
      genericName: 'Atorvastatin Calcium',
      currentStock: 60,
      minStockLevel: 100,
      reservedQuantity: 30,
      unitPrice: 26.00,
      batchNumber: 'ATO2024F',
      expiryDate: DateTime.now().add(const Duration(days: 200)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 20)),
      rackLocation: 'A-18',
      isChronicMedication: true,
      isScheduledDrug: false,
      supplierName: 'PharmaCorp',
    ),

    // Expiring Very Soon (15 days)
    InventoryItemModel(
      id: 'INV007',
      medicineId: 'MED007',
      medicineName: 'Vitamin C',
      dosage: '500mg',
      brandName: 'Limcee',
      genericName: 'Ascorbic Acid',
      currentStock: 120,
      minStockLevel: 50,
      reservedQuantity: 15,
      unitPrice: 10.00,
      batchNumber: 'VIT2023G',
      expiryDate: DateTime.now().add(const Duration(days: 15)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 180)),
      rackLocation: 'E-10',
      isChronicMedication: false,
      isScheduledDrug: false,
      supplierName: 'VitaHealth',
    ),

    // Good Stock
    InventoryItemModel(
      id: 'INV008',
      medicineId: 'MED008',
      medicineName: 'Cetirizine',
      dosage: '10mg',
      brandName: 'Cetirizine',
      genericName: 'Cetirizine Hydrochloride',
      currentStock: 400,
      minStockLevel: 100,
      reservedQuantity: 10,
      unitPrice: 2.00,
      batchNumber: 'CET2024H',
      expiryDate: DateTime.now().add(const Duration(days: 300)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 10)),
      rackLocation: 'B-12',
      isChronicMedication: false,
      isScheduledDrug: false,
      supplierName: 'MediPlus',
    ),

    // Scheduled Drug - Good Stock
    InventoryItemModel(
      id: 'INV009',
      medicineId: 'MED009',
      medicineName: 'Alprazolam',
      dosage: '0.5mg',
      brandName: 'Alprax',
      genericName: 'Alprazolam',
      currentStock: 80,
      minStockLevel: 30,
      reservedQuantity: 0,
      unitPrice: 45.00,
      batchNumber: 'ALP2024I',
      expiryDate: DateTime.now().add(const Duration(days: 400)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 7)),
      rackLocation: 'SECURED-01',
      isChronicMedication: false,
      isScheduledDrug: true,
      supplierName: 'HealthFirst',
    ),

    // Chronic Med - Reserved Stock
    InventoryItemModel(
      id: 'INV010',
      medicineId: 'MED010',
      medicineName: 'Levothyroxine',
      dosage: '50mcg',
      brandName: 'Thyronorm',
      genericName: 'Levothyroxine Sodium',
      currentStock: 150,
      minStockLevel: 100,
      reservedQuantity: 50,
      unitPrice: 18.00,
      batchNumber: 'LEV2024J',
      expiryDate: DateTime.now().add(const Duration(days: 280)),
      lastRestocked: DateTime.now().subtract(const Duration(days: 12)),
      rackLocation: 'A-20',
      isChronicMedication: true,
      isScheduledDrug: false,
      supplierName: 'PharmaCorp',
    ),
  ];

  @override
  Future<Either<String, List<InventoryItemEntity>>> getInventory() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      final entities = _mockInventory.map((model) => model.toEntity()).toList();

      // Sort by: Out of stock -> Low stock -> Expiring soon -> Others
      entities.sort((a, b) {
        if (a.stockStatus != b.stockStatus) {
          return a.stockStatus.index.compareTo(b.stockStatus.index);
        }
        if (a.isExpiringSoon && !b.isExpiringSoon) return -1;
        if (!a.isExpiringSoon && b.isExpiringSoon) return 1;
        return a.daysUntilExpiry.compareTo(b.daysUntilExpiry);
      });

      return Right(entities);
    } catch (e) {
      return Left('Failed to load inventory: $e');
    }
  }

  @override
  Future<Either<String, InventoryItemEntity>> getInventoryItemById(
    String id,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final item = _mockInventory.firstWhere((i) => i.id == id);
      return Right(item.toEntity());
    } catch (e) {
      return const Left('Item not found');
    }
  }

  @override
  Future<Either<String, void>> updateStock(String id, int newQuantity) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final index = _mockInventory.indexWhere((i) => i.id == id);
      if (index != -1) {
        _mockInventory[index] = _mockInventory[index].copyWith(
          currentStock: newQuantity,
          lastRestocked: DateTime.now(),
        );
        return const Right(null);
      }
      return const Left('Item not found');
    } catch (e) {
      return Left('Failed to update stock: $e');
    }
  }

  @override
  Future<Either<String, void>> addInventoryItem(
    InventoryItemEntity item,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      _mockInventory.add(InventoryItemModel.fromEntity(item));
      return const Right(null);
    } catch (e) {
      return Left('Failed to add item: $e');
    }
  }

  @override
  Stream<List<InventoryItemEntity>> watchInventory() {
    return Stream.periodic(
      const Duration(seconds: 10),
      (_) => _mockInventory.map((m) => m.toEntity()).toList(),
    );
  }
}
