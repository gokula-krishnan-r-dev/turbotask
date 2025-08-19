// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportFilterRequestImpl _$$ReportFilterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ReportFilterRequestImpl(
  dateRange: $enumDecode(_$ReportDateRangeEnumMap, json['dateRange']),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  projectId: json['projectId'] as String?,
  userId: json['userId'] as String?,
  status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']),
  category: $enumDecodeNullable(_$ProjectCategoryEnumMap, json['category']),
  priority: $enumDecodeNullable(_$PriorityLevelEnumMap, json['priority']),
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 50,
);

Map<String, dynamic> _$$ReportFilterRequestImplToJson(
  _$ReportFilterRequestImpl instance,
) => <String, dynamic>{
  'dateRange': _$ReportDateRangeEnumMap[instance.dateRange]!,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'projectId': instance.projectId,
  'userId': instance.userId,
  'status': _$TaskStatusEnumMap[instance.status],
  'category': _$ProjectCategoryEnumMap[instance.category],
  'priority': _$PriorityLevelEnumMap[instance.priority],
  'page': instance.page,
  'limit': instance.limit,
};

const _$ReportDateRangeEnumMap = {
  ReportDateRange.lastHour: 'last_hour',
  ReportDateRange.daily: 'daily',
  ReportDateRange.weekly: 'weekly',
  ReportDateRange.monthly: 'monthly',
  ReportDateRange.custom: 'custom',
  ReportDateRange.lastWeek: 'last_week',
  ReportDateRange.lastMonth: 'last_month',
  ReportDateRange.lastYear: 'last_year',
};

const _$TaskStatusEnumMap = {
  TaskStatus.notStarted: 'not_started',
  TaskStatus.inProgress: 'in_progress',
  TaskStatus.pending: 'pending',
  TaskStatus.completed: 'completed',
  TaskStatus.cancelled: 'cancelled',
  TaskStatus.onHold: 'on_hold',
  TaskStatus.backlog: 'backlog',
  TaskStatus.done: 'done',
  TaskStatus.todo: 'todo',
  TaskStatus.blocked: 'blocked',
  TaskStatus.review: 'review',
  TaskStatus.testing: 'testing',
};

const _$ProjectCategoryEnumMap = {
  ProjectCategory.personal: 'personal',
  ProjectCategory.work: 'work',
  ProjectCategory.education: 'education',
  ProjectCategory.health: 'health',
  ProjectCategory.finance: 'finance',
  ProjectCategory.hobby: 'hobby',
  ProjectCategory.other: 'other',
};

const _$PriorityLevelEnumMap = {
  PriorityLevel.low: 'low',
  PriorityLevel.medium: 'medium',
  PriorityLevel.high: 'high',
  PriorityLevel.urgent: 'urgent',
};

