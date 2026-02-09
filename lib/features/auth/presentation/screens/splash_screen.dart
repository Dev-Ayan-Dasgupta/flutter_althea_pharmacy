import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    // Add a safety timeout
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && !_hasNavigated) {
        // Force navigation to login if stuck
        _hasNavigated = true;
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen to auth async value changes
    ref.listen<AsyncValue>(authProvider, (previous, next) {
      if (_hasNavigated || !mounted) return;

      next.when(
        data: (user) {
          _hasNavigated = true;
          if (user != null) {
            context.go('/home');
          } else {
            context.go('/login');
          }
        },
        loading: () {
          // Stay on splash
        },
        error: (error, stack) {
          _hasNavigated = true;
          // Navigate to login on error
          context.go('/login');
        },
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_pharmacy,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

              // App Name
              Text(
                'AltheaCare',
                style: AppTypography.headlineLarge(
                  Colors.white,
                ).copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),

              const SizedBox(height: 8),

              Text(
                'Pharmacy Management',
                style: AppTypography.bodyLarge(
                  Colors.white.withValues(alpha: .9),
                ),
              ),

              const SizedBox(height: 48),

              // Loading Indicator
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),

              const SizedBox(height: 16),

              Text(
                'Loading...',
                style: AppTypography.bodyMedium(
                  Colors.white.withValues(alpha: .8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
