import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/auth_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Queue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: authState.maybeWhen(
          authenticated: (user) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, ${user.name}!',
                style: AppTypography.headlineMedium(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.pharmacyName,
                style: AppTypography.titleMedium(
                  Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 32),
              const Text('🚀 Orders Queue Coming Next!'),
            ],
          ),
          orElse: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
