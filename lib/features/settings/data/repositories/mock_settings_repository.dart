import 'package:dartz/dartz.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';

class MockSettingsRepository implements SettingsRepository {
  SettingsEntity _mockSettings = const SettingsEntity(
    themeMode: ThemeMode.system,
    language: Language.english,
    notificationsEnabled: true,
    orderAlertsEnabled: true,
    lowStockAlertsEnabled: true,
    expiryAlertsEnabled: true,
    soundEnabled: true,
    vibrationEnabled: true,
    autoAcceptOrders: false,
    orderRadius: 5.0,
  );

  @override
  Future<Either<String, SettingsEntity>> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      return Right(_mockSettings);
    } catch (e) {
      return Left('Failed to load settings: $e');
    }
  }

  @override
  Future<Either<String, void>> updateSettings(SettingsEntity settings) async {
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      _mockSettings = settings;
      return const Right(null);
    } catch (e) {
      return Left('Failed to update settings: $e');
    }
  }
}
