import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../providers/auth_provider.dart';
import '../widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);

    // Listen to auth state changes
    ref.listen<AsyncValue>(authProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            context.go('/home');
          }
        },
        loading: () {},
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryLight,
                  AppColors.accentLight,
                  AppColors.primaryDark,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: ResponsiveContainer(
                  maxWidth: 480,
                  child: Padding(
                    padding: ResponsivePadding.all(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(context),
                        const SizedBox(height: 48),
                        _buildLoginCard(context),
                        const SizedBox(height: 24),
                        _buildMockCredentialsInfo(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.local_pharmacy_rounded,
            size: 50,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 24),
        Text('AltheaCare', style: AppTypography.displayMedium(Colors.white)),
        const SizedBox(height: 8),
        Text(
          'Pharmacy Partner',
          style: AppTypography.titleMedium(Colors.white.withValues(alpha: 0.9)),
        ),
      ],
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassLight,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Responsive.valueWhen(
            context: context,
            mobile: 24,
            tablet: 32,
            desktop: 40,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: AppTypography.headlineMedium(AppColors.textPrimaryLight),
            ),
            const SizedBox(height: 8),
            Text(
              'Sign in to continue to your dashboard',
              style: AppTypography.bodyMedium(AppColors.textSecondaryLight),
            ),
            const SizedBox(height: 32),
            const LoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildMockCredentialsInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            '🔐 Mock Credentials - Admin',
            style: AppTypography.labelLarge(Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: admin@pharmacy.com',
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.9)),
          ),
          Text(
            'Password: admin123',
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.9)),
          ),
          Divider(height: 24, color: Colors.white.withValues(alpha: 0.3)),
          Text(
            '🔐 Mock Credentials - Staff',
            style: AppTypography.labelLarge(Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: staff@pharmacy.com',
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.9)),
          ),
          Text(
            'Password: staff123',
            style: AppTypography.bodySmall(Colors.white.withValues(alpha: 0.9)),
          ),
        ],
      ),
    );
  }
}
