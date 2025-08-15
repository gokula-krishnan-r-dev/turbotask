import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../projects/domain/entities/project.dart';

part 'break_session.freezed.dart';
part 'break_session.g.dart';

@freezed
class BreakSession with _$BreakSession {
  const factory BreakSession({
    required String id,
    required String todoId,
    required String projectId,
    required String userId,
    required DateTime startTime,
    DateTime? endTime,
    required int duration, // Duration in seconds
    @Default('manual') String breakType,
    @Default('') String notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) Todo? todo,
    @JsonKey(includeFromJson: false, includeToJson: false) Project? project,
  }) = _BreakSession;

  factory BreakSession.fromJson(Map<String, dynamic> json) =>
      _$BreakSessionFromJson(json);
}

extension BreakSessionX on BreakSession {
  /// Returns true if the break is currently active (no end time)
  bool get isActive => endTime == null;

  /// Returns the actual duration of the break
  int get actualDuration {
    if (endTime == null) {
      // Calculate duration from start time to now
      return DateTime.now().difference(startTime).inSeconds;
    }
    return duration;
  }

  /// Returns formatted duration string (HH:MM:SS)
  String get formattedDuration {
    final totalSeconds = actualDuration;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }

  /// Returns a human-readable break type
  String get displayBreakType {
    switch (breakType.toLowerCase()) {
      case 'manual':
        return 'Manual Break';
      case 'scheduled':
        return 'Scheduled Break';
      case 'automatic':
        return 'Automatic Break';
      default:
        return breakType;
    }
  }
}
