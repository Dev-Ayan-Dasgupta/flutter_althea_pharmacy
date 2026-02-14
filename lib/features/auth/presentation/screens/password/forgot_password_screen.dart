import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../providers/auth_provider.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isProcessing = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleForgotPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isProcessing = true);

    final result = await ref
        .read(authProvider.notifier)
        .forgotPassword(email: _emailController.text.trim());

    if (mounted) {
      setState(() => _isProcessing = false);

      if (result) {
        setState(() => _emailSent = true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send reset email. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: _emailSent
                ? _buildSuccessView(isDark)
                : _buildFormView(isDark),
          ),
        ),
      ),
    );
  }

  Widget _buildFormView(bool isDark) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Icon
          Icon(Icons.lock_reset, size: 80, color: AppColors.primaryDark),
          const SizedBox(height: 24),

          // Title
          Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: AppTypography.displaySmall(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Enter your email address and we\'ll send you instructions to reset your password.',
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium(
              isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 32),

          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email address',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: isDark
                  ? AppColors.surfaceDark
                  : AppColors.surfaceLight,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Submit Button
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _isProcessing ? null : _handleForgotPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isProcessing
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : Text(
                      'Send Reset Link',
                      style: AppTypography.titleSmall(Colors.white),
                    ),
            ),
          ),
          const SizedBox(height: 16),

          // Back to Login
          TextButton(
            onPressed: () => context.go('/login'),
            child: Text(
              'Back to Login',
              style: AppTypography.bodyMedium(AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Success Icon
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_circle, size: 80, color: Colors.green),
        ),
        const SizedBox(height: 24),

        // Title
        Text(
          'Check Your Email',
          textAlign: TextAlign.center,
          style: AppTypography.displaySmall(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),

        // Message
        Text(
          'We\'ve sent password reset instructions to:',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium(
            isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _emailController.text.trim(),
          textAlign: TextAlign.center,
          style: AppTypography.titleSmall(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 32),

        // Info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryDark.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.primaryDark.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What to do next:',
                style: AppTypography.titleSmall(AppColors.primaryDark),
              ),
              const SizedBox(height: 8),
              Text(
                '1. Check your email inbox\n'
                '2. Click the reset link in the email\n'
                '3. Create a new password\n\n'
                'Didn\'t receive the email? Check your spam folder or try again.',
                style: AppTypography.bodySmall(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Resend Button
        OutlinedButton(
          onPressed: _isProcessing
              ? null
              : () {
                  setState(() => _emailSent = false);
                },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            side: BorderSide(color: AppColors.primaryDark),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Resend Email',
            style: AppTypography.titleSmall(AppColors.primaryDark),
          ),
        ),
        const SizedBox(height: 12),

        // Back to Login
        TextButton(
          onPressed: () => context.go('/login'),
          child: Text(
            'Back to Login',
            style: AppTypography.bodyMedium(AppColors.primaryDark),
          ),
        ),
      ],
    );
  }
}
