import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/export.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/new_order_notifier.dart';
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

  bool _isSearchVisible = false;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
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
    final authAsync = ref.watch(authProvider);
    final newOrder = ref.watch(newOrderProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Responsive.isMobile(context) ? const AppDrawer() : null,
      body: Stack(
        children: [
          // Existing content
          SafeArea(
            child: ResponsiveContainer(
              child: Column(
                children: [
                  // Header with user info
                  OrdersHeader(
                    userName: authAsync.maybeWhen(
                      data: (user) => user?.name ?? 'Pharmacist',
                      orElse: () => 'Pharmacist',
                    ),
                    pharmacyName: authAsync.maybeWhen(
                      data: (user) => user?.pharmacyName ?? 'Pharmacy',
                      orElse: () => 'Pharmacy',
                    ),
                    onLogout: () => ref.read(authProvider.notifier).logout(),
                    onSearchPressed: () {
                      setState(() {
                        _isSearchVisible = !_isSearchVisible;
                        if (!_isSearchVisible) {
                          _searchQuery = '';
                          _searchController.clear();
                        }
                      });
                    },
                  ),

                  // Main content area with search, tabs, and orders list
                  Expanded(
                    child: Column(
                      children: [
                        // Search bar (conditional)
                        if (_isSearchVisible)
                          Container(
                            padding: ResponsivePadding.horizontal(context),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.surfaceDark
                                    : AppColors.surfaceLight,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isDark
                                      ? AppColors.borderDark
                                      : AppColors.borderLight,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: isDark
                                        ? AppColors.textSecondaryDark
                                        : AppColors.textSecondaryLight,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: TextField(
                                      controller: _searchController,
                                      autofocus: true,
                                      style: AppTypography.bodyMedium(
                                        isDark
                                            ? AppColors.textPrimaryDark
                                            : AppColors.textPrimaryLight,
                                      ),
                                      decoration: InputDecoration(
                                        hintText:
                                            'Search orders by customer, order #...',
                                        border: InputBorder.none,
                                        hintStyle: AppTypography.bodyMedium(
                                          isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textSecondaryLight,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() => _searchQuery = value);
                                      },
                                    ),
                                  ),
                                  if (_searchQuery.isNotEmpty)
                                    IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          _searchQuery = '';
                                          _searchController.clear();
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
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
                ],
              ),
            ),
          ),

          // New Order Banner Overlay
          if (newOrder != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: NewOrderBanner(
                  order: newOrder,
                  onDismiss: () {
                    ref.read(newOrderProvider.notifier).dismissNewOrder();
                  },
                  onAccept: () {
                    ref.read(newOrderProvider.notifier).dismissNewOrder();
                    // Navigate to item checker
                    context.go('/home/order/${newOrder.id}/check-items');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order accepted! Review items now.'),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  },
                  onReject: () {
                    ref.read(newOrderProvider.notifier).dismissNewOrder();
                    _showRejectDialog(context, newOrder);
                  },
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/home/scan-qr');
        },
        icon: Icon(
          PlatformUtils.canScanQR ? Icons.qr_code_scanner : Icons.keyboard,
        ),
        label: Text(PlatformUtils.canScanQR ? 'Scan QR' : 'Enter QR'),
        backgroundColor: AppColors.accentDark,
      ),
    );
  }

  // Add this method at the end of the class
  void _showRejectDialog(BuildContext context, OrderEntity order) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reject Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please provide a reason for rejection:'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Reason',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.isNotEmpty) {
                Navigator.pop(context);
                ref
                    .read(ordersProvider.notifier)
                    .rejectOrder(order.id, reasonController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Order rejected'),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Reject'),
          ),
        ],
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

        // Apply search query
        final searchedOrders = _searchQuery.isEmpty
            ? filteredOrders
            : filteredOrders.where((order) {
                final query = _searchQuery.toLowerCase();
                return order.orderId.toLowerCase().contains(query) ||
                    order.customerName.toLowerCase().contains(query) ||
                    order.customerPhone.contains(query) ||
                    order.deliveryAddress.toLowerCase().contains(query);
              }).toList();

        if (searchedOrders.isEmpty) {
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Determine layout based on available width
              if (constraints.maxWidth < 600) {
                // Mobile: List view
                return _buildMobileList(searchedOrders);
              } else if (constraints.maxWidth < 1200) {
                // Tablet: 2 columns
                return _buildGridLayout(searchedOrders, 2);
              } else {
                // Desktop: 3 columns
                return _buildGridLayout(searchedOrders, 3);
              }
            },
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
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = Responsive.valueWhen(
      context: context,
      mobile: 16,
      tablet: 24,
      desktop: 32,
    );
    final availableWidth = screenWidth - (horizontalPadding * 2);
    final itemWidth =
        (availableWidth - (16 * (crossAxisCount - 1))) / crossAxisCount;

    return SingleChildScrollView(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: orders.map((order) {
          return SizedBox(
            width: itemWidth,
            child: OrderCard(order: order),
          );
        }).toList(),
      ),
    );
  }
}
