import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/services/invoice_service.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';

class InvoiceScreen extends ConsumerStatefulWidget {
  final String orderId;

  const InvoiceScreen({super.key, required this.orderId});

  @override
  ConsumerState<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends ConsumerState<InvoiceScreen> {
  final _invoiceService = InvoiceService();
  InvoiceEntity? _invoice;
  File? _pdfFile;
  bool _isGenerating = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _generateInvoice();
  }

  Future<void> _generateInvoice() async {
    setState(() => _isGenerating = true);

    try {
      final ordersState = ref.read(ordersProvider);
      await ordersState.maybeWhen(
        loaded: (orders) async {
          final order = orders.firstWhere((o) => o.id == widget.orderId);
          final invoice = await _invoiceService.generateInvoice(order);
          final pdfFile = await _invoiceService.generatePDF(invoice);

          setState(() {
            _invoice = invoice;
            _pdfFile = pdfFile;
          });
        },
        orElse: () async {
          // If not loaded yet, load orders first
          await ref.read(ordersProvider.notifier).loadOrders();
          
          final updatedState = ref.read(ordersProvider);
          await updatedState.maybeWhen(
            loaded: (orders) async {
              final order = orders.firstWhere((o) => o.id == widget.orderId);
              final invoice = await _invoiceService.generateInvoice(order);
              final pdfFile = await _invoiceService.generatePDF(invoice);

              setState(() {
                _invoice = invoice;
                _pdfFile = pdfFile;
              });
            },
            orElse: () {
              throw Exception(
                'Unable to load order data. Please check your connection and try again.',
              );
            },
          );
        },
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate invoice: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isGenerating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Invoice Preview',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouterHelper(context).pop(),
        ),
        actions: [
          if (_invoice != null && !_isGenerating) ...[
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: _isProcessing ? null : _handleDownload,
              tooltip: 'Download Invoice',
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: _isProcessing ? null : _handleShare,
              tooltip: 'Share Invoice',
            ),
            IconButton(
              icon: const Icon(Icons.print),
              onPressed: _isProcessing ? null : _handlePrint,
              tooltip: 'Print Invoice',
            ),
          ],
        ],
      ),
      body: _buildBody(isDark),
      bottomNavigationBar: _buildBottomBar(isDark),
    );
  }

  Widget _buildBody(bool isDark) {
    if (_isGenerating) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
            ),
            const SizedBox(height: 16),
            Text(
              'Generating Invoice...',
              style: AppTypography.bodyMedium(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      );
    }

    if (_invoice == null || _pdfFile == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              'Failed to generate invoice',
              style: AppTypography.titleMedium(AppColors.error),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateInvoice,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Invoice Info Header
        _buildInvoiceHeader(_invoice!, isDark),

        // PDF Preview
        Expanded(
          child: Container(
            margin: ResponsivePadding.all(context),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: PdfPreview(
                build: (format) => _pdfFile!.readAsBytes(),
                allowPrinting: false,
                allowSharing: false,
                canChangePageFormat: false,
                canChangeOrientation: false,
                canDebug: false,
                pdfFileName: 'invoice_${_invoice!.invoiceNumber}.pdf',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceHeader(InvoiceEntity invoice, bool isDark) {
    return Container(
      margin: ResponsivePadding.horizontal(context).copyWith(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice Generated',
                      style: AppTypography.titleMedium(Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      invoice.invoiceNumber,
                      style: AppTypography.bodySmall(
                        Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  invoice.total.toCurrency(),
                  style: AppTypography.titleLarge(Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(
                Icons.person,
                invoice.customerName,
                Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 12),
              _buildInfoChip(
                Icons.calendar_today,
                _formatDate(invoice.generatedAt),
                Colors.white.withValues(alpha: 0.9),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(text, style: AppTypography.labelSmall(color)),
        ],
      ),
    );
  }

  Widget _buildBottomBar(bool isDark) {
    if (_invoice == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _isProcessing ? null : _handleConfirm,
            icon: _isProcessing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : const Icon(Icons.check_circle),
            label: Text(
              _isProcessing ? 'Processing...' : 'Confirm & Generate QR',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handlePrint() async {
    if (_invoice == null) return;

    setState(() => _isProcessing = true);
    try {
      await _invoiceService.printInvoice(_invoice!);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error printing: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _handleDownload() async {
    if (_invoice == null) return;

    setState(() => _isProcessing = true);
    try {
      await _invoiceService.downloadInvoice(_invoice!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invoice downloaded successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error downloading: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _handleShare() async {
    if (_invoice == null) return;

    setState(() => _isProcessing = true);
    try {
      await _invoiceService.shareInvoice(_invoice!);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sharing: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _handleConfirm() async {
    setState(() => _isProcessing = true);

    // Update order status to preparingInvoice
    await ref
        .read(ordersProvider.notifier)
        .updateOrderStatus(widget.orderId, OrderStatus.preparingInvoice);

    // Generate invoice URL (store in order)
    final invoiceUrl = _pdfFile!.path;

    // Generate QR code next
    final qrCode = await ref
        .read(ordersProvider.notifier)
        .generateQRCode(widget.orderId);

    setState(() => _isProcessing = false);

    if (qrCode != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invoice confirmed! QR code generated.'),
          backgroundColor: AppColors.success,
        ),
      );

      // Navigate to QR code screen
      context.go('/home/order/${widget.orderId}/qr-code');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
