import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/permission_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../providers/profile_provider.dart';
import '../providers/profile_state.dart';
import '../widgets/edit_profile_dialog.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(profileProvider.notifier).loadProfile(),
        color: AppColors.primaryDark,
        child: profileState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
            ),
          ),
          loaded: (profile) =>
              _buildProfileContent(context, ref, profile, isDark),
          error: (message) => _buildErrorState(context, ref, message),
        ),
      ),
      floatingActionButton: profileState.maybeWhen(
        loaded: (profile) => Consumer(
          builder: (context, ref, child) {
            final canEdit = ref.watch(
              hasPermissionProvider(Permission.editProfile),
            );

            if (!canEdit) return const SizedBox.shrink();

            return FloatingActionButton.extended(
              onPressed: () => _showEditDialog(context, ref, profile),
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              backgroundColor: AppColors.primaryDark,
            );
          },
        ),
        orElse: () => null,
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    ProfileEntity profile,
    bool isDark,
  ) {
    return ResponsiveContainer(
      maxWidth: 800,
      child: SingleChildScrollView(
        padding: ResponsivePadding.all(context),
        child: Column(
          children: [
            // Header Card
            _buildHeaderCard(context, profile, isDark),

            const SizedBox(height: 24),

            // Pharmacy Details
            _buildSectionCard(context, 'Pharmacy Details', Icons.store, [
              _InfoRow('Pharmacy Name', profile.pharmacyName),
              _InfoRow('Owner Name', profile.ownerName),
              _InfoRow('Email', profile.email),
              _InfoRow('Phone', profile.phone),
              if (profile.alternatePhone != null)
                _InfoRow('Alternate Phone', profile.alternatePhone!),
              if (profile.establishedDate != null)
                _InfoRow(
                  'Established',
                  '${profile.establishedDate!.day}/${profile.establishedDate!.month}/${profile.establishedDate!.year}',
                ),
            ], isDark),

            const SizedBox(height: 16),

            // Address
            _buildSectionCard(context, 'Address', Icons.location_on, [
              _InfoRow('Street', profile.address),
              _InfoRow('City', profile.city),
              _InfoRow('State', profile.state),
              _InfoRow('PIN Code', profile.pincode),
            ], isDark),

            const SizedBox(height: 16),

            // License Information
            _buildSectionCard(context, 'License Information', Icons.badge, [
              _InfoRow('Drug License Number', profile.licenseNumber),
              _InfoRow(
                'License Expiry',
                '${profile.licenseExpiry.day}/${profile.licenseExpiry.month}/${profile.licenseExpiry.year}',
              ),
              _InfoRow('GSTIN', profile.gstin),
              _InfoRow('Pharmacist Name', profile.pharmacistName),
              _InfoRow('Pharmacist Reg. No.', profile.pharmacistRegNumber),
            ], isDark),

            const SizedBox(height: 16),

            // Bank Details
            if (profile.bankName != null)
              _buildSectionCard(
                context,
                'Bank Details',
                Icons.account_balance,
                [
                  _InfoRow('Bank Name', profile.bankName!),
                  if (profile.accountNumber != null)
                    _InfoRow(
                      'Account Number',
                      _maskAccountNumber(profile.accountNumber!),
                    ),
                  if (profile.ifscCode != null)
                    _InfoRow('IFSC Code', profile.ifscCode!),
                  if (profile.upiId != null) _InfoRow('UPI ID', profile.upiId!),
                ],
                isDark,
              ),

            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(
    BuildContext context,
    ProfileEntity profile,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppColors.softShadowLight,
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.store, size: 50, color: Colors.white),
          ),

          const SizedBox(height: 16),

          Text(
            profile.pharmacyName,
            style: AppTypography.headlineSmall(Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          if (profile.isVerified == true)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.verified, color: Colors.white, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Verified Partner',
                    style: AppTypography.labelSmall(Colors.white),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    IconData icon,
    List<_InfoRow> rows,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...rows.map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      row.label,
                      style: AppTypography.bodySmall(
                        isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      row.value,
                      style: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading profile',
            style: AppTypography.titleMedium(AppColors.error),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTypography.bodyMedium(
              Theme.of(context).textTheme.bodyMedium!.color!,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ref.read(profileProvider.notifier).loadProfile(),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  String _maskAccountNumber(String accountNumber) {
    if (accountNumber.length <= 4) return accountNumber;
    final lastFour = accountNumber.substring(accountNumber.length - 4);
    return 'XXXX XXXX $lastFour';
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    ProfileEntity profile,
  ) {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(profile: profile),
    ).then((updatedProfile) {
      if (updatedProfile != null && updatedProfile is ProfileEntity) {
        ref.read(profileProvider.notifier).updateProfile(updatedProfile);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      }
    });
  }
}

class _InfoRow {
  final String label;
  final String value;

  _InfoRow(this.label, this.value);
}
