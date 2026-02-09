import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/orders_provider.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_state.dart';

class QRScannerScreen extends ConsumerStatefulWidget {
  const QRScannerScreen({super.key});

  @override
  ConsumerState<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends ConsumerState<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isProcessing = false;
  bool _flashOn = false;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // QR Scanner View
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppColors.primaryDark,
              borderRadius: 16,
              borderLength: 40,
              borderWidth: 8,
              cutOutSize: 300,
            ),
          ),

          // Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    Expanded(
                      child: Text(
                        'Scan Order QR Code',
                        style: AppTypography.titleLarge(Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _flashOn ? Icons.flash_on : Icons.flash_off,
                        color: Colors.white,
                      ),
                      onPressed: _toggleFlash,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Instructions
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Align QR code within frame',
                            style: AppTypography.bodyMedium(Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hold your device steady',
                      style: AppTypography.bodySmall(
                        Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Processing Overlay
          if (_isProcessing)
            Container(
              color: Colors.black.withValues(alpha: 0.7),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Verifying QR Code...',
                        style: AppTypography.bodyMedium(AppColors.primaryDark),
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!_isProcessing && scanData.code != null) {
        _handleScannedCode(scanData.code!);
      }
    });
  }

  Future<void> _handleScannedCode(String qrCode) async {
    setState(() => _isProcessing = true);

    // Pause camera
    await controller?.pauseCamera();

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
        // Invalid QR code
        _showErrorDialog(
          'Invalid QR Code',
          'This QR code is not associated with any order.',
        );
        return;
      }

      if (matchedOrder!.status != OrderStatus.readyForPickup) {
        // Wrong status
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
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Destination',
                    '${order.distance.toStringAsFixed(1)} km away',
                  ),
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
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              controller?.resumeCamera();
            },
            child: const Text('Scan Again'),
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

  void _toggleFlash() {
    controller?.toggleFlash();
    setState(() => _flashOn = !_flashOn);
  }
}
