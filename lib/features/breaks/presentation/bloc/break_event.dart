import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_event.freezed.dart';

@freezed
class BreakEvent with _$BreakEvent {
  const factory BreakEvent.startBreak({
    required String todoId,
    required String projectId,
    @Default('manual') String breakType,
    @Default('') String notes,
  }) = StartBreak;

  const factory BreakEvent.stopBreak({@Default('') String notes}) = StopBreak;

  const factory BreakEvent.loadActiveBreak() = LoadActiveBreak;

  const factory BreakEvent.loadBreakHistory({
    @Default(20) int limit,
    @Default(0) int offset,
  }) = LoadBreakHistory;

  const factory BreakEvent.loadBreakStats() = LoadBreakStats;

  const factory BreakEvent.updateTimer() = UpdateTimer;
}
