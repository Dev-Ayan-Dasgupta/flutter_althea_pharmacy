import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_entity.freezed.dart';

enum DateRangeType {
  today,
  yesterday,
  last7Days,
  last30Days,
  thisMonth,
  lastMonth,
  custom,
}

@freezed
abstract class AnalyticsEntity with _$AnalyticsEntity {
  const factory AnalyticsEntity({
    required double totalEarnings,
    required double pharmacyShare,
    required double deliveryFee,
    required double platformFee,
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double averageOrderValue,
    required List<DailyEarning> dailyEarnings,
    required List<CategoryEarning> categoryEarnings,
    required DateTime startDate,
    required DateTime endDate,
  }) = _AnalyticsEntity;
}

@freezed
abstract class DailyEarning with _$DailyEarning {
  const factory DailyEarning({
    required DateTime date,
    required double amount,
    required int orderCount,
  }) = _DailyEarning;
}

@freezed
abstract class CategoryEarning with _$CategoryEarning {
  const factory CategoryEarning({
    required String category,
    required double amount,
    required double percentage,
  }) = _CategoryEarning;
}
