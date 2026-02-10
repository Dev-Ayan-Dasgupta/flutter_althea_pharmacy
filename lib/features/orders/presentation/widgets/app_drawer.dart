import 'package:flutter/material.dart';
import 'package:flutter_altheacare_pharmacy/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../../../core/providers/permission_provider.dart';
import '../../../notifications/presentation/providers/notification_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentRole = ref.watch(currentUserRoleProvider);

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? AppColors.primaryGradientSubtleDark
              : AppColors.primaryGradientSubtle,
        ),
        child: authAsync.when(
          data: (user) {
            if (user == null) {
              return const Center(child: Text('Not logged in'));
            }
            return Column(
              children: [
                // Header
                _buildDrawerHeader(context, user, isDark),

                // Menu Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                        context,
                        icon: Icons.shopping_bag_outlined,
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

                      // Wallet - Only if has permission
                      if (ref.watch(
                        hasPermissionProvider(Permission.viewWallet),
                      ))
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

                      const Divider(),

                      // Notifications
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

                      // Profile - Only if has permission
                      if (ref.watch(
                        hasPermissionProvider(Permission.viewProfile),
                      ))
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

                      // Settings - Only if has permission
                      if (ref.watch(
                        hasPermissionProvider(Permission.viewSettings),
                      ))
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
                        icon: Icons.description,
                        title: 'Terms & Conditions',
                        onTap: () {
                          context.go('/home/terms');
                          Navigator.pop(context);
                        },
                        isDark: isDark,
                      ),

                      _buildDrawerItem(
                        context,
                        icon: Icons.privacy_tip,
                        title: 'Privacy Policy',
                        onTap: () {
                          context.go('/home/privacy');
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
                    ],
                  ),
                ),

                // Role Badge & Logout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Role Badge
                      if (currentRole != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: currentRole.role == UserRole.admin
                                ? AppColors.primaryGradient
                                : AppColors.accentGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                currentRole.role == UserRole.admin
                                    ? Icons.admin_panel_settings
                                    : Icons.person,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                currentRole.displayName,
                                style: AppTypography.labelSmall(Colors.white),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 12),
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: AppColors.error,
                        ),
                        title: Text(
                          'Logout',
                          style: AppTypography.bodyMedium(AppColors.error),
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          await _showLogoutDialog(context, ref);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context, dynamic user, bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: Text(
              user.name[0].toUpperCase(),
              style: AppTypography.headlineSmall(Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Text(user.name, style: AppTypography.titleLarge(Colors.white)),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.8)),
          ),
          const SizedBox(height: 4),
          Text(
            user.pharmacyName,
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.8)),
          ),
        ],
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
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 14,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
      title: Text(
        title,
        style: AppTypography.bodyMedium(
          isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
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

  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) {
                context.pop();
                context.go('/login');
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Logout'),

                /// if logout is happening show a loader until the process is complete
                if (ref.watch(authProvider).isLoading) ...[
                  const SizedBox(width: 8),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
