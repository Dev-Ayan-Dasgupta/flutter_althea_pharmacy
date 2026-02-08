import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    // Add validation
    if (email.isEmpty || password.isEmpty) {
      return const Left('Email and password are required');
    }

    if (!_isValidEmail(email)) {
      return const Left('Please enter a valid email');
    }

    if (password.length < 6) {
      return const Left('Password must be at least 6 characters');
    }

    return await repository.login(email, password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
