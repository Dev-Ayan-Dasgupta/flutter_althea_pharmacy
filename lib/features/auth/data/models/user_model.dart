import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String pharmacyName,
    String? phoneNumber,
    String? profileImageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Convert to domain entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      pharmacyName: pharmacyName,
      phoneNumber: phoneNumber,
      profileImageUrl: profileImageUrl,
    );
  }

  // Create from domain entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      pharmacyName: entity.pharmacyName,
      phoneNumber: entity.phoneNumber,
      profileImageUrl: entity.profileImageUrl,
    );
  }
}
