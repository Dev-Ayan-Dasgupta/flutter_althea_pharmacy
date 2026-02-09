import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/domain/entities/role_entity.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

part 'permission_provider.g.dart';

@riverpod
RoleEntity? currentUserRole(Ref ref) {
  final authAsync = ref.watch(authProvider);

  return authAsync.maybeWhen(data: (user) => user?.role, orElse: () => null);
}

@riverpod
bool hasPermission(Ref ref, Permission permission) {
  final role = ref.watch(currentUserRoleProvider);
  return role?.hasPermission(permission) ?? false;
}
