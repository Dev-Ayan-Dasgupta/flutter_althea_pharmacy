import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/auth_state.dart';
import '../providers/orders_provider.dart';
import '../providers/orders_state.dart';
import '../widgets/export.dart';

enum OrdersFilter { all, active, completed }

class OrdersQueueScreen extends ConsumerStatefulWidget {
  const OrdersQueueScreen({super.key});

  @override
  ConsumerState<OrdersQueueScreen> createState() => _OrdersQueueScreenState();
}

class _OrdersQueueScreenState extends ConsumerState<OrdersQueueScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  OrdersFilter _currentFilter = OrdersFilter.all;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        _currentFilter = OrdersFilter.values[_tabController.index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(ordersProvider);
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ResponsiveContainer(
          child: Column(
            children: [
              // Header with user info
              OrdersHeader(
                userName: authState.maybeWhen(
                  authenticated: (user) => user.name,
                  orElse: () => 'Pharmacist',
                ),
                pharmacyName: authState.maybeWhen(
                  authenticated: (user) => user.pharmacyName,
                  orElse: () => 'Pharmacy',
                ),
                onLogout: () => ref.read(authProvider.notifier).logout(),
              ),

              // Tab Bar
              _buildTabBar(context),

              // Orders List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      ref.read(ordersProvider.notifier).loadOrders(),
                  color: AppColors.primaryDark,
                  child: _buildOrdersList(context, ordersState),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: ResponsivePadding.horizontal(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: AppTypography.labelLarge(Colors.white),
        unselectedLabelStyle: AppTypography.labelLarge(
          isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
        tabs: const [
          Tab(text: 'All Orders'),
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
        ],
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, OrdersState ordersState) {
    return ordersState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
        ),
      ),
      loaded: (orders) {
        // Filter orders based on selected tab
        final filteredOrders = _filterOrders(orders);

        if (filteredOrders.isEmpty) {
          return EmptyOrdersState(filter: _currentFilter);
        }

        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: Responsive.valueWhen(
              context: context,
              mobile: 16,
              tablet: 24,
              desktop: 32,
            ),
            right: Responsive.valueWhen(
              context: context,
              mobile: 16,
              tablet: 24,
              desktop: 32,
            ),
          ),
          child: Responsive(
            mobile: _buildMobileList(filteredOrders),
            tablet: _buildGridLayout(filteredOrders, 2),
            desktop: _buildGridLayout(filteredOrders, 3),
          ),
        );
      },
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
              'Error loading orders',
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
              onPressed: () => ref.read(ordersProvider.notifier).loadOrders(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> _filterOrders(List orders) {
    switch (_currentFilter) {
      case OrdersFilter.active:
        return ref.read(ordersProvider.notifier).getActiveOrders();
      case OrdersFilter.completed:
        return ref.read(ordersProvider.notifier).getCompletedOrders();
      case OrdersFilter.all:
        return orders;
    }
  }

  Widget _buildMobileList(List orders) {
    return ListView.separated(
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }

  Widget _buildGridLayout(List orders, int crossAxisCount) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}
