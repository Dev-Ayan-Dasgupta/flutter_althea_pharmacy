import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';

class OrdersHeader extends StatelessWidget {
  final String userName;
  final String pharmacyName;
  final VoidCallback onLogout;

  const OrdersHeader({
    super.key,
    required this.userName,
    required this.pharmacyName,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
        // Use different gradients for dark/light mode
        gradient: isDark
            ? const LinearGradient(
                colors: [Color(0xFF00B887), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.primaryLight : AppColors.primaryDark)
                .withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 16),

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
                    Colors.white.withValues(alpha: isDark ? 0.85 : 0.9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Inventory Icon
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.inventory_2_outlined),
              color: Colors.white,
              tooltip: 'Inventory',
              onPressed: () => context.go('/home/inventory'),
            ),
          ),

          // Wallet Icon
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.account_balance_wallet_outlined),
              color: Colors.white,
              tooltip: 'Wallet',
              onPressed: () => context.go('/home/wallet'),
            ),
          ),

          // Notification Icon
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: Colors.white,
              tooltip: 'Notifications',
              onPressed: () {
                // TODO: Navigate to notifications
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifications coming soon!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),

          // Logout Icon
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              tooltip: 'Logout',
              onPressed: onLogout,
            ),
          ),
        ],
      ),
    );
  }
}
