import 'package:freezed_annotation/freezed_annotation.dart';

import 'role_entity.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String name,
    required String pharmacyId,
    required String pharmacyName,
    required RoleEntity role,
    String? photoUrl,
  }) = _UserEntity;
}
