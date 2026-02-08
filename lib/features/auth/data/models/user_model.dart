import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/role_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String pharmacyId,
    required String pharmacyName,
    required String roleString, // Store as string for JSON
    String? photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Convert to domain entity
  UserEntity toEntity() {
    // Parse role from string
    final userRole = roleString == 'admin' ? UserRole.admin : UserRole.staff;
    final role = userRole == UserRole.admin
        ? RoleEntity.admin
        : RoleEntity.staff;

    return UserEntity(
      id: id,
      email: email,
      name: name,
      pharmacyId: pharmacyId,
      pharmacyName: pharmacyName,
      role: role,
      photoUrl: photoUrl,
    );
  }

  // Create from domain entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      pharmacyId: entity.pharmacyId,
      pharmacyName: entity.pharmacyName,
      roleString: entity.role.role.name, // Convert role to string
      photoUrl: entity.photoUrl,
    );
  }
}
