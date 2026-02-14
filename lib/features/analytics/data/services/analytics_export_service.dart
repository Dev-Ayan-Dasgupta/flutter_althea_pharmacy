import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../domain/entities/analytics_entity.dart';
import '../../../../core/utils/download_utils.dart';

class AnalyticsExportService {
  const AnalyticsExportService();

  /// Export analytics report as PDF
  Future<void> exportAsPdf(AnalyticsEntity analytics) async {
    final pdf = await _generatePDFDocument(analytics);
    final bytes = await pdf.save();
    final filename = _generateFilename('pdf', analytics);

    if (kIsWeb) {
      // Use web-specific download
      DownloadUtils.downloadFileWeb(bytes, filename);
    } else {
      // Use share/save functionality for mobile/desktop
      await Printing.sharePdf(bytes: bytes, filename: filename);
    }
  }

  /// Export analytics report as CSV (Excel-compatible)
  Future<void> exportAsCsv(AnalyticsEntity analytics) async {
    final csvContent = _generateCsvContent(analytics);
    final filename = _generateFilename('csv', analytics);

    if (kIsWeb) {
      // Use web-specific download
      DownloadUtils.downloadCsvWeb(csvContent, filename);
    } else {
      // For mobile/desktop, convert CSV to bytes with proper UTF-8 encoding
      // and use the printing package's share functionality (works for any file type)
      final bytes = Uint8List.fromList(utf8.encode(csvContent));
      await Printing.sharePdf(bytes: bytes, filename: filename);
    }
  }

  String _generateFilename(String extension, AnalyticsEntity analytics) {
    final formatter = DateFormat('yyyy-MM-dd');
    final startStr = formatter.format(analytics.startDate);
    final endStr = formatter.format(analytics.endDate);
    return 'analytics_report_${startStr}_to_$endStr.$extension';
  }

