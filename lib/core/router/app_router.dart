import 'package:flutter_altheacare_pharmacy/core/theme/app_urls.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/legal/presentation/screens/export.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/orders/presentation/screens/home_screen.dart';
import '../../features/orders/presentation/screens/order_detail_screen.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';
import '../../features/wallet/presentation/screens/wallet_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Login
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Home (Orders Queue)
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Order Detail
          GoRoute(
            path: 'order/:orderId',
            name: 'order-detail',
            builder: (context, state) {
              final orderId = state.pathParameters['orderId']!;
              return OrderDetailScreen(orderId: orderId);
            },
          ),

          // Inventory
          GoRoute(
            path: 'inventory',
            name: 'inventory',
            builder: (context, state) => const InventoryScreen(),
          ),

          // Wallet
          GoRoute(
            path: 'wallet',
            name: 'wallet',
            builder: (context, state) => const WalletScreen(),
          ),
        ],
      ),

      // Notifications
      GoRoute(
        path: 'notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),

      // Terms & Conditions
      GoRoute(
        path: 'terms',
        name: 'terms',
        builder: (context, state) => const WebViewScreen(
          title: 'Terms & Conditions',
          url: AppUrls.termsAndConditions,
        ),
      ),

      // Privacy Policy
      GoRoute(
        path: 'privacy',
        name: 'privacy',
        builder: (context, state) => const WebViewScreen(
          title: 'Privacy Policy',
          url: AppUrls.privacyPolicy,
        ),
      ),

      // FAQ
      GoRoute(
        path: 'faq',
        name: 'faq',
        builder: (context, state) => const FAQScreen(),
      ),

      // About
      GoRoute(
        path: 'about',
        name: 'about',
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );
}
