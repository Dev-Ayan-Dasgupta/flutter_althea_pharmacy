import 'package:dartz/dartz.dart';
import '../entities/analytics_entity.dart';

abstract class AnalyticsRepository {
  Future<Either<String, AnalyticsEntity>> getAnalytics({
    required DateTime startDate,
    required DateTime endDate,
  });
}
