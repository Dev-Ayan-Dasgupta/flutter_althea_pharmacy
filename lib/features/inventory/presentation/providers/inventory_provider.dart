import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/inventory_entity.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../../domain/usecases/get_inventory_usecase.dart';
import '../../data/repositories/mock_inventory_repository.dart';
import 'inventory_state.dart';

part 'inventory_provider.g.dart';

// Repository provider
@riverpod
InventoryRepository inventoryRepository(Ref ref) {
  return MockInventoryRepository();
}

// Use case provider
@riverpod
GetInventoryUseCase getInventoryUseCase(Ref ref) {
  return GetInventoryUseCase(ref.watch(inventoryRepositoryProvider));
}

// Inventory state provider
@riverpod
class Inventory extends _$Inventory {
  @override
  InventoryState build() {
    loadInventory();
    return const InventoryState.initial();
  }

  Future<void> loadInventory() async {
    state = const InventoryState.loading();

    final useCase = ref.read(getInventoryUseCaseProvider);
    final result = await useCase();

    result.fold(
      (error) => state = InventoryState.error(error),
      (items) => state = InventoryState.loaded(items),
    );
  }

  Future<void> updateStock(String id, int newQuantity) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.updateStock(id, newQuantity);

    result.fold(
      (error) {
        // Handle error
      },
      (_) {
        loadInventory();
      },
    );
  }

  // Filter helpers
  List<InventoryItemEntity> getLowStockItems() {
    return state.maybeWhen(
      loaded: (items) => items.where((i) => i.needsRestock).toList(),
      orElse: () => [],
    );
  }

  List<InventoryItemEntity> getExpiringSoonItems() {
    return state.maybeWhen(
      loaded: (items) =>
          items.where((i) => i.isExpiringSoon || i.isExpired).toList(),
      orElse: () => [],
    );
  }

  List<InventoryItemEntity> getChronicMedications() {
    return state.maybeWhen(
      loaded: (items) =>
          items.where((i) => i.isChronicMedication == true).toList(),
      orElse: () => [],
    );
  }
}
