// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewOrderNotifier)
const newOrderProvider = NewOrderNotifierProvider._();

final class NewOrderNotifierProvider
    extends $NotifierProvider<NewOrderNotifier, OrderEntity?> {
  const NewOrderNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newOrderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newOrderNotifierHash();

  @$internal
  @override
  NewOrderNotifier create() => NewOrderNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderEntity?>(value),
    );
  }
}

String _$newOrderNotifierHash() => r'8c2f72bfd3aae0924713bff11b1d94be5c0a3b3e';

abstract class _$NewOrderNotifier extends $Notifier<OrderEntity?> {
  OrderEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrderEntity?, OrderEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderEntity?, OrderEntity?>,
              OrderEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
