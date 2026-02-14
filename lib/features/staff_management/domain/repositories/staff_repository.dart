import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../entities/staff_entity.dart';

abstract class StaffRepository {
  /// Get all staff members for a pharmacy
  Future<Either<String, List<StaffEntity>>> getAllStaff(String pharmacyId);

  /// Get staff member by ID
  Future<Either<String, StaffEntity>> getStaffById(String id);

  /// Add new staff member
  Future<Either<String, StaffEntity>> addStaff({
    required String name,
    required String email,
    required String password,
    required String pharmacyId,
    required RoleEntity role,
    String? phoneNumber,
    String? photoUrl,
  });

  /// Update staff member details
  Future<Either<String, StaffEntity>> updateStaff({
    required String id,
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    RoleEntity? role,
    bool? isActive,
  });

  /// Update staff permissions
  Future<Either<String, StaffEntity>> updateStaffPermissions({
    required String id,
    required RoleEntity role,
  });

  /// Delete/deactivate staff member
  Future<Either<String, void>> deleteStaff(String id);

  /// Reactivate staff member
  Future<Either<String, StaffEntity>> reactivateStaff(String id);
}
