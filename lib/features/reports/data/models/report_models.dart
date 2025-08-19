import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_models.freezed.dart';
part 'report_models.g.dart';

// Enums
enum ReportDateRange {
  @JsonValue('last_hour')
  lastHour,
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('monthly')
  monthly,
  @JsonValue('custom')
  custom,
  @JsonValue('last_week')
  lastWeek,
  @JsonValue('last_month')
  lastMonth,
  @JsonValue('last_year')
  lastYear,
}

enum TaskStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('backlog')
  backlog,
  @JsonValue('done')
  done,
  @JsonValue('todo')
  todo,
  @JsonValue('blocked')
  blocked,
  @JsonValue('review')
  review,
  @JsonValue('testing')
  testing,
}

enum ProjectCategory {
  @JsonValue('personal')
  personal,
  @JsonValue('work')
  work,
  @JsonValue('education')
  education,
  @JsonValue('health')
  health,
  @JsonValue('finance')
  finance,
  @JsonValue('hobby')
  hobby,
  @JsonValue('other')
  other,
}

enum PriorityLevel {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

// Report Filter Request
@freezed
class ReportFilterRequest with _$ReportFilterRequest {
  const factory ReportFilterRequest({
    required ReportDateRange dateRange,
    DateTime? startDate,
    DateTime? endDate,
    String? projectId,
    String? userId,
    TaskStatus? status,
    ProjectCategory? category,
    PriorityLevel? priority,
    @Default(1) int page,
    @Default(50) int limit,
  }) = _ReportFilterRequest;

  factory ReportFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportFilterRequestFromJson(json);
}

// Task Report Metrics
@freezed
class TaskReportMetrics with _$TaskReportMetrics {
  const factory TaskReportMetrics({
    @Default(0) int totalTasks,
    @Default(0) int completedTasks,
    @Default(0) int inProgressTasks,
    @Default(0) int overdueTasks,
    @Default(0.0) double completionRate,
    @Default(0.0) double averageCompletionTime,
    @Default(0.0) double tasksPerDay,
    @Default(0.0) double hoursPerDay,
    @Default(0.0) double minutesPerTask,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
  }) = _TaskReportMetrics;

  factory TaskReportMetrics.fromJson(Map<String, dynamic> json) =>
      _$TaskReportMetricsFromJson(json);
}

// Project Report Metrics
@freezed
class ProjectReportMetrics with _$ProjectReportMetrics {
  const factory ProjectReportMetrics({
    @Default(0) int totalProjects,
    @Default(0) int activeProjects,
    @Default(0) int completedProjects,
    @Default(0) int archivedProjects,
    @Default(0.0) double averageProgress,
    @Default(0) int projectsWithOverdue,
  }) = _ProjectReportMetrics;

  factory ProjectReportMetrics.fromJson(Map<String, dynamic> json) =>
      _$ProjectReportMetricsFromJson(json);
}

// Time Distribution
@freezed
class TimeDistribution with _$TimeDistribution {
  const factory TimeDistribution({
    required String category,
    @Default(0) int totalMinutes,
    @Default(0.0) double totalHours,
    @Default(0.0) double percentage,
    @Default(0) int taskCount,
    @Default('#6B7280') String color,
  }) = _TimeDistribution;

  factory TimeDistribution.fromJson(Map<String, dynamic> json) =>
      _$TimeDistributionFromJson(json);
}

// Daily Productivity
@freezed
class DailyProductivity with _$DailyProductivity {
  const factory DailyProductivity({
    required DateTime date,
    @Default(0) int tasksCompleted,
    @Default(0.0) double hoursWorked,
    @Default(0) int breaksTaken,
    @Default(0) int breakMinutes,
    @Default(0) int focusTime,
    @Default(0.0) double productivityScore,
  }) = _DailyProductivity;

  factory DailyProductivity.fromJson(Map<String, dynamic> json) =>
      _$DailyProductivityFromJson(json);
}

// Hourly Productivity
@freezed
class HourlyProductivity with _$HourlyProductivity {
  const factory HourlyProductivity({
    required int hour,
    @Default(0) int tasksCompleted,
    @Default(0) int minutesWorked,
    @Default(0.0) double productivityScore,
  }) = _HourlyProductivity;

  factory HourlyProductivity.fromJson(Map<String, dynamic> json) =>
      _$HourlyProductivityFromJson(json);
}

// Tasks By Status
@freezed
class TasksByStatus with _$TasksByStatus {
  const factory TasksByStatus({
    required TaskStatus status,
    @Default(0) int count,
    @Default(0.0) double percentage,
  }) = _TasksByStatus;

  factory TasksByStatus.fromJson(Map<String, dynamic> json) =>
      _$TasksByStatusFromJson(json);
}

// Tasks By Priority
@freezed
class TasksByPriority with _$TasksByPriority {
  const factory TasksByPriority({
    required PriorityLevel priority,
    @Default(0) int count,
    @Default(0.0) double percentage,
  }) = _TasksByPriority;

