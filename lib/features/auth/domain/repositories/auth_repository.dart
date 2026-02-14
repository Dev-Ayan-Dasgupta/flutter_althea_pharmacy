import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login(String email, String password);
  Future<Either<String, void>> logout();
  Future<Either<String, UserEntity?>> getCurrentUser();
  
  // Password management
  Future<Either<String, void>> changePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  });
  
  Future<Either<String, void>> forgotPassword({
    required String email,
  });
  
  Future<Either<String, void>> resetPassword({
    required String token,
    required String newPassword,
  });
}
