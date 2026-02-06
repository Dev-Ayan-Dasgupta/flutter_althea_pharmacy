import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../providers/inventory_provider.dart';
import '../providers/inventory_state.dart';
import '../widgets/export.dart';

enum InventoryFilter { all, lowStock, expiringSoon, chronic }

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  InventoryFilter _currentFilter = InventoryFilter.all;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final inventoryState = ref.watch(inventoryProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Inventory Management',
          style: AppTypography.titleLarge(
            isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddStockDialog(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(inventoryProvider.notifier).loadInventory(),
        color: AppColors.primaryDark,
        child: ResponsiveContainer(
          child: Column(
            children: [
              // Stats Cards
              inventoryState.maybeWhen(
                loaded: (items) => InventoryStatsCards(items: items),
                orElse: () => const SizedBox.shrink(),
              ),

              const SizedBox(height: 16),

              // Filter Chips
              InventoryFilterChips(
                currentFilter: _currentFilter,
                onFilterChanged: (filter) {
                  setState(() => _currentFilter = filter);
                },
              ),

              const SizedBox(height: 16),

              // Items List
              Expanded(
                child: _buildInventoryList(context, inventoryState, isDark),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInventoryList(
    BuildContext context,
    InventoryState inventoryState,
    bool isDark,
  ) {
    return inventoryState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
        ),
      ),
      loaded: (items) {
        // Filter items based on selected filter
        final filteredItems = _filterItems(items);

        // Apply search query
        final searchedItems = _searchQuery.isEmpty
            ? filteredItems
            : filteredItems
                  .where(
                    (item) =>
                        item.medicineName.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ) ||
                        (item.brandName?.toLowerCase().contains(
                              _searchQuery.toLowerCase(),
                            ) ??
                            false) ||
                        (item.genericName?.toLowerCase().contains(
                              _searchQuery.toLowerCase(),
                            ) ??
                            false),
                  )
                  .toList();

        if (searchedItems.isEmpty) {
          return EmptyInventoryState(filter: _currentFilter);
        }

        return Padding(
          padding: ResponsivePadding.horizontal(context),
          child: Responsive(
            mobile: _buildMobileList(searchedItems),
            tablet: _buildGridLayout(searchedItems, 2),
            desktop: _buildGridLayout(searchedItems, 3),
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
              'Error loading inventory',
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
                  ref.read(inventoryProvider.notifier).loadInventory(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> _filterItems(List items) {
    switch (_currentFilter) {
      case InventoryFilter.lowStock:
        return ref.read(inventoryProvider.notifier).getLowStockItems();
      case InventoryFilter.expiringSoon:
        return ref.read(inventoryProvider.notifier).getExpiringSoonItems();
      case InventoryFilter.chronic:
        return ref.read(inventoryProvider.notifier).getChronicMedications();
      case InventoryFilter.all:
        return items;
    }
  }

  Widget _buildMobileList(List items) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return InventoryItemCard(item: items[index]);
      },
    );
  }

  Widget _buildGridLayout(List items, int crossAxisCount) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InventoryItemCard(item: items[index]);
      },
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Search Medicines',
          style: AppTypography.titleLarge(
            Theme.of(context).textTheme.titleLarge!.color!,
          ),
        ),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter medicine name...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            setState(() => _searchQuery = value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => _searchQuery = '');
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showAddStockDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add Stock feature coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
