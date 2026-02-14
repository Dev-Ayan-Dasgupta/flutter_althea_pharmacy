import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../auth/domain/entities/role_entity.dart';

part 'staff_entity.freezed.dart';

@freezed
abstract class StaffEntity with _$StaffEntity {
  const factory StaffEntity({
    required String id,
    required String name,
    required String email,
    required String pharmacyId,
    required RoleEntity role,
    String? phoneNumber,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    @Default(true) bool isActive,
  }) = _StaffEntity;
}
