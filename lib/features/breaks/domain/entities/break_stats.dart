import 'package:freezed_annotation/freezed_annotation.dart';
import 'break_session.dart';

part 'break_stats.freezed.dart';
part 'break_stats.g.dart';

@freezed
class BreakStats with _$BreakStats {
  const factory BreakStats({
    required int totalBreaks,
    required int totalDuration, // Total duration in seconds
    required double averageDuration, // Average duration in seconds
    required int todayBreaks,
    required int todayDuration, // Today's total duration in seconds
    required int thisWeekBreaks,
    required int thisWeekDuration, // This week's total duration in seconds
    BreakSession? currentActiveBreak,
  }) = _BreakStats;

  factory BreakStats.fromJson(Map<String, dynamic> json) =>
      _$BreakStatsFromJson(json);
}

extension BreakStatsX on BreakStats {
  /// Returns formatted total duration string (HH:MM:SS)
  String get formattedTotalDuration {
    final hours = totalDuration ~/ 3600;
    final minutes = (totalDuration % 3600) ~/ 60;
    final seconds = totalDuration % 60;

    return [
      if (hours > 0) hours.toString().padLeft(2, '0'),
      minutes.toString().padLeft(2, '0'),
      seconds.toString().padLeft(2, '0'),
    ].join(':');
  }

  /// Returns formatted today's duration string (HH:MM:SS)
  String get formattedTodayDuration {
    final hours = todayDuration ~/ 3600;
    final minutes = (todayDuration % 3600) ~/ 60;
    final seconds = todayDuration % 60;

    return [
      if (hours > 0) hours.toString().padLeft(2, '0'),
      minutes.toString().padLeft(2, '0'),
      seconds.toString().padLeft(2, '0'),
    ].join(':');
  }

  /// Returns formatted average duration string (HH:MM:SS)
  String get formattedAverageDuration {
    final avgSeconds = averageDuration.toInt();
    final hours = avgSeconds ~/ 3600;
    final minutes = (avgSeconds % 3600) ~/ 60;
    final seconds = avgSeconds % 60;

    return [
      if (hours > 0) hours.toString().padLeft(2, '0'),
      minutes.toString().padLeft(2, '0'),
      seconds.toString().padLeft(2, '0'),
    ].join(':');
  }

  /// Check if there's an active break currently
  bool get hasActiveBreak =>
      currentActiveBreak != null && currentActiveBreak!.endTime == null;
}
