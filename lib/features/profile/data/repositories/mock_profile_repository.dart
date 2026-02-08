import 'package:dartz/dartz.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  ProfileEntity _mockProfile = ProfileEntity(
    id: 'PHARM001',
    pharmacyName: 'HealthCare Pharmacy',
    ownerName: 'Rajesh Kumar',
    email: 'rajesh.kumar@healthcare.com',
    phone: '+91 98765 43210',
    address: '23, MG Road, Rajarhat',
    city: 'Kolkata',
    state: 'West Bengal',
    pincode: '700135',
    licenseNumber: 'WB/PHARM/2020/12345',
    licenseExpiry: DateTime(2027, 12, 31),
    gstin: '19ABCDE1234F1Z5',
    pharmacistName: 'Dr. Anita Sharma',
    pharmacistRegNumber: 'WB/PHAR/45678',
    alternatePhone: '+91 98765 43211',
    establishedDate: DateTime(2015, 6, 15),
    bankName: 'State Bank of India',
    accountNumber: '1234567890',
    ifscCode: 'SBIN0001234',
    upiId: 'healthcare@sbi',
    isVerified: true,
    isActive: true,
  );

  @override
  Future<Either<String, ProfileEntity>> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      return Right(_mockProfile);
    } catch (e) {
      return Left('Failed to load profile: $e');
    }
  }

  @override
  Future<Either<String, void>> updateProfile(ProfileEntity profile) async {
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      _mockProfile = profile;
      return const Right(null);
    } catch (e) {
      return Left('Failed to update profile: $e');
    }
  }
}
