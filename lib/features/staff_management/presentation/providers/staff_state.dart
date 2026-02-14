import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/staff_entity.dart';

part 'staff_state.freezed.dart';

@freezed
abstract class StaffState with _$StaffState {
  const factory StaffState.initial() = StaffStateInitial;
  const factory StaffState.loading() = StaffStateLoading;
  const factory StaffState.loaded(List<StaffEntity> staffList) = StaffStateLoaded;
  const factory StaffState.error(String message) = StaffStateError;
}
