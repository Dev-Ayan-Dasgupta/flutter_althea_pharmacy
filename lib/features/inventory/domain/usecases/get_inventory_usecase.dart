import 'package:dartz/dartz.dart';
import '../entities/inventory_entity.dart';
import '../repositories/inventory_repository.dart';

class GetInventoryUseCase {
  final InventoryRepository repository;

  GetInventoryUseCase(this.repository);

  Future<Either<String, List<InventoryItemEntity>>> call() async {
    return await repository.getInventory();
  }
}
