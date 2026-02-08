import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../data/repositories/mock_settings_repository.dart';
import 'settings_state.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  return MockSettingsRepository();
}

@riverpod
class Settings extends _$Settings {
  @override
  SettingsState build() {
    loadSettings();
    return const SettingsState.initial();
  }

  Future<void> loadSettings() async {
    state = const SettingsState.loading();

    final repository = ref.read(settingsRepositoryProvider);
    final result = await repository.getSettings();

    result.fold(
      (error) => state = SettingsState.error(error),
      (settings) => state = SettingsState.loaded(settings),
    );
  }

  Future<void> updateSettings(SettingsEntity settings) async {
    final repository = ref.read(settingsRepositoryProvider);
    final result = await repository.updateSettings(settings);

    result.fold(
      (error) {
        // Handle error
      },
      (_) {
        state = SettingsState.loaded(settings);
      },
    );
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    final currentSettings = state.maybeWhen(
      loaded: (settings) => settings,
      orElse: () => null,
    );

    if (currentSettings != null) {
      await updateSettings(currentSettings.copyWith(themeMode: themeMode));
    }
  }

  Future<void> updateLanguage(Language language) async {
    final currentSettings = state.maybeWhen(
      loaded: (settings) => settings,
      orElse: () => null,
    );

    if (currentSettings != null) {
      await updateSettings(currentSettings.copyWith(language: language));
    }
  }
}
