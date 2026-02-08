import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String id,
    required String pharmacyName,
    required String ownerName,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required String licenseNumber,
    required DateTime licenseExpiry,
    required String gstin,
    required String pharmacistName,
    required String pharmacistRegNumber,
    String? alternatePhone,
    String? logoUrl,
    DateTime? establishedDate,
    String? bankName,
    String? accountNumber,
    String? ifscCode,
    String? upiId,
    bool? isVerified,
    bool? isActive,
  }) = _ProfileEntity;
}
