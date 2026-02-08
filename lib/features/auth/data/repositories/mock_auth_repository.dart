import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/role_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  UserEntity? _currentUser;

  @override
  Future<Either<String, UserEntity>> login(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    // Demo credentials with roles
    if (email == 'admin@pharmacy.com' && password == 'admin123') {
      _currentUser = const UserEntity(
        id: 'USER001',
        email: 'admin@pharmacy.com',
        name: 'Admin User',
        pharmacyId: 'PHARM001',
        pharmacyName: 'HealthCare Pharmacy',
        role: RoleEntity.admin,
      );
      return Right(_currentUser!);
    } else if (email == 'staff@pharmacy.com' && password == 'staff123') {
      _currentUser = const UserEntity(
        id: 'USER002',
        email: 'staff@pharmacy.com',
        name: 'Staff User',
        pharmacyId: 'PHARM001',
        pharmacyName: 'HealthCare Pharmacy',
        role: RoleEntity.staff,
      );
      return Right(_currentUser!);
    } else if (email == 'demo@pharmacy.com' && password == 'demo123') {
      _currentUser = const UserEntity(
        id: 'USER003',
        email: 'demo@pharmacy.com',
        name: 'Demo User',
        pharmacyId: 'PHARM001',
        pharmacyName: 'HealthCare Pharmacy',
        role: RoleEntity.admin,
      );
      return Right(_currentUser!);
    }

    return const Left('Invalid credentials');
  }

  @override
  Future<Either<String, void>> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    return const Right(null);
  }

  @override
  Future<Either<String, UserEntity>> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (_currentUser != null) {
      return Right(_currentUser!);
    }

    return const Left('No user logged in');
  }

  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _currentUser != null;
  }

  @override
  Future<Either<String, void>> register(
    String email,
    String password,
    String name,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    // Mock registration - creates staff user by default
    _currentUser = UserEntity(
      id: 'USER_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
      pharmacyId: 'PHARM001',
      pharmacyName: 'HealthCare Pharmacy',
      role: RoleEntity.staff,
    );

    return const Right(null);
  }
}
