import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'About',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ),
      body: ResponsiveContainer(
        maxWidth: 600,
        child: SingleChildScrollView(
          padding: ResponsivePadding.all(context),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // App Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: AppColors.softShadowLight,
                ),
                child: const Icon(
                  Icons.local_pharmacy,
                  size: 60,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // App Name
              Text(
                'AltheaCare Pharmacy',
                style: AppTypography.headlineMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),

              const SizedBox(height: 8),

              // Version
              Text(
                _packageInfo != null
                    ? 'Version ${_packageInfo!.version} (Build ${_packageInfo!.buildNumber})'
                    : 'Version 1.0.0 (Build 100)',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),

              const SizedBox(height: 32),

              // Description
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppColors.cardGradientDark
                      : AppColors.cardGradientLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'AltheaCare Pharmacy Partner App is your complete solution for managing '
                  'online medicine orders, inventory, and payments. Join thousands of '
                  'pharmacies delivering healthcare to millions of customers across India.',
                  style: AppTypography.bodyMedium(
                    isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // Contact Info
              _buildInfoCard(context, 'Company Information', [
                _InfoItem(Icons.business, 'AltheaCare Health Services Pvt Ltd'),
                _InfoItem(Icons.location_on, 'Kolkata, West Bengal, India'),
                _InfoItem(Icons.email, 'support@altheacare.com'),
                _InfoItem(Icons.phone, '+91 1800-123-4567'),
              ], isDark),

              const SizedBox(height: 16),

              // Social Links
              _buildInfoCard(context, 'Connect With Us', [
                _InfoItem(Icons.language, 'altheacare.in', isLink: true),
                _InfoItem(
                  Icons.facebook,
                  'facebook.com/altheacare',
                  isLink: true,
                ),
                _InfoItem(
                  Icons.camera_alt,
                  'instagram.com/altheacare_ai/',
                  isLink: true,
                ),
                _InfoItem(Icons.info, 'x.com/althea_care', isLink: true),
              ], isDark),

              const SizedBox(height: 24),

              // Credits
              Text(
                'Made with ❤️ in Kolkata',
                style: AppTypography.bodySmall(
                  isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),

              Text(
                '© 2026 Ayanmit Careworks Private Limited. All rights reserved.',
                style: AppTypography.caption(
                  isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    List<_InfoItem> items,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleMedium(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: item.isLink ? () => _launchURL(item.text) : null,
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.text,
                        style: AppTypography.bodyMedium(
                          item.isLink
                              ? AppColors.primaryDark
                              : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                        ),
                      ),
                    ),
                    if (item.isLink)
                      const Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: AppColors.primaryDark,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open $url'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening link: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}

class _InfoItem {
  final IconData icon;
  final String text;
  final bool isLink;

  _InfoItem(this.icon, this.text, {this.isLink = false});
}
