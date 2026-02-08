import 'package:flutter/material.dart';
import 'package:flutter_altheacare_pharmacy/features/wallet/domain/entities/transaction_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../providers/wallet_provider.dart';
import '../providers/wallet_state.dart';
import '../widgets/export.dart';

enum TransactionFilter { all, orders, withdrawals }

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  TransactionFilter _currentFilter = TransactionFilter.all;

  @override
  Widget build(BuildContext context) {
    final walletState = ref.watch(walletProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Responsive.isMobile(context) ? const AppDrawer() : null,
      appBar: AppBar(
        title: Text(
          'Wallet & Earnings',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Transaction History',
            onPressed: () {
              // Already showing transactions
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(walletProvider.notifier).loadWallet(),
        color: AppColors.primaryDark,
        child: walletState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
            ),
          ),
          loaded: (wallet, transactions) => ResponsiveContainer(
            child: SingleChildScrollView(
              child: Responsive(
                mobile: _buildMobileLayout(
                  context,
                  wallet,
                  transactions,
                  isDark,
                ),
                tablet: _buildTabletLayout(
                  context,
                  wallet,
                  transactions,
                  isDark,
                ),
                desktop: _buildDesktopLayout(
                  context,
                  wallet,
                  transactions,
                  isDark,
                ),
              ),
            ),
          ),
          error: (message) => Center(
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
                  'Error loading wallet',
                  style: AppTypography.titleMedium(
                    Theme.of(context).colorScheme.error,
                  ),
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
                  onPressed: () =>
                      ref.read(walletProvider.notifier).loadWallet(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    dynamic wallet,
    List<TransactionEntity> transactions,
    bool isDark,
  ) {
    return Padding(
      padding: ResponsivePadding.all(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Balance Card
          WalletBalanceCard(wallet: wallet),

          const SizedBox(height: 16),

          // Quick Actions
          QuickActionsCard(
            wallet: wallet,
            onWithdraw: () => _showWithdrawDialog(context, wallet),
          ),

          const SizedBox(height: 16),

          // Earnings Breakdown
          EarningsBreakdownCard(wallet: wallet),

          const SizedBox(height: 24),

          // Transactions Section Header
          Text(
            'Transaction History',
            style: AppTypography.titleLarge(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 12),

          // Filter Chips
          _buildFilterChips(isDark),

          const SizedBox(height: 16),

          // Transactions List
          TransactionList(transactions: _filterTransactions(transactions)),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    dynamic wallet,
    List<TransactionEntity> transactions,
    bool isDark,
  ) {
    return Padding(
      padding: ResponsivePadding.all(context),
      child: Column(
        children: [
          // Top Row: Balance + Quick Actions
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: WalletBalanceCard(wallet: wallet)),
              const SizedBox(width: 16),
              Expanded(
                child: QuickActionsCard(
                  wallet: wallet,
                  onWithdraw: () => _showWithdrawDialog(context, wallet),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Earnings Breakdown
          EarningsBreakdownCard(wallet: wallet),

          const SizedBox(height: 24),

          // Transactions Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Transaction History',
              style: AppTypography.titleLarge(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),

          const SizedBox(height: 12),

          _buildFilterChips(isDark),

          const SizedBox(height: 16),

          TransactionList(transactions: _filterTransactions(transactions)),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    dynamic wallet,
    List<TransactionEntity> transactions,
    bool isDark,
  ) {
    return Padding(
      padding: ResponsivePadding.all(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column: Balance, Actions, Breakdown
          Expanded(
            flex: 4,
            child: Column(
              children: [
                WalletBalanceCard(wallet: wallet),
                const SizedBox(height: 16),
                QuickActionsCard(
                  wallet: wallet,
                  onWithdraw: () => _showWithdrawDialog(context, wallet),
                ),
                const SizedBox(height: 16),
                EarningsBreakdownCard(wallet: wallet),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right Column: Transactions
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction History',
                  style: AppTypography.titleLarge(
                    isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 12),
                _buildFilterChips(isDark),
                const SizedBox(height: 16),
                TransactionList(
                  transactions: _filterTransactions(transactions),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip('All Transactions', TransactionFilter.all, isDark),
          const SizedBox(width: 8),
          _buildFilterChip('Orders', TransactionFilter.orders, isDark),
          const SizedBox(width: 8),
          _buildFilterChip(
            'Withdrawals',
            TransactionFilter.withdrawals,
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, TransactionFilter filter, bool isDark) {
    final isSelected = _currentFilter == filter;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => _currentFilter = filter),
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

  List<TransactionEntity> _filterTransactions(
    List<TransactionEntity> transactions,
  ) {
    switch (_currentFilter) {
      case TransactionFilter.orders:
        return ref.read(walletProvider.notifier).getOrderTransactions();
      case TransactionFilter.withdrawals:
        return ref.read(walletProvider.notifier).getWithdrawals();
      case TransactionFilter.all:
        return transactions;
    }
  }

  void _showWithdrawDialog(BuildContext context, dynamic wallet) {
    showDialog(
      context: context,
      builder: (context) => WithdrawDialog(
        availableBalance: wallet.availableBalance,
        onWithdraw: (amount) async {
          await ref.read(walletProvider.notifier).withdrawFunds(amount);
          if (context.mounted) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Withdrawal request submitted successfully!'),
                backgroundColor: AppColors.success,
              ),
            );
          }
        },
      ),
    );
  }
}
