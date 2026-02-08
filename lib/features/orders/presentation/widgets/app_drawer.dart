import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/auth_state.dart';
import '../../../notifications/presentation/providers/notification_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.primaryGradientSubtleDark
              : AppColors.primaryGradientSubtle,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppColors.primaryGradientSubtleDark
                      : AppColors.primaryGradientSubtle,
                ),
                child: authState.maybeWhen(
                  authenticated: (user) => Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white.withValues(alpha: 0.3),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.name,
                        style: AppTypography.titleLarge(Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.pharmacyName,
                        style: AppTypography.bodyMedium(
                          Colors.white.withValues(alpha: 0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    _buildDrawerItem(
                      context,
                      icon: Icons.home_outlined,
                      title: 'Orders',
                      onTap: () {
                        context.go('/home');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.inventory_2_outlined,
                      title: 'Inventory',
                      onTap: () {
                        context.go('/home/inventory');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Wallet',
                      onTap: () {
                        context.go('/home/wallet');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final unreadCount = ref
                            .watch(notificationsProvider.notifier)
                            .getUnreadCount();
                        return _buildDrawerItem(
                          context,
                          icon: Icons.notifications_outlined,
                          title: 'Notifications',
                          badge: unreadCount > 0 ? '$unreadCount' : null,
                          onTap: () {
                            context.go('/home/notifications');
                            Navigator.pop(context);
                          },
                          isDark: isDark,
                        );
                      },
                    ),

                    const Divider(),

                    _buildDrawerItem(
                      context,
                      icon: Icons.person_outline,
                      title: 'Profile',
                      onTap: () {
                        context.go('/home/profile');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        context.go('/home/settings');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),

                    const Divider(),

                    _buildDrawerItem(
                      context,
                      icon: Icons.help_outline,
                      title: 'Help & FAQ',
                      onTap: () {
                        context.go('/home/faq');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.info_outline,
                      title: 'About',
                      onTap: () {
                        context.go('/home/about');
                        Navigator.pop(context);
                      },
                      isDark: isDark,
                    ),

                    const Divider(),

                    _buildDrawerItem(
                      context,
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () => _showLogoutDialog(context, ref),
                      isDark: isDark,
                      isDestructive: true,
                    ),
                  ],
                ),
              ),

              // App Version
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.1)
                            : AppColors.primaryDark.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.local_pharmacy,
                        color: isDark ? Colors.white70 : AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'AltheaCare Pharmacy',
                      style: AppTypography.labelSmall(
                        isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Version 1.0.0',
                      style: AppTypography.caption(
                        isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
    String? badge,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive
            ? AppColors.error
            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
      ),
      title: Text(
        title,
        style: AppTypography.bodyMedium(
          isDestructive
              ? AppColors.error
              : (isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight),
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(badge, style: AppTypography.labelSmall(Colors.white)),
            )
          : null,
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.logout, color: AppColors.error),
            const SizedBox(width: 12),
            Text(
              'Logout',
              style: AppTypography.titleLarge(
                Theme.of(context).textTheme.titleLarge!.color!,
              ),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: AppTypography.bodyMedium(
            Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close drawer
              ref.read(authProvider.notifier).logout();
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
