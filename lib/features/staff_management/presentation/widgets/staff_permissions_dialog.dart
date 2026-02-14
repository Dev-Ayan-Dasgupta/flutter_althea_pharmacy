import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../auth/domain/entities/role_entity.dart';
import '../../domain/entities/staff_entity.dart';
import '../providers/staff_provider.dart';

class StaffPermissionsDialog extends ConsumerStatefulWidget {
  final StaffEntity staff;

  const StaffPermissionsDialog({
    super.key,
    required this.staff,
  });

  @override
  ConsumerState<StaffPermissionsDialog> createState() =>
      _StaffPermissionsDialogState();
}

class _StaffPermissionsDialogState
    extends ConsumerState<StaffPermissionsDialog> {
  late Set<Permission> _selectedPermissions;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _selectedPermissions = Set.from(widget.staff.role.permissions);
  }

  Future<void> _handleUpdatePermissions() async {
    setState(() => _isProcessing = true);

    // Create custom role with selected permissions
    final customRole = RoleEntity(
      role: _selectedPermissions.length >= RoleEntity.admin.permissions.length
          ? UserRole.admin
          : UserRole.staff,
      permissions: _selectedPermissions.toList(),
      description: 'Custom permissions',
    );

    final success =
        await ref.read(staffManagementProvider.notifier).updateStaffPermissions(
              id: widget.staff.id,
              pharmacyId: widget.staff.pharmacyId,
              role: customRole,
            );

    if (mounted) {
      setState(() => _isProcessing = false);

      if (success) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permissions updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update permissions'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        constraints: const BoxConstraints(maxHeight: 700),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.security,
                  color: AppColors.primaryDark,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage Permissions',
                        style: AppTypography.titleLarge(
                          isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                      Text(
                        widget.staff.name,
                        style: AppTypography.bodySmall(
                          isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick Actions
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedPermissions = Set.from(Permission.values);
                    });
                  },
                  icon: const Icon(Icons.select_all),
                  label: const Text('Select All'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedPermissions.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear All'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Permissions List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPermissionSection(
                      'Orders',
                      Icons.shopping_cart,
                      [
                        Permission.viewOrders,
                        Permission.acceptOrders,
                        Permission.rejectOrders,
                        Permission.cancelOrders,
                      ],
                      isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildPermissionSection(
                      'Inventory',
                      Icons.inventory_2,
                      [
                        Permission.viewInventory,
                        Permission.addInventory,
                        Permission.editInventory,
                        Permission.deleteInventory,
                        Permission.adjustStock,
                      ],
                      isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildPermissionSection(
                      'Wallet',
                      Icons.account_balance_wallet,
                      [
                        Permission.viewWallet,
                        Permission.withdrawFunds,
                        Permission.viewTransactions,
                      ],
                      isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildPermissionSection(
                      'Profile',
                      Icons.person,
                      [
                        Permission.viewProfile,
                        Permission.editProfile,
                        Permission.editBankDetails,
                      ],
                      isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildPermissionSection(
                      'Settings',
                      Icons.settings,
                      [
                        Permission.viewSettings,
                        Permission.editSettings,
                        Permission.manageUsers,
                      ],
                      isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildPermissionSection(
                      'Notifications',
                      Icons.notifications,
                      [
                        Permission.viewNotifications,
                        Permission.deleteNotifications,
                      ],
                      isDark,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _isProcessing ? null : () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _isProcessing ? null : _handleUpdatePermissions,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: _isProcessing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : const Text('Update Permissions'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionSection(
    String title,
    IconData icon,
    List<Permission> permissions,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.primaryDark),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTypography.titleSmall(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...permissions.map((permission) {
            return CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                _formatPermissionName(permission),
                style: AppTypography.bodyMedium(
                  isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              value: _selectedPermissions.contains(permission),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedPermissions.add(permission);
                  } else {
                    _selectedPermissions.remove(permission);
                  }
                });
              },
            );
          }),
        ],
      ),
    );
  }

  String _formatPermissionName(Permission permission) {
    final name = permission.toString().split('.').last;
    // Convert camelCase to Title Case with spaces
    return name.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    ).trim();
  }
}
