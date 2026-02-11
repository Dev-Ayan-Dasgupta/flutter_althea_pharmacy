import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';

class ManualQRInputScreen extends ConsumerStatefulWidget {
  const ManualQRInputScreen({super.key});

  @override
  ConsumerState<ManualQRInputScreen> createState() =>
      _ManualQRInputScreenState();
}

class _ManualQRInputScreenState extends ConsumerState<ManualQRInputScreen> {
  final _qrController = TextEditingController();
  bool _isProcessing = false;

  @override
  void dispose() {
    _qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Enter QR Code',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ResponsiveContainer(
        child: Center(
          child: SingleChildScrollView(
            padding: ResponsivePadding.all(context),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppColors.cardGradientDark
                    : AppColors.cardGradientLight,
                borderRadius: BorderRadius.circular(24),
                boxShadow: isDark
                    ? AppColors.softShadowDark
                    : AppColors.softShadowLight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.qr_code_2,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Manual QR Code Entry',
                    style: AppTypography.headlineSmall(
                      isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Enter the QR code value shown on the order ready screen',
                    style: AppTypography.bodyMedium(
                      isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Input Field
                  TextField(
                    controller: _qrController,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: AppTypography.titleMedium(
                      isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter QR Code',
                      hintStyle: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                      filled: true,
                      fillColor: isDark
                          ? AppColors.surfaceDark
                          : AppColors.surfaceLight,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primaryDark,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.qr_code,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                      suffixIcon: _qrController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _qrController.clear();
                                });
                              },
                            )
                          : null,
                    ),
                    onChanged: (value) => setState(() {}),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _handleSubmit();
                      }
                    },
                  ),

                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: _qrController.text.isEmpty || _isProcessing
                          ? null
                          : _handleSubmit,
                      icon: _isProcessing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Icon(Icons.check_circle),
                      label: Text(
                        _isProcessing
                            ? 'Verifying...'
                            : 'Verify & Confirm Pickup',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Info Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.info.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.info,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'QR codes are case-sensitive. Make sure to enter exactly as shown.',
                            style: AppTypography.bodySmall(AppColors.info),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    setState(() => _isProcessing = true);

    final qrCode = _qrController.text.trim();

    try {
      // Find order with matching QR code
      final ordersState = ref.read(ordersProvider);
      OrderEntity? matchedOrder;

      ordersState.maybeWhen(
        loaded: (orders) {
          try {
            matchedOrder = orders.firstWhere((order) => order.qrCode == qrCode);
          } catch (e) {
            matchedOrder = null;
          }
        },
        orElse: () {},
      );

      if (matchedOrder == null) {
        _showErrorDialog(
          'Invalid QR Code',
          'This QR code is not associated with any order.',
        );
        return;
      }

      if (matchedOrder!.status != OrderStatus.readyForPickup) {
        _showErrorDialog(
          'Order Not Ready',
          'This order is not ready for pickup yet. Current status: ${matchedOrder!.statusDisplayText}',
        );
        return;
      }

      // Confirm pickup
      final success = await ref
          .read(ordersProvider.notifier)
          .confirmPickup(matchedOrder!.id, qrCode);

      if (success && mounted) {
        _showSuccessDialog(matchedOrder!);
      } else {
        _showErrorDialog(
          'Pickup Failed',
          'Failed to confirm order pickup. Please try again.',
        );
      }
    } catch (e) {
      _showErrorDialog('Error', 'An error occurred: $e');
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  void _showSuccessDialog(OrderEntity order) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 64,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Pickup Confirmed! ✅',
              style: AppTypography.titleLarge(AppColors.success),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryDark.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInfoRow('Order', order.orderId),
                  const SizedBox(height: 8),
                  _buildInfoRow('Customer', order.customerName),
                  const SizedBox(height: 8),
                  _buildInfoRow('Items', '${order.items.length} medicines'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Order is now marked as picked up',
              style: AppTypography.bodySmall(
                Theme.of(context).textTheme.bodySmall!.color!,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/home');
            },
            child: const Text('Back to Orders'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/home/order/${order.id}/track');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
            ),
            child: const Text('Track Delivery'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.error),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall(
            Theme.of(context).textTheme.bodySmall!.color!,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium(
            Theme.of(context).textTheme.bodyMedium!.color!,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