  Future<pw.Document> _generatePDFDocument(AnalyticsEntity analytics) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(analytics),
            pw.SizedBox(height: 24),
            _buildSummarySection(analytics),
            pw.SizedBox(height: 24),
            _buildRevenueDistribution(analytics),
            pw.SizedBox(height: 24),
            _buildDailyEarningsTable(analytics),
            pw.SizedBox(height: 24),
            _buildCategoryBreakdown(analytics),
            pw.SizedBox(height: 24),
            _buildFooter(),
          ];
        },
      ),
    );

    return pdf;
  }

  pw.Widget _buildHeader(AnalyticsEntity analytics) {
    final formatter = DateFormat('MMM dd, yyyy');
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'EARNINGS ANALYTICS REPORT',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  'Period: ${formatter.format(analytics.startDate)} - ${formatter.format(analytics.endDate)}',
                  style: const pw.TextStyle(fontSize: 12),
                ),
                pw.Text(
                  'Generated: ${DateFormat('MMM dd, yyyy HH:mm').format(DateTime.now())}',
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
            pw.Container(
              width: 80,
              height: 80,
              decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Center(
                child: pw.Text('📊', style: const pw.TextStyle(fontSize: 40)),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Divider(thickness: 2),
      ],
    );
  }

  pw.Widget _buildSummarySection(AnalyticsEntity analytics) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Summary Statistics',
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem(
                'Total Earnings',
                'INR ${analytics.totalEarnings.toStringAsFixed(2)}',
              ),
              _buildSummaryItem(
                'Your Share',
                'INR ${analytics.pharmacyShare.toStringAsFixed(2)}',
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem('Total Orders', '${analytics.totalOrders}'),
              _buildSummaryItem(
                'Avg Order Value',
                'INR ${analytics.averageOrderValue.toStringAsFixed(2)}',
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryItem(
                'Completed Orders',
                '${analytics.completedOrders}',
              ),
              _buildSummaryItem(
                'Cancelled Orders',
                '${analytics.cancelledOrders}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSummaryItem(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  pw.Widget _buildRevenueDistribution(AnalyticsEntity analytics) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(borderRadius: pw.BorderRadius.circular(8)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Revenue Distribution',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 12),
          _buildDistributionRow(
            'Your Earnings',
            analytics.pharmacyShare,
            analytics.totalEarnings,
          ),
          pw.SizedBox(height: 8),
          _buildDistributionRow(
            'Delivery Fee',
            analytics.deliveryFee,
            analytics.totalEarnings,
          ),
          pw.SizedBox(height: 8),
          _buildDistributionRow(
            'Platform Fee',
            analytics.platformFee,
            analytics.totalEarnings,
          ),
        ],
      ),
    );
  }

  pw.Widget _buildDistributionRow(String label, double amount, double total) {
    final percentage = total > 0
        ? (amount / total * 100).toStringAsFixed(1)
        : '0.0';
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: const pw.TextStyle(fontSize: 10)),
        pw.Text(
          'INR ${amount.toStringAsFixed(2)} ($percentage%)',
          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  pw.Widget _buildDailyEarningsTable(AnalyticsEntity analytics) {
    final formatter = DateFormat('MMM dd, yyyy');
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Daily Earnings',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Table(
          children: [
            // Header
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                _buildTableCell('Date', isHeader: true),
                _buildTableCell(
                  'Orders',
                  isHeader: true,
                  align: pw.TextAlign.center,
                ),
                _buildTableCell(
                  'Earnings',
                  isHeader: true,
                  align: pw.TextAlign.right,
                ),
              ],
            ),
            // Rows
            ...analytics.dailyEarnings.map((daily) {
              return pw.TableRow(
                children: [
                  _buildTableCell(formatter.format(daily.date)),
                  _buildTableCell(
                    '${daily.orderCount}',
                    align: pw.TextAlign.center,
                  ),
                  _buildTableCell(
                    'INR ${daily.amount.toStringAsFixed(2)}',
                    align: pw.TextAlign.right,
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildCategoryBreakdown(AnalyticsEntity analytics) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Revenue by Category',
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Table(
          children: [
            // Header
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                _buildTableCell('Category', isHeader: true),
                _buildTableCell(
                  'Amount',
                  isHeader: true,
                  align: pw.TextAlign.right,
                ),
                _buildTableCell(
                  'Percentage',
                  isHeader: true,
                  align: pw.TextAlign.right,
                ),
              ],
            ),
            // Rows
            ...analytics.categoryEarnings.map((category) {
              return pw.TableRow(
                children: [
                  _buildTableCell(category.category),
                  _buildTableCell(
                    'INR ${category.amount.toStringAsFixed(2)}',
                    align: pw.TextAlign.right,
                  ),
                  _buildTableCell(
                    '${category.percentage.toStringAsFixed(1)}%',
                    align: pw.TextAlign.right,
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildTableCell(
    String text, {
    bool isHeader = false,
    pw.TextAlign align = pw.TextAlign.left,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 10 : 9,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
        textAlign: align,
      ),
    );
  }

  pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(),
        pw.SizedBox(height: 8),
        pw.Text(
          'This is a system-generated report',
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
        ),
      ],
    );
  }

  String _generateCsvContent(AnalyticsEntity analytics) {
    final buffer = StringBuffer();
    final formatter = DateFormat('yyyy-MM-dd');

    // Header
    buffer.writeln('Analytics Report');
    buffer.writeln(
      'Period,${formatter.format(analytics.startDate)} to ${formatter.format(analytics.endDate)}',
    );
    buffer.writeln(
      'Generated,${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}',
    );
    buffer.writeln();

    // Summary Statistics
    buffer.writeln('SUMMARY STATISTICS');
    buffer.writeln('Metric,Value');
    buffer.writeln(
      'Total Earnings,INR ${analytics.totalEarnings.toStringAsFixed(2)}',
    );
    buffer.writeln(
      'Your Share,INR ${analytics.pharmacyShare.toStringAsFixed(2)}',
    );
    buffer.writeln(
      'Delivery Fee,INR ${analytics.deliveryFee.toStringAsFixed(2)}',
    );
    buffer.writeln(
      'Platform Fee,INR ${analytics.platformFee.toStringAsFixed(2)}',
    );
    buffer.writeln('Total Orders,${analytics.totalOrders}');
    buffer.writeln('Completed Orders,${analytics.completedOrders}');
    buffer.writeln('Cancelled Orders,${analytics.cancelledOrders}');
    buffer.writeln(
      'Average Order Value,INR ${analytics.averageOrderValue.toStringAsFixed(2)}',
    );
    buffer.writeln();

    // Daily Earnings
    buffer.writeln('DAILY EARNINGS');
    buffer.writeln('Date,Orders,Earnings');
    for (final daily in analytics.dailyEarnings) {
      buffer.writeln(
        '${formatter.format(daily.date)},${daily.orderCount},INR ${daily.amount.toStringAsFixed(2)}',
      );
    }
    buffer.writeln();

    // Category Breakdown
    buffer.writeln('REVENUE BY CATEGORY');
    buffer.writeln('Category,Amount,Percentage');
    for (final category in analytics.categoryEarnings) {
      buffer.writeln(
        '${category.category},INR ${category.amount.toStringAsFixed(2)},${category.percentage.toStringAsFixed(1)}%',
      );
    }

    return buffer.toString();
  }
}
