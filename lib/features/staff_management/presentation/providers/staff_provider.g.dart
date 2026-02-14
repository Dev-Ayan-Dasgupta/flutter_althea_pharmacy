// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(staffRepository)
const staffRepositoryProvider = StaffRepositoryProvider._();

final class StaffRepositoryProvider
    extends
        $FunctionalProvider<StaffRepository, StaffRepository, StaffRepository>
    with $Provider<StaffRepository> {
  const StaffRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffRepositoryHash();

  @$internal
  @override
  $ProviderElement<StaffRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StaffRepository create(Ref ref) {
    return staffRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffRepository>(value),
    );
  }
}

String _$staffRepositoryHash() => r'7bcc7340a51001da55015cdee04838cbd58d0180';

@ProviderFor(StaffManagement)
const staffManagementProvider = StaffManagementProvider._();

final class StaffManagementProvider
    extends $NotifierProvider<StaffManagement, StaffState> {
  const StaffManagementProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffManagementProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffManagementHash();

  @$internal
  @override
  StaffManagement create() => StaffManagement();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffState>(value),
    );
  }
}

String _$staffManagementHash() => r'36a280b6e1bd05fd35f1d0035e0beb0c12f3ecaf';

abstract class _$StaffManagement extends $Notifier<StaffState> {
  StaffState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StaffState, StaffState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StaffState, StaffState>,
              StaffState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
