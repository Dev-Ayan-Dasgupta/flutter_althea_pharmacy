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
  
  // Mock password storage (DEMO ONLY - NOT FOR PRODUCTION)
  // In a real app, passwords should NEVER be stored in plain text.
  // This is for demonstration purposes only. Use secure password hashing
  // (e.g., bcrypt, argon2) and store on backend server.
  final Map<String, String> _userPasswords = {
    'user_123': 'password123', // Demo password - DO NOT USE IN PRODUCTION
  };
  
  // Mock password reset tokens
  final Map<String, String> _resetTokens = {};

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

  @override
  Future<Either<String, void>> changePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Validate current password
      final storedPassword = _userPasswords[userId];
      if (storedPassword == null) {
        return left('User not found');
      }

      if (storedPassword != currentPassword) {
        return left('Current password is incorrect');
      }

      // Validate new password
      if (newPassword.length < 6) {
        return left('New password must be at least 6 characters');
      }

      if (newPassword == currentPassword) {
        return left('New password must be different from current password');
      }

      // Update password
      _userPasswords[userId] = newPassword;

      return right(null);
    } catch (e) {
      return left('Failed to change password: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> forgotPassword({
    required String email,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Validate email
      if (email.isEmpty) {
        return left('Email is required');
      }

      // In a real app, we would send an email with a reset link
      // For mock, we'll generate a token and store it
      final token = 'reset_token_${DateTime.now().millisecondsSinceEpoch}';
      _resetTokens[email] = token;

      // Mock: Simulate email sent
      return right(null);
    } catch (e) {
      return left('Failed to send reset email: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Validate token
      final email = _resetTokens.entries
          .firstWhere(
            (entry) => entry.value == token,
            orElse: () => const MapEntry('', ''),
          )
          .key;

      if (email.isEmpty) {
        return left('Invalid or expired reset token');
      }

      // Validate new password
      if (newPassword.length < 6) {
        return left('Password must be at least 6 characters');
      }

      // For mock purposes, we'll update a default user's password
      _userPasswords['user_123'] = newPassword;

      // Remove used token
      _resetTokens.remove(email);

      return right(null);
    } catch (e) {
      return left('Failed to reset password: ${e.toString()}');
    }
  }
}
