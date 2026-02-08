import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_entity.freezed.dart';

enum UserRole { admin, staff }

enum Permission {
  // Order Permissions
  viewOrders,
  acceptOrders,
  rejectOrders,
  cancelOrders,

  // Inventory Permissions
  viewInventory,
  addInventory,
  editInventory,
  deleteInventory,
  adjustStock,

  // Wallet Permissions
  viewWallet,
  withdrawFunds,
  viewTransactions,

  // Profile Permissions
  viewProfile,
  editProfile,
  editBankDetails,

  // Settings Permissions
  viewSettings,
  editSettings,
  manageUsers,

  // Notification Permissions
  viewNotifications,
  deleteNotifications,
}

@freezed
abstract class RoleEntity with _$RoleEntity {
  const RoleEntity._();

  const factory RoleEntity({
    required UserRole role,
    required List<Permission> permissions,
    String? description,
  }) = _RoleEntity;

  // Predefined roles with permissions
  static const RoleEntity admin = RoleEntity(
    role: UserRole.admin,
    permissions: [
      // Has all permissions
      Permission.viewOrders,
      Permission.acceptOrders,
      Permission.rejectOrders,
      Permission.cancelOrders,
      Permission.viewInventory,
      Permission.addInventory,
      Permission.editInventory,
      Permission.deleteInventory,
      Permission.adjustStock,
      Permission.viewWallet,
      Permission.withdrawFunds,
      Permission.viewTransactions,
      Permission.viewProfile,
      Permission.editProfile,
      Permission.editBankDetails,
      Permission.viewSettings,
      Permission.editSettings,
      Permission.manageUsers,
      Permission.viewNotifications,
      Permission.deleteNotifications,
    ],
    description: 'Full access to all features',
  );

  static const RoleEntity staff = RoleEntity(
    role: UserRole.staff,
    permissions: [
      // Limited permissions
      Permission.viewOrders,
      Permission.acceptOrders,
      Permission.rejectOrders,
      Permission.viewInventory,
      Permission.addInventory,
      Permission.editInventory,
      Permission.adjustStock,
      Permission.viewWallet,
      Permission.viewTransactions,
      Permission.viewProfile,
      Permission.viewSettings,
      Permission.viewNotifications,
    ],
    description:
        'Limited access - cannot withdraw funds, edit profile, or delete inventory',
  );

  // Helper method to check permission
  bool hasPermission(Permission permission) {
    return permissions.contains(permission);
  }

  // Get role name for display
  String get displayName {
    switch (role) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.staff:
        return 'Staff';
    }
  }
}
