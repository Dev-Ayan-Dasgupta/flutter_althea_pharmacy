import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_entity.freezed.dart';

@freezed
abstract class WalletEntity with _$WalletEntity {
  const WalletEntity._();

  const factory WalletEntity({
    required String pharmacyId,
    required double pendingBalance,
    required double availableBalance,
    required double totalWithdrawn,
    required double lifetimeEarnings,
    required int totalOrders,
    required DateTime lastUpdated,
  }) = _WalletEntity;

  double get totalBalance => pendingBalance + availableBalance;
}
