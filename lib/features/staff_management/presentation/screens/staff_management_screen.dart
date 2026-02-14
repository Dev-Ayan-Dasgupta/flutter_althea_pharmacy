import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/permission_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/responsive.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../orders/presentation/widgets/export.dart';
import '../../domain/entities/staff_entity.dart';
import '../providers/staff_provider.dart';
import '../providers/staff_state.dart';
import '../widgets/add_staff_dialog.dart';
import '../widgets/edit_staff_dialog.dart';
import '../widgets/staff_permissions_dialog.dart';

class StaffManagementScreen extends ConsumerStatefulWidget {
  const StaffManagementScreen({super.key});

  @override
  ConsumerState<StaffManagementScreen> createState() =>
      _StaffManagementScreenState();
}

class _StaffManagementScreenState extends ConsumerState<StaffManagementScreen> {
  String _searchQuery = '';
  bool _isSearchVisible = false;
  bool _showInactiveStaff = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load staff when screen is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadStaff();
    });
  }

  void _loadStaff() {
    final user = ref.read(authProvider).value;
    if (user != null) {
      ref.read(staffManagementProvider.notifier).loadStaff(user.pharmacyId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final staffState = ref.watch(staffManagementProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasManageUsersPermission =
        ref.watch(hasPermissionProvider(Permission.manageUsers));

    // Check if user has permission to manage users
    if (!hasManageUsersPermission) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text(
            'Staff Management',
            style: AppTypography.titleLarge(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 64,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              const SizedBox(height: 16),
              Text(
                'Access Denied',
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You do not have permission to manage staff',
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
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
                  hintText: 'Search staff...',
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
                'Staff Management',
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
              onPressed: () => _showAddStaffDialog(context),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadStaff(),
        color: AppColors.primaryDark,
        child: ResponsiveContainer(
          maxWidth: 1200,
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Filter toggle
              Padding(
                padding: ResponsivePadding.horizontal(context),
                child: Row(
                  children: [
                    Text(
                      'Show inactive staff',
                      style: AppTypography.bodyMedium(
                        isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _showInactiveStaff,
                      onChanged: (value) {
                        setState(() => _showInactiveStaff = value);
                      },
                      activeColor: AppColors.primaryDark,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Staff List
              Expanded(
                child: staffState.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
                    ),
                  ),
                  loaded: (staffList) =>
                      _buildStaffList(context, staffList, isDark),
                  error: (message) => _buildErrorState(context, message, isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaffList(
    BuildContext context,
    List<StaffEntity> staffList,
    bool isDark,
  ) {
    // Filter staff based on search query and active status
    final filteredStaff = staffList.where((staff) {
      final matchesSearch = staff.name
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          staff.email.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesActiveFilter = _showInactiveStaff || staff.isActive;

      return matchesSearch && matchesActiveFilter;
    }).toList();

    if (filteredStaff.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isNotEmpty ? 'No staff found' : 'No staff members',
              style: AppTypography.titleMedium(
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isNotEmpty
                  ? 'Try a different search query'
                  : 'Add your first staff member',
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

    return ListView.builder(
      padding: ResponsivePadding.all(context),
      itemCount: filteredStaff.length,
      itemBuilder: (context, index) {
        final staff = filteredStaff[index];
        return _buildStaffCard(context, staff, isDark);
      },
    );
  }

  Widget _buildStaffCard(
    BuildContext context,
    StaffEntity staff,
    bool isDark,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: staff.isActive
              ? AppColors.primaryDark.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          backgroundImage:
              staff.photoUrl != null ? NetworkImage(staff.photoUrl!) : null,
          child: staff.photoUrl == null
              ? Text(
                  staff.name.substring(0, 1).toUpperCase(),
                  style: AppTypography.titleMedium(
                    staff.isActive
                        ? AppColors.primaryDark
                        : AppColors.textSecondaryDark,
                  ),
                )
              : null,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                staff.name,
                style: AppTypography.titleMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: staff.role.role == UserRole.admin
                    ? AppColors.primaryDark.withOpacity(0.2)
                    : AppColors.accentDark.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                staff.role.displayName,
                style: AppTypography.caption(
                  staff.role.role == UserRole.admin
                      ? AppColors.primaryDark
                      : AppColors.accentDark,
                ),
              ),
            ),
            if (!staff.isActive) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Inactive',
                  style: AppTypography.caption(Colors.grey),
                ),
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              staff.email,
              style: AppTypography.bodySmall(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            if (staff.phoneNumber != null) ...[
              const SizedBox(height: 2),
              Text(
                staff.phoneNumber!,
                style: AppTypography.bodySmall(
                  isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
            const SizedBox(height: 4),
            Text(
              staff.lastLoginAt != null
                  ? 'Last login: ${_formatDate(staff.lastLoginAt!)}'
                  : 'Never logged in',
              style: AppTypography.caption(
                isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleMenuAction(context, value, staff),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'permissions',
              child: Row(
                children: [
                  Icon(Icons.security, size: 20),
                  SizedBox(width: 8),
                  Text('Permissions'),
                ],
              ),
            ),
            if (staff.isActive)
              const PopupMenuItem(
                value: 'deactivate',
                child: Row(
                  children: [
                    Icon(Icons.block, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Deactivate', style: TextStyle(color: Colors.red)),
                  ],
                ),
              )
            else
              const PopupMenuItem(
                value: 'reactivate',
                child: Row(
                  children: [
                    Icon(Icons.check_circle, size: 20, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Reactivate', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action, StaffEntity staff) {
    switch (action) {
      case 'edit':
        _showEditStaffDialog(context, staff);
        break;
      case 'permissions':
        _showPermissionsDialog(context, staff);
        break;
      case 'deactivate':
        _confirmDeactivateStaff(context, staff);
        break;
      case 'reactivate':
        _reactivateStaff(staff);
        break;
    }
  }

  void _showAddStaffDialog(BuildContext context) {
    final user = ref.read(authProvider).value;
    if (user == null) return;

    showDialog(
      context: context,
      builder: (context) => AddStaffDialog(
        pharmacyId: user.pharmacyId,
      ),
    );
  }

  void _showEditStaffDialog(BuildContext context, StaffEntity staff) {
    showDialog(
      context: context,
      builder: (context) => EditStaffDialog(staff: staff),
    );
  }

  void _showPermissionsDialog(BuildContext context, StaffEntity staff) {
    showDialog(
      context: context,
      builder: (context) => StaffPermissionsDialog(staff: staff),
    );
  }

  void _confirmDeactivateStaff(BuildContext context, StaffEntity staff) {
    final user = ref.read(authProvider).value;
    if (user == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deactivate Staff Member'),
        content: Text(
          'Are you sure you want to deactivate ${staff.name}? They will no longer be able to access the system.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await ref
                  .read(staffManagementProvider.notifier)
                  .deleteStaff(staff.id, user.pharmacyId);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Staff member deactivated'
                          : 'Failed to deactivate staff member',
                    ),
                    backgroundColor: success ? Colors.green : Colors.red,
                  ),
                );
              }
            },
            child: const Text(
              'Deactivate',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _reactivateStaff(StaffEntity staff) async {
    final user = ref.read(authProvider).value;
    if (user == null) return;

    final success = await ref
        .read(staffManagementProvider.notifier)
        .reactivateStaff(staff.id, user.pharmacyId);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Staff member reactivated'
                : 'Failed to reactivate staff member',
          ),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
    }
  }

  Widget _buildErrorState(BuildContext context, String message, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color:
                isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
          const SizedBox(height: 16),
          Text(
            'Error',
            style: AppTypography.titleMedium(
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium(
              isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadStaff,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
