import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/analytics_entity.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../../data/repositories/mock_analytics_repository.dart';
import 'analytics_state.dart';

part 'analytics_provider.g.dart';

@riverpod
AnalyticsRepository analyticsRepository(Ref ref) {
  return MockAnalyticsRepository();
}

@riverpod
class Analytics extends _$Analytics {
  @override
  AnalyticsState build() {
    // Load last 7 days by default
    final endDate = DateTime.now();
    final startDate = endDate.subtract(const Duration(days: 6));
    loadAnalytics(startDate: startDate, endDate: endDate);
    return const AnalyticsState.initial();
  }

  Future<void> loadAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    state = const AnalyticsState.loading();

    final repository = ref.read(analyticsRepositoryProvider);
    final result = await repository.getAnalytics(
      startDate: startDate,
      endDate: endDate,
    );

    result.fold(
      (error) => state = AnalyticsState.error(error),
      (analytics) => state = AnalyticsState.loaded(analytics),
    );
  }

  Future<void> loadByDateRange(DateRangeType rangeType) async {
    final now = DateTime.now();
    DateTime startDate;
    DateTime endDate;

    switch (rangeType) {
      case DateRangeType.today:
        startDate = DateTime(now.year, now.month, now.day);
        endDate = now;
        break;
      case DateRangeType.yesterday:
        final yesterday = now.subtract(const Duration(days: 1));
        startDate = DateTime(yesterday.year, yesterday.month, yesterday.day);
        endDate = DateTime(
          yesterday.year,
          yesterday.month,
          yesterday.day,
          23,
          59,
          59,
        );
        break;
      case DateRangeType.last7Days:
        startDate = now.subtract(const Duration(days: 6));
        endDate = now;
        break;
      case DateRangeType.last30Days:
        startDate = now.subtract(const Duration(days: 29));
        endDate = now;
        break;
      case DateRangeType.thisMonth:
        startDate = DateTime(now.year, now.month, 1);
        endDate = now;
        break;
      case DateRangeType.lastMonth:
        final lastMonth = DateTime(now.year, now.month - 1, 1);
        startDate = lastMonth;
        endDate = DateTime(now.year, now.month, 0, 23, 59, 59);
        break;
      case DateRangeType.custom:
        // Custom range will be handled separately
        return;
    }

    await loadAnalytics(startDate: startDate, endDate: endDate);
  }
}
