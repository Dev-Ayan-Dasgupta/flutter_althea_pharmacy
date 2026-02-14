import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../domain/entities/staff_entity.dart';
import '../../domain/repositories/staff_repository.dart';

class MockStaffRepository implements StaffRepository {
  // In-memory storage for mock data
  final List<StaffEntity> _staffList = [
    StaffEntity(
      id: 'staff_001',
      name: 'Alice Johnson',
      email: 'alice@example.com',
      pharmacyId: 'pharmacy_123',
      role: RoleEntity.staff,
      phoneNumber: '+1234567890',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 2)),
      isActive: true,
    ),
    StaffEntity(
      id: 'staff_002',
      name: 'Bob Smith',
      email: 'bob@example.com',
      pharmacyId: 'pharmacy_123',
      role: RoleEntity.staff,
      phoneNumber: '+1234567891',
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      lastLoginAt: DateTime.now().subtract(const Duration(days: 1)),
      isActive: true,
    ),
    StaffEntity(
      id: 'staff_003',
      name: 'Carol White',
      email: 'carol@example.com',
      pharmacyId: 'pharmacy_123',
      role: RoleEntity.admin,
      phoneNumber: '+1234567892',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      lastLoginAt: DateTime.now().subtract(const Duration(hours: 5)),
      isActive: true,
    ),
  ];

  final _uuid = const Uuid();

  @override
  Future<Either<String, List<StaffEntity>>> getAllStaff(
    String pharmacyId,
  ) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Filter by pharmacy ID
      final staff = _staffList
          .where((s) => s.pharmacyId == pharmacyId)
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return right(staff);
    } catch (e) {
      return left('Failed to fetch staff: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StaffEntity>> getStaffById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final staff = _staffList.firstWhere(
        (s) => s.id == id,
        orElse: () => throw Exception('Staff not found'),
      );

      return right(staff);
    } catch (e) {
      return left('Staff not found: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StaffEntity>> addStaff({
    required String name,
    required String email,
    required String password,
    required String pharmacyId,
    required RoleEntity role,
    String? phoneNumber,
    String? photoUrl,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      // Validate email uniqueness
      final emailExists = _staffList.any((s) => s.email == email);
      if (emailExists) {
        return left('Email already exists');
      }

      // Validate password
      if (password.length < 6) {
        return left('Password must be at least 6 characters');
      }

      // Create new staff
      final newStaff = StaffEntity(
        id: 'staff_${_uuid.v4().substring(0, 8)}',
        name: name,
        email: email,
        pharmacyId: pharmacyId,
        role: role,
        phoneNumber: phoneNumber,
        photoUrl: photoUrl,
        createdAt: DateTime.now(),
        isActive: true,
      );

      _staffList.add(newStaff);

      return right(newStaff);
    } catch (e) {
      return left('Failed to add staff: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StaffEntity>> updateStaff({
    required String id,
    String? name,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    RoleEntity? role,
    bool? isActive,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final index = _staffList.indexWhere((s) => s.id == id);
      if (index == -1) {
        return left('Staff not found');
      }

      // Check email uniqueness if changing email
      if (email != null && email != _staffList[index].email) {
        final emailExists = _staffList.any((s) => s.email == email);
        if (emailExists) {
          return left('Email already exists');
        }
      }

      // Update staff
      final updatedStaff = _staffList[index].copyWith(
        name: name ?? _staffList[index].name,
        email: email ?? _staffList[index].email,
        phoneNumber: phoneNumber ?? _staffList[index].phoneNumber,
        photoUrl: photoUrl ?? _staffList[index].photoUrl,
        role: role ?? _staffList[index].role,
        isActive: isActive ?? _staffList[index].isActive,
      );

      _staffList[index] = updatedStaff;

      return right(updatedStaff);
    } catch (e) {
      return left('Failed to update staff: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StaffEntity>> updateStaffPermissions({
    required String id,
    required RoleEntity role,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final index = _staffList.indexWhere((s) => s.id == id);
      if (index == -1) {
        return left('Staff not found');
      }

      final updatedStaff = _staffList[index].copyWith(role: role);
      _staffList[index] = updatedStaff;

      return right(updatedStaff);
    } catch (e) {
      return left('Failed to update permissions: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> deleteStaff(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final index = _staffList.indexWhere((s) => s.id == id);
      if (index == -1) {
        return left('Staff not found');
      }

      // Soft delete - mark as inactive
      _staffList[index] = _staffList[index].copyWith(isActive: false);

      return right(null);
    } catch (e) {
      return left('Failed to delete staff: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, StaffEntity>> reactivateStaff(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final index = _staffList.indexWhere((s) => s.id == id);
      if (index == -1) {
        return left('Staff not found');
      }

      final reactivatedStaff = _staffList[index].copyWith(isActive: true);
      _staffList[index] = reactivatedStaff;

      return right(reactivatedStaff);
    } catch (e) {
      return left('Failed to reactivate staff: ${e.toString()}');
    }
  }
}
