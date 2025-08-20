import 'package:equatable/equatable.dart';

/// ScheduledTask entity representing a scheduled task reminder
class ScheduledTask extends Equatable {
  const ScheduledTask({
    required this.id,
    required this.todoId,
    required this.userId,
    required this.scheduledDatetime,
    this.durationMinutes,
    this.notificationSent = false,
    this.notificationFrequency = NotificationFrequency.once,
    this.reminderMinutesBefore = 15,
    this.location,
    this.meetingUrl,
    this.attendees = const [],
    this.isAllDay = false,
    this.isCancelled = false,
    this.isRecurring = false,
    this.recurrencePattern = RecurrencePattern.none,
    this.recurrenceInterval = 1,
    this.recurrenceEndDate,
    this.parentScheduleId,
    this.isParentSchedule = false,
    this.recurrenceCount,
    this.weekdayMask,
    required this.createdAt,
    required this.updatedAt,
    this.todoTitle,
  });

  final String id;
  final String todoId;
  final String userId;
  final DateTime scheduledDatetime;
  final int? durationMinutes;
  final bool notificationSent;
  final NotificationFrequency notificationFrequency;
  final int reminderMinutesBefore;
  final String? location;
  final String? meetingUrl;
  final List<String> attendees;
  final bool isAllDay;
  final bool isCancelled;
  final bool isRecurring;
  final RecurrencePattern recurrencePattern;
  final int recurrenceInterval;
  final DateTime? recurrenceEndDate;
  final String? parentScheduleId;
  final bool isParentSchedule;
  final int? recurrenceCount;
  final int? weekdayMask;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? todoTitle;

  @override
  List<Object?> get props => [
    id,
    todoId,
    userId,
    scheduledDatetime,
    durationMinutes,
    notificationSent,
    notificationFrequency,
    reminderMinutesBefore,
    location,
    meetingUrl,
    attendees,
    isAllDay,
    isCancelled,
    isRecurring,
    recurrencePattern,
    recurrenceInterval,
    recurrenceEndDate,
    parentScheduleId,
    isParentSchedule,
    recurrenceCount,
    weekdayMask,
    createdAt,
    updatedAt,
    todoTitle,
  ];

  ScheduledTask copyWith({
    String? id,
    String? todoId,
    String? userId,
    DateTime? scheduledDatetime,
    int? durationMinutes,
    bool? notificationSent,
    NotificationFrequency? notificationFrequency,
    int? reminderMinutesBefore,
    String? location,
    String? meetingUrl,
    List<String>? attendees,
    bool? isAllDay,
    bool? isCancelled,
    bool? isRecurring,
    RecurrencePattern? recurrencePattern,
    int? recurrenceInterval,
    DateTime? recurrenceEndDate,
    String? parentScheduleId,
    bool? isParentSchedule,
    int? recurrenceCount,
    int? weekdayMask,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? todoTitle,
  }) {
    return ScheduledTask(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      userId: userId ?? this.userId,
      scheduledDatetime: scheduledDatetime ?? this.scheduledDatetime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      notificationSent: notificationSent ?? this.notificationSent,
      notificationFrequency:
          notificationFrequency ?? this.notificationFrequency,
      reminderMinutesBefore:
          reminderMinutesBefore ?? this.reminderMinutesBefore,
      location: location ?? this.location,
      meetingUrl: meetingUrl ?? this.meetingUrl,
      attendees: attendees ?? this.attendees,
      isAllDay: isAllDay ?? this.isAllDay,
      isCancelled: isCancelled ?? this.isCancelled,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      recurrenceEndDate: recurrenceEndDate ?? this.recurrenceEndDate,
      parentScheduleId: parentScheduleId ?? this.parentScheduleId,
      isParentSchedule: isParentSchedule ?? this.isParentSchedule,
      recurrenceCount: recurrenceCount ?? this.recurrenceCount,
      weekdayMask: weekdayMask ?? this.weekdayMask,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      todoTitle: todoTitle ?? this.todoTitle,
    );
  }

  factory ScheduledTask.fromJson(Map<String, dynamic> json) {
    return ScheduledTask(
      id: json['id'] ?? '',
      todoId: json['todo_id'] ?? '',
      userId: json['user_id'] ?? '',
      scheduledDatetime:
          DateTime.tryParse(json['scheduled_datetime'] ?? '') ?? DateTime.now(),
      durationMinutes: json['duration_minutes'],
      notificationSent: json['notification_sent'] ?? false,
      notificationFrequency: NotificationFrequency.fromString(
        json['notification_frequency'] ?? 'once',
      ),
      reminderMinutesBefore: json['reminder_minutes_before'] ?? 15,
      location: json['location'],
      meetingUrl: json['meeting_url'],
      attendees: (json['attendees'] as List?)?.cast<String>() ?? [],
      isAllDay: json['is_all_day'] ?? false,
      isCancelled: json['is_cancelled'] ?? false,
      isRecurring: json['is_recurring'] ?? false,
      recurrencePattern: RecurrencePattern.fromString(
        json['recurrence_pattern'] ?? 'none',
      ),
      recurrenceInterval: json['recurrence_interval'] ?? 1,
      recurrenceEndDate: json['recurrence_end_date'] != null
          ? DateTime.tryParse(json['recurrence_end_date'])
          : null,
      parentScheduleId: json['parent_schedule_id'],
      isParentSchedule: json['is_parent_schedule'] ?? false,
      recurrenceCount: json['recurrence_count'],
      weekdayMask: json['weekday_mask'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      todoTitle: json['todo_title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo_id': todoId,
      'user_id': userId,
      'scheduled_datetime': scheduledDatetime.toIso8601String(),
      'duration_minutes': durationMinutes,
      'notification_sent': notificationSent,
      'notification_frequency': notificationFrequency.value,
      'reminder_minutes_before': reminderMinutesBefore,
      'location': location,
      'meeting_url': meetingUrl,
      'attendees': attendees,
      'is_all_day': isAllDay,
      'is_cancelled': isCancelled,
      'is_recurring': isRecurring,
      'recurrence_pattern': recurrencePattern.value,
      'recurrence_interval': recurrenceInterval,
      'recurrence_end_date': recurrenceEndDate?.toIso8601String(),
      'parent_schedule_id': parentScheduleId,
      'is_parent_schedule': isParentSchedule,
      'recurrence_count': recurrenceCount,
      'weekday_mask': weekdayMask,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'todo_title': todoTitle,
    };
  }
}

/// Notification frequency enum
enum NotificationFrequency {
  none('none'),
  once('once'),
  daily('daily'),
  weekly('weekly'),
  monthly('monthly');

  const NotificationFrequency(this.value);
  final String value;

  static NotificationFrequency fromString(String value) {
    return NotificationFrequency.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NotificationFrequency.once,
    );
  }
}

/// Recurrence pattern enum
enum RecurrencePattern {
  none('none'),
  daily('daily'),
  weekdays('weekdays'),
  weekly('weekly'),
  monthly('monthly'),
  custom('custom');

  const RecurrencePattern(this.value);
  final String value;

  static RecurrencePattern fromString(String value) {
    return RecurrencePattern.values.firstWhere(
      (e) => e.value == value,
      orElse: () => RecurrencePattern.none,
    );
  }
}
