import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/orders/presentation/screens/home_screen.dart';
import '../../features/orders/presentation/screens/order_detail_screen.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';

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

          // Wallet (placeholder)
          GoRoute(
            path: 'wallet',
            name: 'wallet',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('Wallet Dashboard - Coming Soon')),
            ),
          ),
        ],
      ),
    ],
  );
}
