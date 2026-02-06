import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/repositories/mock_auth_repository.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

// Repository provider
@riverpod
AuthRepository authRepository(Ref ref) {
  return MockAuthRepository();
}

// Login use case provider
@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

// Auth state provider
@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();

    final useCase = ref.read(loginUseCaseProvider);
    final result = await useCase(email: email, password: password);

    result.fold(
      (error) => state = AuthState.error(error),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AuthState.unauthenticated();
  }

  Future<void> checkAuthStatus() async {
    final repository = ref.read(authRepositoryProvider);
    final isAuth = await repository.isAuthenticated();

    if (isAuth) {
      final result = await repository.getCurrentUser();
      result.fold(
        (_) => state = const AuthState.unauthenticated(),
        (user) => state = AuthState.authenticated(user),
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}
