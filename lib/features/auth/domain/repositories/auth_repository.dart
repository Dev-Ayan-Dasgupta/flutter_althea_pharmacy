import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login(String email, String password);
  Future<Either<String, void>> logout();
  Future<Either<String, UserEntity>> getCurrentUser();
  Future<bool> isAuthenticated();
  Future<Either<String, void>> register(
    String email,
    String password,
    String name,
  );
}
