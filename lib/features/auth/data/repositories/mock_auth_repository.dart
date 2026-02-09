import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/role_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserId = 'user_id';
  static const String _keyUserName = 'user_name';
  static const String _keyUserEmail = 'user_email';
  static const String _keyPharmacyName = 'pharmacy_name';

  @override
  Future<Either<String, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Simple validation
      if (email.isEmpty || password.isEmpty) {
        return left('Email and password are required');
      }

      if (password.length < 6) {
        return left('Password must be at least 6 characters');
      }

      // Mock user data
      final user = UserEntity(
        id: 'user_123',
        name: 'Dr. John Doe',
        email: email,
        pharmacyName: 'HealthPlus Pharmacy',
        role: RoleEntity.admin,
        pharmacyId: 'pharmacy_123',
      );

      // Save login state
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyIsLoggedIn, true);
      await prefs.setString(_keyUserId, user.id);
      await prefs.setString(_keyUserName, user.name);
      await prefs.setString(_keyUserEmail, user.email);
      await prefs.setString(_keyPharmacyName, user.pharmacyName);

      return right(user);
    } catch (e) {
      return left('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> logout() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 300));

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      return right(null);
    } catch (e) {
      return left('Logout failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, UserEntity?>> getCurrentUser() async {
    try {
      // Reduce delay for faster startup
      await Future.delayed(const Duration(milliseconds: 300));

      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;

      if (!isLoggedIn) {
        return right(null);
      }

      final user = UserEntity(
        id: prefs.getString(_keyUserId) ?? '',
        name: prefs.getString(_keyUserName) ?? '',
        email: prefs.getString(_keyUserEmail) ?? '',
        pharmacyName: prefs.getString(_keyPharmacyName) ?? '',
        role: RoleEntity.staff,
        pharmacyId: prefs.getString(_keyUserId) ?? '',
      );

      return right(user);
    } catch (e) {
      return left('Failed to get current user: ${e.toString()}');
    }
  }
}
