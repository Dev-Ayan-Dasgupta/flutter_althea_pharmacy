import 'package:dartz/dartz.dart';
import '../entities/inventory_entity.dart';

abstract class InventoryRepository {
  Future<Either<String, List<InventoryItemEntity>>> getInventory();
  Future<Either<String, InventoryItemEntity>> getInventoryItemById(String id);
  Future<Either<String, void>> updateStock(String id, int newQuantity);
  Future<Either<String, void>> addInventoryItem(InventoryItemEntity item);
  Stream<List<InventoryItemEntity>> watchInventory();
}
