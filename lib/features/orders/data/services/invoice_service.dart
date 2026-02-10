import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../../../core/utils/download_utils.dart';

class InvoiceService {
  Future<InvoiceEntity> generateInvoice(OrderEntity order) async {
    final now = DateTime.now();
    final invoiceNumber =
        'INV${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';

    // Calculate totals
    final subtotal = order.items.fold<double>(
      0,
      (sum, item) => sum + (item.substitutePrice ?? item.price) * item.quantity,
    );
    final cgst = subtotal * 0.06; // 6% CGST
    final sgst = subtotal * 0.06; // 6% SGST
    final deliveryFee = 50.0;
    final total = subtotal + cgst + sgst + deliveryFee;

    // Convert order items to invoice items
    final invoiceItems = order.items.map((item) {
      return InvoiceItemEntity(
        name: item.substituteName ?? item.medicineName,
        quantity: item.quantity,
        unitPrice: item.substitutePrice ?? item.price,
        total: (item.substitutePrice ?? item.price) * item.quantity,
        isSubstitute: item.availability == ItemAvailability.substituted,
      );
    }).toList();

    return InvoiceEntity(
      invoiceNumber: invoiceNumber,
      orderId: order.orderId,
      generatedAt: now,
      customerName: order.customerName,
      customerPhone: order.customerPhone,
      deliveryAddress: order.deliveryAddress,
      pharmacyName: 'HealthPlus Pharmacy',
      pharmacyAddress: '123 Medical Street, Kolkata - 700001',
      pharmacyPhone: '+91 98765 00000',
      pharmacyGSTIN: '19AABCU9603R1ZX',
      pharmacyLicense: 'WB/KOL/DL/2024/12345',
      items: invoiceItems,
      subtotal: subtotal,
      cgst: cgst,
      sgst: sgst,
      deliveryFee: deliveryFee,
      total: total,
      notes: order.notes,
    );
  }

