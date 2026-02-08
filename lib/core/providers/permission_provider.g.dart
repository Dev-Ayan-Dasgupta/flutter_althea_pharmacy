// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentUserRole)
const currentUserRoleProvider = CurrentUserRoleProvider._();

final class CurrentUserRoleProvider
    extends $FunctionalProvider<RoleEntity?, RoleEntity?, RoleEntity?>
    with $Provider<RoleEntity?> {
  const CurrentUserRoleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserRoleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserRoleHash();

  @$internal
  @override
  $ProviderElement<RoleEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoleEntity? create(Ref ref) {
    return currentUserRole(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoleEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoleEntity?>(value),
    );
  }
}

String _$currentUserRoleHash() => r'482c376a19831445f1ca728f5aa62496424da9ea';

@ProviderFor(hasPermission)
const hasPermissionProvider = HasPermissionFamily._();

final class HasPermissionProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const HasPermissionProvider._({
    required HasPermissionFamily super.from,
    required Permission super.argument,
  }) : super(
         retry: null,
         name: r'hasPermissionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$hasPermissionHash();

  @override
  String toString() {
    return r'hasPermissionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as Permission;
    return hasPermission(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HasPermissionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hasPermissionHash() => r'f7ce1fe863bb69ccfde4de001666a12e53adc759';

final class HasPermissionFamily extends $Family
    with $FunctionalFamilyOverride<bool, Permission> {
  const HasPermissionFamily._()
    : super(
        retry: null,
        name: r'hasPermissionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HasPermissionProvider call(Permission permission) =>
      HasPermissionProvider._(argument: permission, from: this);

  @override
  String toString() => r'hasPermissionProvider';
}
