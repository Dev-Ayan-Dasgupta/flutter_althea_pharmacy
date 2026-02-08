import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';

class OrdersHeader extends StatelessWidget {
  final String userName;
  final String pharmacyName;
  final VoidCallback onLogout;
  final VoidCallback? onSearchPressed;

  const OrdersHeader({
    super.key,
    required this.userName,
    required this.pharmacyName,
    required this.onLogout,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(
        Responsive.valueWhen(
          context: context,
          mobile: 16,
          tablet: 20,
          desktop: 24,
        ),
      ),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.primaryLight : AppColors.primaryDark)
                .withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Add hamburger menu button for mobile
          if (isMobile)
            Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                tooltip: 'Menu',
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          else
            // Desktop/Tablet: Show Avatar
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 28),
            ),

          if (!isMobile) const SizedBox(width: 16),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTypography.titleLarge(Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  pharmacyName,
                  style: AppTypography.bodyMedium(
                    Colors.white.withValues(alpha: 0.9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Desktop/Tablet: Show icon buttons
          if (!isMobile) ...[
            // Add Search Icon
            _buildIconButton(
              context,
              Icons.search,
              'Search',
              onSearchPressed ?? () => context.go('/home/orders/search'),
              isDark,
            ),

            const SizedBox(width: 8),
            // Inventory Icon
            _buildIconButton(
              context,
              Icons.inventory_2_outlined,
              'Inventory',
              () => context.go('/home/inventory'),
              isDark,
            ),

            const SizedBox(width: 8),

            // Wallet Icon
            _buildIconButton(
              context,
              Icons.account_balance_wallet_outlined,
              'Wallet',
              () => context.go('/home/wallet'),
              isDark,
            ),

            const SizedBox(width: 8),

            // Notification Icon
            _buildIconButton(
              context,
              Icons.notifications_outlined,
              'Notifications',
              () => context.go('/home/notifications'),
              isDark,
              badge: 3,
            ),

            const SizedBox(width: 8),

            // Logout Icon
            _buildIconButton(
              context,
              Icons.logout,
              'Logout',
              () => _showLogoutDialog(context, onLogout),
              isDark,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
    bool isDark, {
    int? badge,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          IconButton(
            icon: Icon(icon),
            color: Colors.white,
            tooltip: tooltip,
            onPressed: onPressed,
          ),
          if (badge != null && badge > 0)
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  badge > 9 ? '9+' : '$badge',
                  style: AppTypography.caption(
                    Colors.white,
                  ).copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, VoidCallback onLogout) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.logout, color: AppColors.error),
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
              Navigator.pop(context);
              onLogout();
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
