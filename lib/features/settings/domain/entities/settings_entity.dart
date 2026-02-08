import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_entity.freezed.dart';

enum ThemeMode { light, dark, system }

enum Language { english, hindi, bengali }

@freezed
abstract class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({
    required ThemeMode themeMode,
    required Language language,
    required bool notificationsEnabled,
    required bool orderAlertsEnabled,
    required bool lowStockAlertsEnabled,
    required bool expiryAlertsEnabled,
    required bool soundEnabled,
    required bool vibrationEnabled,
    required bool autoAcceptOrders,
    required double orderRadius,
  }) = _SettingsEntity;
}
