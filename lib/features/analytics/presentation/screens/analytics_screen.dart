import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../orders/presentation/widgets/app_drawer.dart';
import '../../data/services/analytics_export_service.dart';
import '../../domain/entities/analytics_entity.dart';
import '../providers/analytics_provider.dart';
import '../providers/analytics_state.dart';
import '../widgets/export.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  DateRangeType _selectedRange = DateRangeType.last7Days;
  DateTime? _customStartDate;
  DateTime? _customEndDate;
  static const _exportService = AnalyticsExportService();

  @override
  Widget build(BuildContext context) {
    final analyticsState = ref.watch(analyticsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Earnings Analytics',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: 'Export Report',
            onPressed: () => _showExportDialog(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (_selectedRange == DateRangeType.custom &&
              _customStartDate != null &&
              _customEndDate != null) {
            await ref
                .read(analyticsProvider.notifier)
                .loadAnalytics(
                  startDate: _customStartDate!,
                  endDate: _customEndDate!,
                );
          } else {
            await ref
                .read(analyticsProvider.notifier)
                .loadByDateRange(_selectedRange);
          }
        },
        color: AppColors.primaryDark,
        child: analyticsState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
            ),
          ),
          loaded: (analytics) =>
              _buildAnalyticsContent(context, analytics, isDark),
          error: (message) => _buildErrorState(context, message),
        ),
      ),
    );
  }

  Widget _buildAnalyticsContent(
    BuildContext context,
    AnalyticsEntity analytics,
    bool isDark,
  ) {
    return ResponsiveContainer(
      child: SingleChildScrollView(
        padding: ResponsivePadding.all(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range Selector
            _buildDateRangeSelector(isDark),

            const SizedBox(height: 24),

            // Date Range Display
            _buildDateRangeDisplay(analytics, isDark),

            const SizedBox(height: 24),

            // Summary Stats Grid
            _buildSummaryStats(analytics, isDark),

            const SizedBox(height: 24),

            // Earnings Trend Chart
            Text(
              'Earnings Trend',
              style: AppTypography.titleLarge(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),

            const SizedBox(height: 16),

            EarningsChart(dailyEarnings: analytics.dailyEarnings),

            const SizedBox(height: 32),

            // Category Breakdown
            Text(
              'Revenue by Category',
              style: AppTypography.titleLarge(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),

            const SizedBox(height: 16),

            CategoryChart(categories: analytics.categoryEarnings),

            const SizedBox(height: 32),

            // Revenue Split Breakdown
            _buildRevenueSplit(analytics, isDark),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRangeSelector(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Text(
            'Select Period',
            style: AppTypography.titleSmall(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildRangeChip('Today', DateRangeType.today, isDark),
              _buildRangeChip('Yesterday', DateRangeType.yesterday, isDark),
              _buildRangeChip('Last 7 Days', DateRangeType.last7Days, isDark),
              _buildRangeChip('Last 30 Days', DateRangeType.last30Days, isDark),
              _buildRangeChip('This Month', DateRangeType.thisMonth, isDark),
              _buildRangeChip('Last Month', DateRangeType.lastMonth, isDark),
              _buildRangeChip('Custom', DateRangeType.custom, isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRangeChip(String label, DateRangeType range, bool isDark) {
    final isSelected = _selectedRange == range;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) async {
        setState(() => _selectedRange = range);

        if (range == DateRangeType.custom) {
          await _showCustomDatePicker(context);
        } else {
          await ref.read(analyticsProvider.notifier).loadByDateRange(range);
        }
      },
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      selectedColor: AppColors.primaryDark,
      checkmarkColor: Colors.white,
      labelStyle: AppTypography.labelMedium(
        isSelected
            ? Colors.white
            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
      ),
      side: BorderSide(
        color: isSelected
            ? AppColors.primaryDark
            : (isDark ? AppColors.borderDark : AppColors.borderLight),
      ),
    );
  }

  Widget _buildDateRangeDisplay(AnalyticsEntity analytics, bool isDark) {
    final formatter = DateFormat('MMM dd, yyyy');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradientSubtle,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryDark.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            color: AppColors.primaryDark,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${formatter.format(analytics.startDate)} - ${formatter.format(analytics.endDate)}',
              style: AppTypography.bodyMedium(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${analytics.dailyEarnings.length} days',
              style: AppTypography.labelSmall(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStats(AnalyticsEntity analytics, bool isDark) {
    return Responsive(
      mobile: Column(
        children: [
          StatsCard(
            title: 'Total Earnings',
            value: '₹${analytics.totalEarnings.toStringAsFixed(2)}',
            icon: Icons.account_balance_wallet,
            gradient: AppColors.primaryGradient,
          ),
          const SizedBox(height: 12),
          StatsCard(
            title: 'Your Share',
            value: '₹${analytics.pharmacyShare.toStringAsFixed(2)}',
            subtitle: '82% of total',
            icon: Icons.trending_up,
            gradient: AppColors.successGradient,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Orders',
                  value: '${analytics.totalOrders}',
                  icon: Icons.shopping_bag,
                  gradient: AppColors.accentGradient,
                  isCompact: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatsCard(
                  title: 'Avg Order',
                  value: '₹${analytics.averageOrderValue.toStringAsFixed(0)}',
                  icon: Icons.analytics,
                  gradient: AppColors.warningGradient,
                  isCompact: true,
                ),
              ),
            ],
          ),
        ],
      ),
      tablet: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width - 80) / 2,
            child: StatsCard(
              title: 'Total Earnings',
              value: '₹${analytics.totalEarnings.toStringAsFixed(2)}',
              icon: Icons.account_balance_wallet,
              gradient: AppColors.primaryGradient,
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 80) / 2,
            child: StatsCard(
              title: 'Your Share',
              value: '₹${analytics.pharmacyShare.toStringAsFixed(2)}',
              subtitle: '82% of total',
              icon: Icons.trending_up,
              gradient: AppColors.successGradient,
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 80) / 2,
            child: StatsCard(
              title: 'Total Orders',
              value: '${analytics.totalOrders}',
              icon: Icons.shopping_bag,
              gradient: AppColors.accentGradient,
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 80) / 2,
            child: StatsCard(
              title: 'Avg Order Value',
              value: '₹${analytics.averageOrderValue.toStringAsFixed(0)}',
              icon: Icons.analytics,
              gradient: AppColors.warningGradient,
            ),
          ),
        ],
      ),
      desktop: Row(
        children: [
          Expanded(
            child: StatsCard(
              title: 'Total Earnings',
              value: '₹${analytics.totalEarnings.toStringAsFixed(2)}',
              icon: Icons.account_balance_wallet,
              gradient: AppColors.primaryGradient,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StatsCard(
              title: 'Your Share',
              value: '₹${analytics.pharmacyShare.toStringAsFixed(2)}',
              subtitle: '82% of total',
              icon: Icons.trending_up,
              gradient: AppColors.successGradient,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StatsCard(
              title: 'Total Orders',
              value: '${analytics.totalOrders}',
              icon: Icons.shopping_bag,
              gradient: AppColors.accentGradient,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: StatsCard(
              title: 'Avg Order Value',
              value: '₹${analytics.averageOrderValue.toStringAsFixed(0)}',
              icon: Icons.analytics,
              gradient: AppColors.warningGradient,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueSplit(AnalyticsEntity analytics, bool isDark) {
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
          Text(
            'Revenue Distribution',
            style: AppTypography.titleMedium(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 20),
          _buildSplitRow(
            'Your Earnings',
            analytics.pharmacyShare,
            analytics.totalEarnings,
            AppColors.success,
            isDark,
          ),
          const SizedBox(height: 12),
          _buildSplitRow(
            'Delivery Fee',
            analytics.deliveryFee,
            analytics.totalEarnings,
            AppColors.info,
            isDark,
          ),
          const SizedBox(height: 12),
          _buildSplitRow(
            'Platform Fee',
            analytics.platformFee,
            analytics.totalEarnings,
            AppColors.warning,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildSplitRow(
    String label,
    double amount,
    double total,
    Color color,
    bool isDark,
  ) {
    final percentage = total > 0 
        ? (amount / total * 100).toStringAsFixed(1) 
        : '0.0';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.bodyMedium(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            Text(
              '₹${amount.toStringAsFixed(2)} ($percentage%)',
              style: AppTypography.labelMedium(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: total > 0 ? amount / total : 0,
            backgroundColor: color.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
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
            'Error loading analytics',
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
            onPressed: () => ref
                .read(analyticsProvider.notifier)
                .loadByDateRange(_selectedRange),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _showCustomDatePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _customStartDate != null && _customEndDate != null
          ? DateTimeRange(start: _customStartDate!, end: _customEndDate!)
          : null,
    );

    if (picked != null) {
      setState(() {
        _customStartDate = picked.start;
        _customEndDate = picked.end;
      });

      await ref
          .read(analyticsProvider.notifier)
          .loadAnalytics(startDate: picked.start, endDate: picked.end);
    }
  }

  void _showExportDialog(BuildContext context) {
    final analyticsState = ref.read(analyticsProvider);
    
    // Only show dialog if analytics data is loaded
    analyticsState.maybeWhen(
      loaded: (analytics) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Export Report'),
            content: const Text('Choose export format:'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Generating PDF report...')),
                  );
                  
                  try {
                    await _exportService.exportAsPdf(analytics);
                    
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('PDF report downloaded successfully!'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error exporting PDF: $e'),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    }
                  }
                },
                child: const Text('PDF'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Generating Excel report...')),
                  );
                  
                  try {
                    await _exportService.exportAsCsv(analytics);
                    
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Excel report downloaded successfully!'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error exporting Excel: $e'),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Excel'),
              ),
            ],
          ),
        );
      },
      orElse: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please wait for analytics data to load'),
            backgroundColor: AppColors.warning,
          ),
        );
      },
    );
  }
}