_$TaskReportMetricsImpl _$$TaskReportMetricsImplFromJson(
  Map<String, dynamic> json,
) => _$TaskReportMetricsImpl(
  totalTasks: (json['totalTasks'] as num?)?.toInt() ?? 0,
  completedTasks: (json['completedTasks'] as num?)?.toInt() ?? 0,
  inProgressTasks: (json['inProgressTasks'] as num?)?.toInt() ?? 0,
  overdueTasks: (json['overdueTasks'] as num?)?.toInt() ?? 0,
  completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
  averageCompletionTime:
      (json['averageCompletionTime'] as num?)?.toDouble() ?? 0.0,
  tasksPerDay: (json['tasksPerDay'] as num?)?.toDouble() ?? 0.0,
  hoursPerDay: (json['hoursPerDay'] as num?)?.toDouble() ?? 0.0,
  minutesPerTask: (json['minutesPerTask'] as num?)?.toDouble() ?? 0.0,
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$TaskReportMetricsImplToJson(
  _$TaskReportMetricsImpl instance,
) => <String, dynamic>{
  'totalTasks': instance.totalTasks,
  'completedTasks': instance.completedTasks,
  'inProgressTasks': instance.inProgressTasks,
  'overdueTasks': instance.overdueTasks,
  'completionRate': instance.completionRate,
  'averageCompletionTime': instance.averageCompletionTime,
  'tasksPerDay': instance.tasksPerDay,
  'hoursPerDay': instance.hoursPerDay,
  'minutesPerTask': instance.minutesPerTask,
  'currentStreak': instance.currentStreak,
  'longestStreak': instance.longestStreak,
};

_$ProjectReportMetricsImpl _$$ProjectReportMetricsImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectReportMetricsImpl(
  totalProjects: (json['totalProjects'] as num?)?.toInt() ?? 0,
  activeProjects: (json['activeProjects'] as num?)?.toInt() ?? 0,
  completedProjects: (json['completedProjects'] as num?)?.toInt() ?? 0,
  archivedProjects: (json['archivedProjects'] as num?)?.toInt() ?? 0,
  averageProgress: (json['averageProgress'] as num?)?.toDouble() ?? 0.0,
  projectsWithOverdue: (json['projectsWithOverdue'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ProjectReportMetricsImplToJson(
  _$ProjectReportMetricsImpl instance,
) => <String, dynamic>{
  'totalProjects': instance.totalProjects,
  'activeProjects': instance.activeProjects,
  'completedProjects': instance.completedProjects,
  'archivedProjects': instance.archivedProjects,
  'averageProgress': instance.averageProgress,
  'projectsWithOverdue': instance.projectsWithOverdue,
};

_$TimeDistributionImpl _$$TimeDistributionImplFromJson(
  Map<String, dynamic> json,
) => _$TimeDistributionImpl(
  category: json['category'] as String,
  totalMinutes: (json['totalMinutes'] as num?)?.toInt() ?? 0,
  totalHours: (json['totalHours'] as num?)?.toDouble() ?? 0.0,
  percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
  taskCount: (json['taskCount'] as num?)?.toInt() ?? 0,
  color: json['color'] as String? ?? '#6B7280',
);

Map<String, dynamic> _$$TimeDistributionImplToJson(
  _$TimeDistributionImpl instance,
) => <String, dynamic>{
  'category': instance.category,
  'totalMinutes': instance.totalMinutes,
  'totalHours': instance.totalHours,
  'percentage': instance.percentage,
  'taskCount': instance.taskCount,
  'color': instance.color,
};

_$DailyProductivityImpl _$$DailyProductivityImplFromJson(
  Map<String, dynamic> json,
) => _$DailyProductivityImpl(
  date: DateTime.parse(json['date'] as String),
  tasksCompleted: (json['tasksCompleted'] as num?)?.toInt() ?? 0,
  hoursWorked: (json['hoursWorked'] as num?)?.toDouble() ?? 0.0,
  breaksTaken: (json['breaksTaken'] as num?)?.toInt() ?? 0,
  breakMinutes: (json['breakMinutes'] as num?)?.toInt() ?? 0,
  focusTime: (json['focusTime'] as num?)?.toInt() ?? 0,
  productivityScore: (json['productivityScore'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$DailyProductivityImplToJson(
  _$DailyProductivityImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'tasksCompleted': instance.tasksCompleted,
  'hoursWorked': instance.hoursWorked,
  'breaksTaken': instance.breaksTaken,
  'breakMinutes': instance.breakMinutes,
  'focusTime': instance.focusTime,
  'productivityScore': instance.productivityScore,
};

_$HourlyProductivityImpl _$$HourlyProductivityImplFromJson(
  Map<String, dynamic> json,
) => _$HourlyProductivityImpl(
  hour: (json['hour'] as num).toInt(),
  tasksCompleted: (json['tasksCompleted'] as num?)?.toInt() ?? 0,
  minutesWorked: (json['minutesWorked'] as num?)?.toInt() ?? 0,
  productivityScore: (json['productivityScore'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$HourlyProductivityImplToJson(
  _$HourlyProductivityImpl instance,
) => <String, dynamic>{
  'hour': instance.hour,
  'tasksCompleted': instance.tasksCompleted,
  'minutesWorked': instance.minutesWorked,
  'productivityScore': instance.productivityScore,
};

_$TasksByStatusImpl _$$TasksByStatusImplFromJson(Map<String, dynamic> json) =>
    _$TasksByStatusImpl(
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      count: (json['count'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$TasksByStatusImplToJson(_$TasksByStatusImpl instance) =>
    <String, dynamic>{
      'status': _$TaskStatusEnumMap[instance.status]!,
      'count': instance.count,
      'percentage': instance.percentage,
    };

_$TasksByPriorityImpl _$$TasksByPriorityImplFromJson(
  Map<String, dynamic> json,
) => _$TasksByPriorityImpl(
  priority: $enumDecode(_$PriorityLevelEnumMap, json['priority']),
  count: (json['count'] as num?)?.toInt() ?? 0,
  percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$TasksByPriorityImplToJson(
  _$TasksByPriorityImpl instance,
) => <String, dynamic>{
  'priority': _$PriorityLevelEnumMap[instance.priority]!,
  'count': instance.count,
  'percentage': instance.percentage,
};

_$ProductivityInsightsImpl _$$ProductivityInsightsImplFromJson(
  Map<String, dynamic> json,
) => _$ProductivityInsightsImpl(
  mostProductiveHour: (json['mostProductiveHour'] as num?)?.toInt() ?? 9,
  mostProductiveDay: json['mostProductiveDay'] as String? ?? 'Monday',
  mostProductiveMonth: json['mostProductiveMonth'] as String? ?? 'January',
  bestPerformingCategory: json['bestPerformingCategory'] as String? ?? 'work',
  averageSessionLength:
      (json['averageSessionLength'] as num?)?.toDouble() ?? 0.0,
  optimalBreakFrequency: (json['optimalBreakFrequency'] as num?)?.toInt() ?? 60,
);

Map<String, dynamic> _$$ProductivityInsightsImplToJson(
  _$ProductivityInsightsImpl instance,
) => <String, dynamic>{
  'mostProductiveHour': instance.mostProductiveHour,
  'mostProductiveDay': instance.mostProductiveDay,
  'mostProductiveMonth': instance.mostProductiveMonth,
  'bestPerformingCategory': instance.bestPerformingCategory,
  'averageSessionLength': instance.averageSessionLength,
  'optimalBreakFrequency': instance.optimalBreakFrequency,
};

_$ReportTaskImpl _$$ReportTaskImplFromJson(Map<String, dynamic> json) =>
    _$ReportTaskImpl(
      id: json['id'] as String,
      taskName: json['taskName'] as String,
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      priority: $enumDecode(_$PriorityLevelEnumMap, json['priority']),
      projectTitle: json['projectTitle'] as String,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      estimatedTime: (json['estimatedTime'] as num?)?.toInt(),
      actualTime: (json['actualTime'] as num?)?.toInt() ?? 0,
      difficultyRating: (json['difficultyRating'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      isOverdue: json['isOverdue'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReportTaskImplToJson(_$ReportTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'priority': _$PriorityLevelEnumMap[instance.priority]!,
      'projectTitle': instance.projectTitle,
      'completedAt': instance.completedAt?.toIso8601String(),
      'estimatedTime': instance.estimatedTime,
      'actualTime': instance.actualTime,
      'difficultyRating': instance.difficultyRating,
      'createdAt': instance.createdAt.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'isOverdue': instance.isOverdue,
    };

_$ReportsOverviewImpl _$$ReportsOverviewImplFromJson(
  Map<String, dynamic> json,
) => _$ReportsOverviewImpl(
  taskMetrics: json['taskMetrics'] == null
      ? null
      : TaskReportMetrics.fromJson(json['taskMetrics'] as Map<String, dynamic>),
  projectMetrics: json['projectMetrics'] == null
      ? null
      : ProjectReportMetrics.fromJson(
          json['projectMetrics'] as Map<String, dynamic>,
        ),
  timeDistribution:
      (json['timeDistribution'] as List<dynamic>?)
          ?.map((e) => TimeDistribution.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  dailyProductivity:
      (json['dailyProductivity'] as List<dynamic>?)
          ?.map((e) => DailyProductivity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  hourlyProductivity:
      (json['hourlyProductivity'] as List<dynamic>?)
          ?.map((e) => HourlyProductivity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tasksByStatus:
      (json['tasksByStatus'] as List<dynamic>?)
          ?.map((e) => TasksByStatus.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tasksByPriority:
      (json['tasksByPriority'] as List<dynamic>?)
          ?.map((e) => TasksByPriority.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  productivityInsights: json['productivityInsights'] == null
      ? null
      : ProductivityInsights.fromJson(
          json['productivityInsights'] as Map<String, dynamic>,
        ),
  recentTasks:
      (json['recentTasks'] as List<dynamic>?)
          ?.map((e) => ReportTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  upcomingDeadlines:
      (json['upcomingDeadlines'] as List<dynamic>?)
          ?.map((e) => ReportTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ReportsOverviewImplToJson(
  _$ReportsOverviewImpl instance,
) => <String, dynamic>{
  'taskMetrics': instance.taskMetrics,
  'projectMetrics': instance.projectMetrics,
  'timeDistribution': instance.timeDistribution,
  'dailyProductivity': instance.dailyProductivity,
  'hourlyProductivity': instance.hourlyProductivity,
  'tasksByStatus': instance.tasksByStatus,
  'tasksByPriority': instance.tasksByPriority,
  'productivityInsights': instance.productivityInsights,
  'recentTasks': instance.recentTasks,
  'upcomingDeadlines': instance.upcomingDeadlines,
};

_$ComparisonReportImpl _$$ComparisonReportImplFromJson(
  Map<String, dynamic> json,
) => _$ComparisonReportImpl(
  currentPeriod: json['currentPeriod'] == null
      ? null
      : TaskReportMetrics.fromJson(
          json['currentPeriod'] as Map<String, dynamic>,
        ),
  previousPeriod: json['previousPeriod'] == null
      ? null
      : TaskReportMetrics.fromJson(
          json['previousPeriod'] as Map<String, dynamic>,
        ),
  percentageChange:
      (json['percentageChange'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const {},
);

Map<String, dynamic> _$$ComparisonReportImplToJson(
  _$ComparisonReportImpl instance,
) => <String, dynamic>{
  'currentPeriod': instance.currentPeriod,
  'previousPeriod': instance.previousPeriod,
  'percentageChange': instance.percentageChange,
};

_$ExportRequestImpl _$$ExportRequestImplFromJson(Map<String, dynamic> json) =>
    _$ExportRequestImpl(
      format: json['format'] as String,
      reportType: json['reportType'] as String,
      filters: json['filters'] == null
          ? null
          : ReportFilterRequest.fromJson(
              json['filters'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ExportRequestImplToJson(_$ExportRequestImpl instance) =>
    <String, dynamic>{
      'format': instance.format,
      'reportType': instance.reportType,
      'filters': instance.filters,
    };

_$ChartDataPointImpl _$$ChartDataPointImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataPointImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
      color: json['color'] as String?,
      secondaryLabel: json['secondaryLabel'] as String?,
      secondaryValue: (json['secondaryValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ChartDataPointImplToJson(
  _$ChartDataPointImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'color': instance.color,
  'secondaryLabel': instance.secondaryLabel,
  'secondaryValue': instance.secondaryValue,
};
