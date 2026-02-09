import 'package:dartz/dartz.dart';
import '../../domain/entities/analytics_entity.dart';
import '../../domain/repositories/analytics_repository.dart';

class MockAnalyticsRepository implements AnalyticsRepository {
  @override
  Future<Either<String, AnalyticsEntity>> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      // Generate mock daily earnings
      final dailyEarnings = _generateDailyEarnings(startDate, endDate);

      // Calculate totals
      final totalEarnings = dailyEarnings.fold<double>(
        0,
        (sum, day) => sum + day.amount,
      );

      final totalOrders = dailyEarnings.fold<int>(
        0,
        (sum, day) => sum + day.orderCount,
      );

      // Calculate shares (82% pharmacy, 8% delivery, 10% platform)
      final pharmacyShare = totalEarnings * 0.82;
      final deliveryFee = totalEarnings * 0.08;
      final platformFee = totalEarnings * 0.10;

      return Right(
        AnalyticsEntity(
          totalEarnings: totalEarnings,
          pharmacyShare: pharmacyShare,
          deliveryFee: deliveryFee,
          platformFee: platformFee,
          totalOrders: totalOrders,
          completedOrders: (totalOrders * 0.92).round(),
          cancelledOrders: (totalOrders * 0.08).round(),
          averageOrderValue: totalOrders > 0 ? totalEarnings / totalOrders : 0,
          dailyEarnings: dailyEarnings,
          categoryEarnings: _generateCategoryEarnings(),
          startDate: startDate,
          endDate: endDate,
        ),
      );
    } catch (e) {
      return Left('Failed to load analytics: $e');
    }
  }

  List<DailyEarning> _generateDailyEarnings(DateTime start, DateTime end) {
    final List<DailyEarning> earnings = [];
    DateTime current = start;

    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      // Generate random earnings between 5000-15000
      final baseAmount = 5000 + (current.day * 300);
      final variation = (current.weekday == 6 || current.weekday == 7)
          ? 0.7
          : 1.0;
      final amount = (baseAmount * variation).toDouble();

      // Generate random order count between 8-25
      final orderCount = 8 + (current.day % 18);

      earnings.add(
        DailyEarning(date: current, amount: amount, orderCount: orderCount),
      );

      current = current.add(const Duration(days: 1));
    }

    return earnings;
  }

  List<CategoryEarning> _generateCategoryEarnings() {
    return const [
      CategoryEarning(
        category: 'Prescription Drugs',
        amount: 45230.50,
        percentage: 52.3,
      ),
      CategoryEarning(
        category: 'OTC Medicines',
        amount: 23140.75,
        percentage: 26.7,
      ),
      CategoryEarning(
        category: 'Health Supplements',
        amount: 12450.00,
        percentage: 14.4,
      ),
      CategoryEarning(
        category: 'Personal Care',
        amount: 5680.25,
        percentage: 6.6,
      ),
    ];
  }
}