  Future<File> generatePDF(InvoiceEntity invoice) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(invoice),
            pw.SizedBox(height: 20),
            _buildPharmacyInfo(invoice),
            pw.SizedBox(height: 20),
            _buildCustomerInfo(invoice),
            pw.SizedBox(height: 20),
            _buildItemsTable(invoice),
            pw.SizedBox(height: 20),
            _buildTotals(invoice),
            pw.SizedBox(height: 30),
            _buildFooter(invoice),
          ];
        },
      ),
    );

    // Save to temporary directory
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/invoice_${invoice.invoiceNumber}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  pw.Widget _buildHeader(InvoiceEntity invoice) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'TAX INVOICE',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              'Invoice #: ${invoice.invoiceNumber}',
              style: const pw.TextStyle(fontSize: 12),
            ),
            pw.Text(
              'Order #: ${invoice.orderId}',
              style: const pw.TextStyle(fontSize: 12),
            ),
            pw.Text(
              'Date: ${_formatDate(invoice.generatedAt)}',
              style: const pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
        pw.Container(
          width: 100,
          height: 100,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Center(
            child: pw.Text('🏥', style: const pw.TextStyle(fontSize: 48)),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPharmacyInfo(InvoiceEntity invoice) {
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
            invoice.pharmacyName,
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            invoice.pharmacyAddress,
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            'Phone: ${invoice.pharmacyPhone}',
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            'GSTIN: ${invoice.pharmacyGSTIN}',
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            'Drug License: ${invoice.pharmacyLicense}',
            style: const pw.TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildCustomerInfo(InvoiceEntity invoice) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Bill To:',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            invoice.customerName,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            'Phone: ${invoice.customerPhone}',
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            'Address: ${invoice.deliveryAddress}',
            style: const pw.TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildItemsTable(InvoiceEntity invoice) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300),
      children: [
        // Header
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            _buildTableCell('Item', isHeader: true),
            _buildTableCell('Qty', isHeader: true, align: pw.TextAlign.center),
            _buildTableCell(
              'Unit Price',
              isHeader: true,
              align: pw.TextAlign.right,
            ),
            _buildTableCell('Total', isHeader: true, align: pw.TextAlign.right),
          ],
        ),
        // Items
        ...invoice.items.map((item) {
          return pw.TableRow(
            children: [
              _buildTableCell(
                '${item.name}${item.isSubstitute == true ? ' (Substitute)' : ''}',
              ),
              _buildTableCell('${item.quantity}', align: pw.TextAlign.center),
              _buildTableCell(
                '₹${item.unitPrice.toStringAsFixed(2)}',
                align: pw.TextAlign.right,
              ),
              _buildTableCell(
                '₹${item.total.toStringAsFixed(2)}',
                align: pw.TextAlign.right,
              ),
            ],
          );
        }),
      ],
    );
  }

  pw.Widget _buildTotals(InvoiceEntity invoice) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Container(
          width: 250,
          child: pw.Column(
            children: [
              _buildTotalRow('Subtotal:', invoice.subtotal),
              _buildTotalRow('CGST (6%):', invoice.cgst),
              _buildTotalRow('SGST (6%):', invoice.sgst),
              _buildTotalRow('Delivery Fee:', invoice.deliveryFee),
              pw.Divider(thickness: 2),
              _buildTotalRow('Total Amount:', invoice.total, isTotal: true),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildTotalRow(
    String label,
    double amount, {
    bool isTotal = false,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: isTotal ? 14 : 12,
              fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
          pw.Text(
            '₹${amount.toStringAsFixed(2)}',
            style: pw.TextStyle(
              fontSize: isTotal ? 14 : 12,
              fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildFooter(InvoiceEntity invoice) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (invoice.notes != null) ...[
          pw.Text(
            'Notes:',
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(invoice.notes!, style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 16),
        ],
        pw.Divider(),
        pw.SizedBox(height: 8),
        pw.Text(
          'Terms & Conditions:',
          style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          '1. All medicines are sold as per prescription.',
          style: const pw.TextStyle(fontSize: 8),
        ),
        pw.Text(
          '2. No exchange or return of medicines.',
          style: const pw.TextStyle(fontSize: 8),
        ),
        pw.Text(
          '3. Keep medicines away from children.',
          style: const pw.TextStyle(fontSize: 8),
        ),
        pw.SizedBox(height: 16),
        pw.Center(
          child: pw.Text(
            'Thank you for your business!',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
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
          fontSize: isHeader ? 11 : 10,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
        textAlign: align,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> printInvoice(InvoiceEntity invoice) async {
    final pdf = await _generatePDFDocument(invoice);
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }

  Future<void> shareInvoice(InvoiceEntity invoice) async {
    final pdf = await _generatePDFDocument(invoice);
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'invoice_${invoice.invoiceNumber}.pdf',
    );
  }

  /// Download invoice PDF - works on all platforms including web
  Future<void> downloadInvoice(InvoiceEntity invoice) async {
    final pdf = await _generatePDFDocument(invoice);
    final bytes = await pdf.save();
    final filename = 'invoice_${invoice.invoiceNumber}.pdf';

    if (kIsWeb) {
      // Use web-specific download
      DownloadUtils.downloadFileWeb(bytes, filename);
    } else {
      // Use share/save functionality for mobile/desktop
      await Printing.sharePdf(bytes: bytes, filename: filename);
    }
  }

  Future<pw.Document> _generatePDFDocument(InvoiceEntity invoice) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(invoice),
            pw.SizedBox(height: 20),
            _buildPharmacyInfo(invoice),
            pw.SizedBox(height: 20),
            _buildCustomerInfo(invoice),
            pw.SizedBox(height: 20),
            _buildItemsTable(invoice),
            pw.SizedBox(height: 20),
            _buildTotals(invoice),
            pw.SizedBox(height: 30),
            _buildFooter(invoice),
          ];
        },
      ),
    );

    return pdf;
  }
}
