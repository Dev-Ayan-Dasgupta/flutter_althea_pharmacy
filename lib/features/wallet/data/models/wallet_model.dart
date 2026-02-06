import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/wallet_entity.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
abstract class WalletModel with _$WalletModel {
  const WalletModel._();

  const factory WalletModel({
    required String pharmacyId,
    required double pendingBalance,
    required double availableBalance,
    required double totalWithdrawn,
    required double lifetimeEarnings,
    required int totalOrders,
    required DateTime lastUpdated,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  WalletEntity toEntity() {
    return WalletEntity(
      pharmacyId: pharmacyId,
      pendingBalance: pendingBalance,
      availableBalance: availableBalance,
      totalWithdrawn: totalWithdrawn,
      lifetimeEarnings: lifetimeEarnings,
      totalOrders: totalOrders,
      lastUpdated: lastUpdated,
    );
  }

  factory WalletModel.fromEntity(WalletEntity entity) {
    return WalletModel(
      pharmacyId: entity.pharmacyId,
      pendingBalance: entity.pendingBalance,
      availableBalance: entity.availableBalance,
      totalWithdrawn: entity.totalWithdrawn,
      lifetimeEarnings: entity.lifetimeEarnings,
      totalOrders: entity.totalOrders,
      lastUpdated: entity.lastUpdated,
    );
  }
}
