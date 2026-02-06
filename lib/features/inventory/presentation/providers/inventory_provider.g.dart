// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inventoryRepository)
const inventoryRepositoryProvider = InventoryRepositoryProvider._();

final class InventoryRepositoryProvider
    extends
        $FunctionalProvider<
          InventoryRepository,
          InventoryRepository,
          InventoryRepository
        >
    with $Provider<InventoryRepository> {
  const InventoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<InventoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InventoryRepository create(Ref ref) {
    return inventoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryRepository>(value),
    );
  }
}

String _$inventoryRepositoryHash() =>
    r'1379ccf1b83a7057e4666821fe07166fcf3e9391';

@ProviderFor(getInventoryUseCase)
const getInventoryUseCaseProvider = GetInventoryUseCaseProvider._();

final class GetInventoryUseCaseProvider
    extends
        $FunctionalProvider<
          GetInventoryUseCase,
          GetInventoryUseCase,
          GetInventoryUseCase
        >
    with $Provider<GetInventoryUseCase> {
  const GetInventoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getInventoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getInventoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetInventoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetInventoryUseCase create(Ref ref) {
    return getInventoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetInventoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetInventoryUseCase>(value),
    );
  }
}

String _$getInventoryUseCaseHash() =>
    r'fbf9316f7d8a37ffef820de4dced5b0c96731e6d';

@ProviderFor(Inventory)
const inventoryProvider = InventoryProvider._();

final class InventoryProvider
    extends $NotifierProvider<Inventory, InventoryState> {
  const InventoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryHash();

  @$internal
  @override
  Inventory create() => Inventory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryState>(value),
    );
  }
}

String _$inventoryHash() => r'44e1c70f96dcf8db183509fbb0e892923df5a5d5';

abstract class _$Inventory extends $Notifier<InventoryState> {
  InventoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<InventoryState, InventoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InventoryState, InventoryState>,
              InventoryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
