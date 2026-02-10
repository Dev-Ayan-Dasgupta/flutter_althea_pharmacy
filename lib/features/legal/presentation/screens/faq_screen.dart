import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String _searchQuery = '';
  Set<int> _expandedIndices = {};

  final List<FAQItem> _faqs = [
    FAQItem(
      category: 'Getting Started',
      question: 'How do I register my pharmacy on AltheaCare?',
      answer:
          'Contact our onboarding team at partner@altheacare.com with your '
          'pharmacy license, GSTIN, and bank details. Our team will verify documents '
          'and create your account within 24-48 hours.',
    ),
    FAQItem(
      category: 'Getting Started',
      question: 'What documents are required for registration?',
      answer:
          'Required documents:\n'
          '• Valid Drug License\n'
          '• GSTIN Certificate\n'
          '• PAN Card\n'
          '• Bank Account Details\n'
          '• Pharmacist Registration Certificate\n'
          '• Address Proof',
    ),
    FAQItem(
      category: 'Orders',
      question: 'How do I accept or reject an order?',
      answer:
          'When a new order arrives, you\'ll receive a notification. '
          'Tap the notification to view order details. Check medicine availability '
          'and tap "Accept" or "Reject". For partial availability, you can mark '
          'specific medicines as unavailable and suggest alternatives.',
    ),
    FAQItem(
      category: 'Orders',
      question: 'What should I do if a medicine is out of stock?',
      answer:
          'If a medicine is unavailable:\n'
          '1. Mark it as unavailable in the order\n'
          '2. Suggest an alternative substitute (if available)\n'
          '3. Contact customer via in-app chat or call\n'
          '4. Customer can accept substitute, partial order, or cancel',
    ),
    FAQItem(
      category: 'Orders',
      question: 'How long do I have to respond to an order?',
      answer:
          'You have 5 minutes to accept or reject an order. If no action is taken, '
          'the order is automatically forwarded to other nearby pharmacies.',
    ),
    FAQItem(
      category: 'Inventory',
      question: 'How do I add new medicines to inventory?',
      answer:
          'Go to Inventory → Tap the + icon → Fill in medicine details including '
          'name, dosage, price, batch number, and expiry date → Save. You can also '
          'scan barcodes for faster entry.',
    ),
    FAQItem(
      category: 'Inventory',
      question: 'How do I manage expiring medicines?',
      answer:
          'The app automatically tracks expiry dates. You\'ll receive alerts '
          '60 days before expiry. Filter by "Expiring Soon" to view affected medicines. '
          'Consider running promotions or returning to supplier.',
    ),
    FAQItem(
      category: 'Inventory',
      question: 'What is the low stock alert system?',
      answer:
          'Set minimum stock levels for each medicine. When stock falls below this '
          'threshold, you\'ll receive notifications. For chronic medications, the system '
          'uses predictive algorithms to suggest restocking.',
    ),
    FAQItem(
      category: 'Payments',
      question: 'How is the payment split calculated?',
      answer:
          'Payment split:\n'
          '• Pharmacy: ~82% of order value\n'
          '• Delivery Partner: ~8%\n'
          '• AltheaCare Platform Fee: ~10%\n\n'
          'Your exact share is shown in each transaction details.',
    ),
    FAQItem(
      category: 'Payments',
      question: 'When will I receive my payments?',
      answer:
          'Payments are settled within 24 hours of successful delivery confirmation. '
          'Funds are first added to your "Pending Balance" and moved to "Available Balance" '
          'after delivery confirmation.',
    ),
    FAQItem(
      category: 'Payments',
      question: 'What is the minimum withdrawal amount?',
      answer:
          'The minimum withdrawal amount is ₹100. Withdrawals are processed '
          'via bank transfer within 24 hours of request.',
    ),
    FAQItem(
      category: 'Delivery',
      question: 'How does the delivery handover work?',
      answer:
          'After packing the order:\n'
          '1. Mark order as "Packed"\n'
          '2. Wait for delivery partner assignment\n'
          '3. Generate QR code from order screen\n'
          '4. Delivery partner scans QR to confirm pickup\n'
          '5. Track delivery progress in real-time',
    ),
    FAQItem(
      category: 'Delivery',
      question: 'What if the delivery partner doesn\'t arrive?',
      answer:
          'If delivery partner is delayed beyond 15 minutes, contact our support. '
          'We\'ll reassign the order to another available partner.',
    ),
    FAQItem(
      category: 'Technical',
      question: 'Why am I not receiving order notifications?',
      answer:
          'Check:\n'
          '• Notification permissions are enabled\n'
          '• Internet connection is stable\n'
          '• App is updated to latest version\n'
          '• Battery optimization is disabled for AltheaCare\n\n'
          'Still facing issues? Contact support.',
    ),
    FAQItem(
      category: 'Technical',
      question: 'How do I update my pharmacy details?',
      answer:
          'Go to Profile → Edit Details → Update required information → Save. '
          'Changes to bank details or license require verification and may take 24-48 hours.',
    ),
    FAQItem(
      category: 'Support',
      question: 'How do I contact customer support?',
      answer:
          'Multiple ways to reach us:\n'
          '• In-app: Settings → Help & Support\n'
          '• Email: support@altheacare.com\n'
          '• Phone: +91 1800-123-4567 (24/7)\n'
          '• WhatsApp: +91 98765-43210',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredFAQs = _searchQuery.isEmpty
        ? _faqs
        : _faqs
              .where(
                (faq) =>
                    faq.question.toLowerCase().contains(
                      _searchQuery.toLowerCase(),
                    ) ||
                    faq.answer.toLowerCase().contains(
                      _searchQuery.toLowerCase(),
                    ) ||
                    faq.category.toLowerCase().contains(
                      _searchQuery.toLowerCase(),
                    ),
              )
              .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Help & FAQ',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ),
      body: ResponsiveContainer(
        maxWidth: 800,
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: ResponsivePadding.all(context),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search questions...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => setState(() => _searchQuery = ''),
                        )
                      : null,
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),

            // FAQ List
            Expanded(
              child: filteredFAQs.isEmpty
                  ? _buildEmptyState(isDark)
                  : ListView.separated(
                      padding: ResponsivePadding.horizontal(context),
                      itemCount: filteredFAQs.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _buildFAQCard(
                          context,
                          filteredFAQs[index],
                          index,
                          isDark,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQCard(
    BuildContext context,
    FAQItem faq,
    int index,
    bool isDark,
  ) {
    final isExpanded = _expandedIndices.contains(index);

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.cardGradientDark
            : AppColors.cardGradientLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() {
              if (isExpanded) {
                _expandedIndices.remove(index);
              } else {
                _expandedIndices.add(index);
              }
            }),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      faq.category,
                      style: AppTypography.labelSmall(AppColors.primaryDark),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      faq.question,
                      style: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          faq.answer,
                          style: AppTypography.bodyMedium(
                            isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color:
                (isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight)
                    .withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: AppTypography.titleMedium(
              isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String category;
  final String question;
  final String answer;

  FAQItem({
    required this.category,
    required this.question,
    required this.answer,
  });
}
