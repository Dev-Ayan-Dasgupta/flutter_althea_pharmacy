// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => _WalletModel(
  pharmacyId: json['pharmacyId'] as String,
  pendingBalance: (json['pendingBalance'] as num).toDouble(),
  availableBalance: (json['availableBalance'] as num).toDouble(),
  totalWithdrawn: (json['totalWithdrawn'] as num).toDouble(),
  lifetimeEarnings: (json['lifetimeEarnings'] as num).toDouble(),
  totalOrders: (json['totalOrders'] as num).toInt(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$WalletModelToJson(_WalletModel instance) =>
    <String, dynamic>{
      'pharmacyId': instance.pharmacyId,
      'pendingBalance': instance.pendingBalance,
      'availableBalance': instance.availableBalance,
      'totalWithdrawn': instance.totalWithdrawn,
      'lifetimeEarnings': instance.lifetimeEarnings,
      'totalOrders': instance.totalOrders,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
