import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../domain/entities/staff_entity.dart';
import '../../domain/repositories/staff_repository.dart';
import '../../data/repositories/mock_staff_repository.dart';
import 'staff_state.dart';

part 'staff_provider.g.dart';

@riverpod
StaffRepository staffRepository(Ref ref) {
  return MockStaffRepository();
}

@riverpod
class StaffManagement extends _$StaffManagement {
  @override
  StaffState build() {
    return const StaffState.initial();
  }

  Future<void> loadStaff(String pharmacyId) async {
    state = const StaffState.loading();

    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.getAllStaff(pharmacyId);

    result.fold(
      (error) => state = StaffState.error(error),
      (staffList) => state = StaffState.loaded(staffList),
    );
  }

  Future<bool> addStaff({
    required String name,
    required String email,
    required String password,
    required String pharmacyId,
    required RoleEntity role,
    String? phoneNumber,
    String? photoUrl,
  }) async {
    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.addStaff(
      name: name,
      email: email,
      password: password,
      pharmacyId: pharmacyId,
      role: role,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
    );

    return result.fold(
      (error) {
        state = StaffState.error(error);
        return false;
      },
      (newStaff) {
        // Reload the staff list
        loadStaff(pharmacyId);
        return true;
      },
    );
  }

  Future<bool> updateStaff({
    required String id,
    required String pharmacyId,
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    RoleEntity? role,
    bool? isActive,
  }) async {
    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.updateStaff(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      role: role,
      isActive: isActive,
    );

    return result.fold(
      (error) {
        state = StaffState.error(error);
        return false;
      },
      (_) {
        // Reload the staff list
        loadStaff(pharmacyId);
        return true;
      },
    );
  }

  Future<bool> updateStaffPermissions({
    required String id,
    required String pharmacyId,
    required RoleEntity role,
  }) async {
    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.updateStaffPermissions(
      id: id,
      role: role,
    );

    return result.fold(
      (error) {
        state = StaffState.error(error);
        return false;
      },
      (_) {
        // Reload the staff list
        loadStaff(pharmacyId);
        return true;
      },
    );
  }

  Future<bool> deleteStaff(String id, String pharmacyId) async {
    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.deleteStaff(id);

    return result.fold(
      (error) {
        state = StaffState.error(error);
        return false;
      },
      (_) {
        // Reload the staff list
        loadStaff(pharmacyId);
        return true;
      },
    );
  }

  Future<bool> reactivateStaff(String id, String pharmacyId) async {
    final repository = ref.read(staffRepositoryProvider);
    final result = await repository.reactivateStaff(id);

    return result.fold(
      (error) {
        state = StaffState.error(error);
        return false;
      },
      (_) {
        // Reload the staff list
        loadStaff(pharmacyId);
        return true;
      },
    );
  }
}
