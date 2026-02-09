import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/analytics_entity.dart';

part 'analytics_state.freezed.dart';

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = _Initial;
  const factory AnalyticsState.loading() = _Loading;
  const factory AnalyticsState.loaded(AnalyticsEntity analytics) = _Loaded;
  const factory AnalyticsState.error(String message) = _Error;
}
