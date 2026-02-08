import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../../domain/entities/inventory_entity.dart';
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
  bool _isSearchVisible = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inventoryState = ref.watch(inventoryProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Responsive.isMobile(context) ? const AppDrawer() : null,
      appBar: AppBar(
        title: _isSearchVisible
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
                decoration: InputDecoration(
                  hintText: 'Search medicines...',
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
              )
            : Text(
                'Inventory Management',
                style: AppTypography.titleLarge(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearchVisible ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
                if (!_isSearchVisible) {
                  _searchQuery = '';
                  _searchController.clear();
                }
              });
            },
          ),
          if (!_isSearchVisible)
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildMobileList(searchedItems);
              } else if (constraints.maxWidth < 1200) {
                return _buildGridLayout(searchedItems, 2);
              } else {
                return _buildGridLayout(searchedItems, 3);
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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return InventoryItemCard(
          item: items[index],
          onStockAdjusted: (id, newStock) {
            ref.read(inventoryProvider.notifier).adjustStock(id, newStock);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Stock adjusted to $newStock units'),
                backgroundColor: AppColors.success,
              ),
            );
          },
          onDeleted: (id) {
            ref.read(inventoryProvider.notifier).deleteItem(id);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Medicine deleted successfully'),
                backgroundColor: AppColors.success,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGridLayout(List items, int crossAxisCount) {
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
        children: items.map((item) {
          return SizedBox(
            width: itemWidth,
            child: InventoryItemCard(
              item: item,
              onStockAdjusted: (id, newStock) {
                ref.read(inventoryProvider.notifier).adjustStock(id, newStock);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Stock adjusted to $newStock units'),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              onDeleted: (id) {
                ref.read(inventoryProvider.notifier).deleteItem(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Medicine deleted successfully'),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showAddStockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddInventoryDialog(
        // item: null for add, pass item for edit
      ),
    ).then((result) {
      if (result != null && result is InventoryItemEntity) {
        ref.read(inventoryProvider.notifier).addOrUpdateItem(result);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Medicine added successfully!'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      }
    });
  }
}
