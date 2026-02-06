import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/inventory_entity.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.loaded(List<InventoryItemEntity> items) =
      _Loaded;
  const factory InventoryState.error(String message) = _Error;
}
