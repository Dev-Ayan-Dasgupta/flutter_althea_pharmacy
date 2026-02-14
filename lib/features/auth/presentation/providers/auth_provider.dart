import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/mock_auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return MockAuthRepository();
}

@riverpod
class Auth extends _$Auth {
  @override
  Future<UserEntity?> build() async {
    // This properly handles async in build
    return await _checkAuthStatus();
  }

  Future<UserEntity?> _checkAuthStatus() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.getCurrentUser();

      // Handle Either type
      return result.fold(
        (error) => null, // Left side (error) returns null
        (user) => user, // Right side (success) returns user
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.login(email, password);

      // Handle Either type
      return result.fold(
        (error) => throw Exception(error), // Left side (error) throws
        (user) => user, // Right side (success) returns user
      );
    });
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.logout();

      // Handle Either type
      result.fold((error) => throw Exception(error), (_) => null);

      return null;
    });
  }

  Future<bool> changePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.changePassword(
        userId: userId,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      return result.fold(
        (error) => false, // Failed
        (_) => true, // Success
      );
    } catch (e) {
      return false;
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.forgotPassword(email: email);

      return result.fold(
        (error) => false, // Failed
        (_) => true, // Success
      );
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.resetPassword(
        token: token,
        newPassword: newPassword,
      );

      return result.fold(
        (error) => false, // Failed
        (_) => true, // Success
      );
    } catch (e) {
      return false;
    }
  }
}
