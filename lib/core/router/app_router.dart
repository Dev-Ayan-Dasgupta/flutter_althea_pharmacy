import 'package:flutter_altheacare_pharmacy/core/theme/app_urls.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/analytics/presentation/screens/analytics_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/legal/presentation/screens/export.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/orders/presentation/screens/export.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
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

          // Item Checker
          GoRoute(
            path: 'order/:orderId/check-items',
            name: 'check-items',
            builder: (context, state) {
              final orderId = state.pathParameters['orderId']!;
              return ItemCheckerScreen(orderId: orderId);
            },
          ),

          // Invoice
          GoRoute(
            path: 'order/:orderId/invoice',
            name: 'invoice',
            builder: (context, state) {
              final orderId = state.pathParameters['orderId']!;
              return InvoiceScreen(orderId: orderId);
            },
          ),

          // QR Code
          GoRoute(
            path: 'order/:orderId/qr-code',
            name: 'qr-code',
            builder: (context, state) {
              final orderId = state.pathParameters['orderId']!;
              return QRCodeScreen(orderId: orderId);
            },
          ),

          // Scan QR Code
          GoRoute(
            path: 'scan-qr',
            name: 'scan-qr',
            builder: (context, state) {
              // Check if platform supports camera scanning
              // if (PlatformUtils.canScanQR) {
              //   return const QRScannerScreenMobile();
              // } else {
              //   return const ManualQRInputScreen();
              // }

              return const ManualQRInputScreen();
            },
          ),

          // Tracking
          GoRoute(
            path: 'order/:orderId/track',
            name: 'track',
            builder: (context, state) {
              final orderId = state.pathParameters['orderId']!;
              return DeliveryTrackingScreen(orderId: orderId);
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
            routes: [
              // Inside wallet routes
              GoRoute(
                path: 'analytics',
                name: 'analytics',
                builder: (context, state) => const AnalyticsScreen(),
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

          // Profile
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),

          // Settings
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