  factory TasksByPriority.fromJson(Map<String, dynamic> json) =>
      _$TasksByPriorityFromJson(json);
}

// Productivity Insights
@freezed
class ProductivityInsights with _$ProductivityInsights {
  const factory ProductivityInsights({
    @Default(9) int mostProductiveHour,
    @Default('Monday') String mostProductiveDay,
    @Default('January') String mostProductiveMonth,
    @Default('work') String bestPerformingCategory,
    @Default(0.0) double averageSessionLength,
    @Default(60) int optimalBreakFrequency,
  }) = _ProductivityInsights;

  factory ProductivityInsights.fromJson(Map<String, dynamic> json) =>
      _$ProductivityInsightsFromJson(json);
}

// Report Task
@freezed
class ReportTask with _$ReportTask {
  const factory ReportTask({
    required String id,
    required String taskName,
    required TaskStatus status,
    required PriorityLevel priority,
    required String projectTitle,
    DateTime? completedAt,
    int? estimatedTime,
    @Default(0) int actualTime,
    int? difficultyRating,
    required DateTime createdAt,
    DateTime? dueDate,
    @Default(false) bool isOverdue,
  }) = _ReportTask;

  factory ReportTask.fromJson(Map<String, dynamic> json) =>
      _$ReportTaskFromJson(json);
}

// Reports Overview
@freezed
class ReportsOverview with _$ReportsOverview {
  const factory ReportsOverview({
    TaskReportMetrics? taskMetrics,
    ProjectReportMetrics? projectMetrics,
    @Default([]) List<TimeDistribution> timeDistribution,
    @Default([]) List<DailyProductivity> dailyProductivity,
    @Default([]) List<HourlyProductivity> hourlyProductivity,
    @Default([]) List<TasksByStatus> tasksByStatus,
    @Default([]) List<TasksByPriority> tasksByPriority,
    ProductivityInsights? productivityInsights,
    @Default([]) List<ReportTask> recentTasks,
    @Default([]) List<ReportTask> upcomingDeadlines,
  }) = _ReportsOverview;

  factory ReportsOverview.fromJson(Map<String, dynamic> json) =>
      _$ReportsOverviewFromJson(json);
}

// Comparison Report
@freezed
class ComparisonReport with _$ComparisonReport {
  const factory ComparisonReport({
    TaskReportMetrics? currentPeriod,
    TaskReportMetrics? previousPeriod,
    @Default({}) Map<String, double> percentageChange,
  }) = _ComparisonReport;

  factory ComparisonReport.fromJson(Map<String, dynamic> json) =>
      _$ComparisonReportFromJson(json);
}

// Export Request
@freezed
class ExportRequest with _$ExportRequest {
  const factory ExportRequest({
    required String format,
    required String reportType,
    ReportFilterRequest? filters,
  }) = _ExportRequest;

  factory ExportRequest.fromJson(Map<String, dynamic> json) =>
      _$ExportRequestFromJson(json);
}

// API Response wrapper
@freezed
class ReportApiResponse<T> with _$ReportApiResponse<T> {
  const factory ReportApiResponse({
    required bool success,
    @JsonKey(includeFromJson: false, includeToJson: false) T? data,
    Map<String, dynamic>? meta,
    Map<String, dynamic>? error,
  }) = _ReportApiResponse<T>;

  factory ReportApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ReportApiResponse<T>(
      success: json['success'] as bool,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      meta: json['meta'] as Map<String, dynamic>?,
      error: json['error'] as Map<String, dynamic>?,
    );
  }
}

// Chart Data for UI
@freezed
class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    required String label,
    required double value,
    String? color,
    String? secondaryLabel,
    double? secondaryValue,
  }) = _ChartDataPoint;

  factory ChartDataPoint.fromJson(Map<String, dynamic> json) =>
      _$ChartDataPointFromJson(json);
}

// UI Helper Extensions
extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
      case TaskStatus.onHold:
        return 'On Hold';
      case TaskStatus.backlog:
        return 'Backlog';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.blocked:
        return 'Blocked';
      case TaskStatus.review:
        return 'Review';
      case TaskStatus.testing:
        return 'Testing';
    }
  }
}

extension PriorityLevelExtension on PriorityLevel {
  String get displayName {
    switch (this) {
      case PriorityLevel.low:
        return 'Low';
      case PriorityLevel.medium:
        return 'Medium';
      case PriorityLevel.high:
        return 'High';
      case PriorityLevel.urgent:
        return 'Urgent';
    }
  }
}

extension ProjectCategoryExtension on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.personal:
        return 'Personal';
      case ProjectCategory.work:
        return 'Work';
      case ProjectCategory.education:
        return 'Education';
      case ProjectCategory.health:
        return 'Health';
      case ProjectCategory.finance:
        return 'Finance';
      case ProjectCategory.hobby:
        return 'Hobby';
      case ProjectCategory.other:
        return 'Other';
    }
  }
}

extension ReportDateRangeExtension on ReportDateRange {
  String get displayName {
    switch (this) {
      case ReportDateRange.lastHour:
        return 'Last Hour';
      case ReportDateRange.daily:
        return 'Today';
      case ReportDateRange.weekly:
        return 'This Week';
      case ReportDateRange.monthly:
        return 'This Month';
      case ReportDateRange.custom:
        return 'Custom Range';
      case ReportDateRange.lastWeek:
        return 'Last Week';
      case ReportDateRange.lastMonth:
        return 'Last Month';
      case ReportDateRange.lastYear:
        return 'Last Year';
    }
  }
}
