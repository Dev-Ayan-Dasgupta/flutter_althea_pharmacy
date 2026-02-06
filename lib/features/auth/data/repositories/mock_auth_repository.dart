import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class MockAuthRepository implements AuthRepository {
  UserEntity? _currentUser;

  // Mock credentials
  static const _mockEmail = 'pharmacy@altheacare.com';
  static const _mockPassword = 'pharmacy123';

  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email == _mockEmail && password == _mockPassword) {
      final mockUser = UserModel(
        id: 'pharmacy_001',
        email: email,
        name: 'Dr. Rajesh Kumar',
        pharmacyName: 'MediCare Pharmacy',
        phoneNumber: '+91 98765 43210',
        profileImageUrl: null,
      );

      _currentUser = mockUser.toEntity();
      return Right(_currentUser!);
    } else {
      return const Left('Invalid email or password');
    }
  }

  @override
  Future<Either<String, void>> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    return const Right(null);
  }

  @override
  Future<Either<String, UserEntity>> getCurrentUser() async {
    if (_currentUser != null) {
      return Right(_currentUser!);
    } else {
      return const Left('No user logged in');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    return _currentUser != null;
  }
}
