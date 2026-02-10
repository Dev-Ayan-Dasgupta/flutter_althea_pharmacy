import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/providers/settings_provider.dart';
import 'features/settings/domain/entities/settings_entity.dart' as settings_entity;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for offline storage
  await Hive.initFlutter();

  runApp(const ProviderScope(child: AltheaCarePharmacyApp()));
}

class AltheaCarePharmacyApp extends ConsumerWidget {
  const AltheaCarePharmacyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final settingsState = ref.watch(settingsProvider);

    // Convert custom ThemeMode to Flutter ThemeMode
    final themeMode = settingsState.maybeWhen(
      loaded: (settings) {
        switch (settings.themeMode) {
          case settings_entity.ThemeMode.light:
            return ThemeMode.light;
          case settings_entity.ThemeMode.dark:
            return ThemeMode.dark;
          case settings_entity.ThemeMode.system:
            return ThemeMode.system;
        }
      },
      orElse: () => ThemeMode.system,
    );

    return MaterialApp.router(
      title: 'AltheaCare Pharmacy Partner',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // Router
      routerConfig: router,
    );
  }
}
