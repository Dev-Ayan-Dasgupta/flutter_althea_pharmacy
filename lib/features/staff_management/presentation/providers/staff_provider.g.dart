// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$staffRepositoryHash() => r'_staffRepositoryHash';

@ProviderFor(staffRepository)
final staffRepositoryProvider = Provider<StaffRepository>((ref) {
  return staffRepository(ref);
}).._debugLabel = 'staffRepositoryProvider';

String _$staffManagementHash() => r'_staffManagementHash';

abstract class _$StaffManagement extends _$NotifierProviderRef<StaffManagement, StaffState> {}

@ProviderFor(StaffManagement)
final staffManagementProvider =
    NotifierProvider<StaffManagement, StaffState>(() {
  return StaffManagement();
}).._debugLabel = 'staffManagementProvider';
