import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../providers/settings_provider.dart';
import '../providers/settings_state.dart';
import '../../domain/entities/settings_entity.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ),
      body: settingsState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
          ),
        ),
        loaded: (settings) =>
            _buildSettingsContent(context, ref, settings, isDark),
        error: (message) => _buildErrorState(context, ref, message),
      ),
    );
  }

  Widget _buildSettingsContent(
    BuildContext context,
    WidgetRef ref,
    SettingsEntity settings,
    bool isDark,
  ) {
    return ResponsiveContainer(
      maxWidth: 800,
      child: ListView(
        padding: ResponsivePadding.all(context),
        children: [
          // Appearance Section
          _buildSectionHeader('Appearance', Icons.palette, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            _buildThemeSelector(context, ref, settings, isDark),
          ], isDark),

          const SizedBox(height: 24),

          // Language Section
          _buildSectionHeader('Language', Icons.language, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            _buildLanguageSelector(context, ref, settings, isDark),
          ], isDark),

          const SizedBox(height: 24),

          // Notifications Section
          _buildSectionHeader('Notifications', Icons.notifications, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            SwitchListTile(
              title: Text(
                'Enable Notifications',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Receive push notifications',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              value: settings.notificationsEnabled,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .updateSettings(
                      settings.copyWith(notificationsEnabled: value),
                    );
              },
            ),
            if (settings.notificationsEnabled) ...[
              const Divider(height: 1),
              SwitchListTile(
                title: Text(
                  'Order Alerts',
                  style: AppTypography.bodyMedium(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                subtitle: Text(
                  'New orders and order updates',
                  style: AppTypography.caption(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                value: settings.orderAlertsEnabled,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .updateSettings(
                        settings.copyWith(orderAlertsEnabled: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(
                  'Low Stock Alerts',
                  style: AppTypography.bodyMedium(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                subtitle: Text(
                  'When inventory runs low',
                  style: AppTypography.caption(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                value: settings.lowStockAlertsEnabled,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .updateSettings(
                        settings.copyWith(lowStockAlertsEnabled: value),
                      );
                },
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(
                  'Expiry Alerts',
                  style: AppTypography.bodyMedium(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                subtitle: Text(
                  'Medicines expiring soon',
                  style: AppTypography.caption(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                value: settings.expiryAlertsEnabled,
                onChanged: (value) {
                  ref
                      .read(settingsProvider.notifier)
                      .updateSettings(
                        settings.copyWith(expiryAlertsEnabled: value),
                      );
                },
              ),
            ],
          ], isDark),

          const SizedBox(height: 24),

          // Sound & Vibration Section
          _buildSectionHeader('Sound & Vibration', Icons.volume_up, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            SwitchListTile(
              title: Text(
                'Sound',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Play sound for notifications',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              value: settings.soundEnabled,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .updateSettings(settings.copyWith(soundEnabled: value));
              },
            ),
            const Divider(height: 1),
            SwitchListTile(
              title: Text(
                'Vibration',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Vibrate for notifications',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              value: settings.vibrationEnabled,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .updateSettings(settings.copyWith(vibrationEnabled: value));
              },
            ),
          ], isDark),

          const SizedBox(height: 24),

          // Order Preferences Section
          _buildSectionHeader('Order Preferences', Icons.shopping_bag, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            SwitchListTile(
              title: Text(
                'Auto Accept Orders',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Automatically accept incoming orders',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              value: settings.autoAcceptOrders,
              onChanged: (value) {
                ref
                    .read(settingsProvider.notifier)
                    .updateSettings(settings.copyWith(autoAcceptOrders: value));
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: Text(
                'Order Radius',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '${settings.orderRadius.toStringAsFixed(1)} km',
                    style: AppTypography.labelMedium(AppColors.primaryDark),
                  ),
                  Slider(
                    value: settings.orderRadius,
                    min: 1.0,
                    max: 20.0,
                    divisions: 19,
                    label: '${settings.orderRadius.toStringAsFixed(1)} km',
                    onChanged: (value) {
                      ref
                          .read(settingsProvider.notifier)
                          .updateSettings(
                            settings.copyWith(orderRadius: value),
                          );
                    },
                  ),
                  Text(
                    'Accept orders within this radius',
                    style: AppTypography.caption(
                      isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ], isDark),

          const SizedBox(height: 24),

          // Data & Storage Section
          _buildSectionHeader('Data & Storage', Icons.storage, isDark),
          const SizedBox(height: 12),
          _buildSettingsCard(context, [
            ListTile(
              leading: const Icon(Icons.cleaning_services),
              title: Text(
                'Clear Cache',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Free up storage space',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              onTap: () => _showClearCacheDialog(context),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.download),
              title: Text(
                'Download Data',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              subtitle: Text(
                'Export your data',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              onTap: () => _showDownloadDataDialog(context),
            ),
          ], isDark),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, bool isDark) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primaryDark),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTypography.titleSmall(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsCard(
    BuildContext context,
    List<Widget> children,
    bool isDark,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildThemeSelector(
    BuildContext context,
    WidgetRef ref,
    SettingsEntity settings,
    bool isDark,
  ) {
    return Column(
      children: [
        _buildCustomRadioTile(
          context,
          title: 'Light Mode',
          subtitle: 'Always use light theme',
          isSelected: settings.themeMode == ThemeMode.light,
          onTap: () {
            ref
                .read(settingsProvider.notifier)
                .updateThemeMode(ThemeMode.light);
          },
          isDark: isDark,
        ),
        const Divider(height: 1),
        _buildCustomRadioTile(
          context,
          title: 'Dark Mode',
          subtitle: 'Always use dark theme',
          isSelected: settings.themeMode == ThemeMode.dark,
          onTap: () {
            ref.read(settingsProvider.notifier).updateThemeMode(ThemeMode.dark);
          },
          isDark: isDark,
        ),
        const Divider(height: 1),
        _buildCustomRadioTile(
          context,
          title: 'System Default',
          subtitle: 'Follow system theme settings',
          isSelected: settings.themeMode == ThemeMode.system,
          onTap: () {
            ref
                .read(settingsProvider.notifier)
                .updateThemeMode(ThemeMode.system);
          },
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildLanguageSelector(
    BuildContext context,
    WidgetRef ref,
    SettingsEntity settings,
    bool isDark,
  ) {
    return Column(
      children: [
        _buildCustomRadioTile(
          context,
          title: 'English',
          subtitle: null,
          isSelected: settings.language == Language.english,
          onTap: () {
            ref
                .read(settingsProvider.notifier)
                .updateLanguage(Language.english);
          },
          isDark: isDark,
        ),
        const Divider(height: 1),
        _buildCustomRadioTile(
          context,
          title: 'हिंदी (Hindi)',
          subtitle: null,
          isSelected: settings.language == Language.hindi,
          onTap: () {
            ref.read(settingsProvider.notifier).updateLanguage(Language.hindi);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Language changed to Hindi. Full translation coming soon!',
                ),
                duration: Duration(seconds: 2),
              ),
            );
          },
          isDark: isDark,
        ),
        const Divider(height: 1),
        _buildCustomRadioTile(
          context,
          title: 'বাংলা (Bengali)',
          subtitle: null,
          isSelected: settings.language == Language.bengali,
          onTap: () {
            ref
                .read(settingsProvider.notifier)
                .updateLanguage(Language.bengali);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Language changed to Bengali. Full translation coming soon!',
                ),
                duration: Duration(seconds: 2),
              ),
            );
          },
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildCustomRadioTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryDark
                      : (isDark ? AppColors.borderDark : AppColors.borderLight),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium(
                      isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTypography.caption(
                        isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading settings',
            style: AppTypography.titleMedium(AppColors.error),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTypography.bodyMedium(
              Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ref.read(settingsProvider.notifier).loadSettings(),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text(
          'This will delete temporary files and free up storage space. '
          'Your data will not be affected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cache cleared successfully!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _showDownloadDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Download Data'),
        content: const Text(
          'Your data will be exported as a CSV file. This may take a few moments.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Download started!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }
}
