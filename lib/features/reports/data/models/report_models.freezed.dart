// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportFilterRequest _$ReportFilterRequestFromJson(Map<String, dynamic> json) {
  return _ReportFilterRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportFilterRequest {
  ReportDateRange get dateRange => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  TaskStatus? get status => throw _privateConstructorUsedError;
  ProjectCategory? get category => throw _privateConstructorUsedError;
  PriorityLevel? get priority => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this ReportFilterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportFilterRequestCopyWith<ReportFilterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFilterRequestCopyWith<$Res> {
  factory $ReportFilterRequestCopyWith(
    ReportFilterRequest value,
    $Res Function(ReportFilterRequest) then,
  ) = _$ReportFilterRequestCopyWithImpl<$Res, ReportFilterRequest>;
  @useResult
  $Res call({
    ReportDateRange dateRange,
    DateTime? startDate,
    DateTime? endDate,
    String? projectId,
    String? userId,
    TaskStatus? status,
    ProjectCategory? category,
    PriorityLevel? priority,
    int page,
    int limit,
  });
}

/// @nodoc
class _$ReportFilterRequestCopyWithImpl<$Res, $Val extends ReportFilterRequest>
    implements $ReportFilterRequestCopyWith<$Res> {
  _$ReportFilterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? category = freezed,
    Object? priority = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(
      _value.copyWith(
            dateRange: null == dateRange
                ? _value.dateRange
                : dateRange // ignore: cast_nullable_to_non_nullable
                      as ReportDateRange,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ProjectCategory?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as PriorityLevel?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportFilterRequestImplCopyWith<$Res>
    implements $ReportFilterRequestCopyWith<$Res> {
  factory _$$ReportFilterRequestImplCopyWith(
    _$ReportFilterRequestImpl value,
    $Res Function(_$ReportFilterRequestImpl) then,
  ) = __$$ReportFilterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ReportDateRange dateRange,
    DateTime? startDate,
    DateTime? endDate,
    String? projectId,
    String? userId,
    TaskStatus? status,
    ProjectCategory? category,
    PriorityLevel? priority,
    int page,
    int limit,
  });
}

/// @nodoc
class __$$ReportFilterRequestImplCopyWithImpl<$Res>
    extends _$ReportFilterRequestCopyWithImpl<$Res, _$ReportFilterRequestImpl>
    implements _$$ReportFilterRequestImplCopyWith<$Res> {
  __$$ReportFilterRequestImplCopyWithImpl(
    _$ReportFilterRequestImpl _value,
    $Res Function(_$ReportFilterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? category = freezed,
    Object? priority = freezed,
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(
      _$ReportFilterRequestImpl(
        dateRange: null == dateRange
            ? _value.dateRange
            : dateRange // ignore: cast_nullable_to_non_nullable
                  as ReportDateRange,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ProjectCategory?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as PriorityLevel?,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportFilterRequestImpl implements _ReportFilterRequest {
  const _$ReportFilterRequestImpl({
    required this.dateRange,
    this.startDate,
    this.endDate,
    this.projectId,
    this.userId,
    this.status,
    this.category,
    this.priority,
    this.page = 1,
    this.limit = 50,
  });

  factory _$ReportFilterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportFilterRequestImplFromJson(json);

  @override
  final ReportDateRange dateRange;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? projectId;
  @override
  final String? userId;
  @override
  final TaskStatus? status;
  @override
  final ProjectCategory? category;
  @override
  final PriorityLevel? priority;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'ReportFilterRequest(dateRange: $dateRange, startDate: $startDate, endDate: $endDate, projectId: $projectId, userId: $userId, status: $status, category: $category, priority: $priority, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFilterRequestImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dateRange,
    startDate,
    endDate,
    projectId,
    userId,
    status,
    category,
    priority,
    page,
    limit,
  );

  /// Create a copy of ReportFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFilterRequestImplCopyWith<_$ReportFilterRequestImpl> get copyWith =>
      __$$ReportFilterRequestImplCopyWithImpl<_$ReportFilterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportFilterRequestImplToJson(this);
  }
}

abstract class _ReportFilterRequest implements ReportFilterRequest {
  const factory _ReportFilterRequest({
    required final ReportDateRange dateRange,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? projectId,
    final String? userId,
    final TaskStatus? status,
    final ProjectCategory? category,
    final PriorityLevel? priority,
    final int page,
    final int limit,
  }) = _$ReportFilterRequestImpl;

  factory _ReportFilterRequest.fromJson(Map<String, dynamic> json) =
      _$ReportFilterRequestImpl.fromJson;

  @override
  ReportDateRange get dateRange;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get projectId;
  @override
  String? get userId;
  @override
  TaskStatus? get status;
  @override
  ProjectCategory? get category;
  @override
  PriorityLevel? get priority;
  @override
  int get page;
  @override
  int get limit;

  /// Create a copy of ReportFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportFilterRequestImplCopyWith<_$ReportFilterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskReportMetrics _$TaskReportMetricsFromJson(Map<String, dynamic> json) {
  return _TaskReportMetrics.fromJson(json);
}

/// @nodoc
mixin _$TaskReportMetrics {
  int get totalTasks => throw _privateConstructorUsedError;
  int get completedTasks => throw _privateConstructorUsedError;
  int get inProgressTasks => throw _privateConstructorUsedError;
  int get overdueTasks => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  double get averageCompletionTime => throw _privateConstructorUsedError;
  double get tasksPerDay => throw _privateConstructorUsedError;
  double get hoursPerDay => throw _privateConstructorUsedError;
  double get minutesPerTask => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;

  /// Serializes this TaskReportMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskReportMetricsCopyWith<TaskReportMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskReportMetricsCopyWith<$Res> {
  factory $TaskReportMetricsCopyWith(
    TaskReportMetrics value,
    $Res Function(TaskReportMetrics) then,
  ) = _$TaskReportMetricsCopyWithImpl<$Res, TaskReportMetrics>;
  @useResult
  $Res call({
    int totalTasks,
    int completedTasks,
    int inProgressTasks,
    int overdueTasks,
    double completionRate,
    double averageCompletionTime,
    double tasksPerDay,
    double hoursPerDay,
    double minutesPerTask,
    int currentStreak,
    int longestStreak,
  });
}

/// @nodoc
class _$TaskReportMetricsCopyWithImpl<$Res, $Val extends TaskReportMetrics>
    implements $TaskReportMetricsCopyWith<$Res> {
  _$TaskReportMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTasks = null,
    Object? completedTasks = null,
    Object? inProgressTasks = null,
    Object? overdueTasks = null,
    Object? completionRate = null,
    Object? averageCompletionTime = null,
    Object? tasksPerDay = null,
    Object? hoursPerDay = null,
    Object? minutesPerTask = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
  }) {
    return _then(
      _value.copyWith(
            totalTasks: null == totalTasks
                ? _value.totalTasks
                : totalTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            completedTasks: null == completedTasks
                ? _value.completedTasks
                : completedTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            inProgressTasks: null == inProgressTasks
                ? _value.inProgressTasks
                : inProgressTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            overdueTasks: null == overdueTasks
                ? _value.overdueTasks
                : overdueTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            averageCompletionTime: null == averageCompletionTime
                ? _value.averageCompletionTime
                : averageCompletionTime // ignore: cast_nullable_to_non_nullable
                      as double,
            tasksPerDay: null == tasksPerDay
                ? _value.tasksPerDay
                : tasksPerDay // ignore: cast_nullable_to_non_nullable
                      as double,
            hoursPerDay: null == hoursPerDay
                ? _value.hoursPerDay
                : hoursPerDay // ignore: cast_nullable_to_non_nullable
                      as double,
            minutesPerTask: null == minutesPerTask
                ? _value.minutesPerTask
                : minutesPerTask // ignore: cast_nullable_to_non_nullable
                      as double,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestStreak: null == longestStreak
                ? _value.longestStreak
                : longestStreak // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskReportMetricsImplCopyWith<$Res>
    implements $TaskReportMetricsCopyWith<$Res> {
  factory _$$TaskReportMetricsImplCopyWith(
    _$TaskReportMetricsImpl value,
    $Res Function(_$TaskReportMetricsImpl) then,
  ) = __$$TaskReportMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalTasks,
    int completedTasks,
    int inProgressTasks,
    int overdueTasks,
    double completionRate,
    double averageCompletionTime,
    double tasksPerDay,
    double hoursPerDay,
    double minutesPerTask,
    int currentStreak,
    int longestStreak,
  });
}

/// @nodoc
class __$$TaskReportMetricsImplCopyWithImpl<$Res>
    extends _$TaskReportMetricsCopyWithImpl<$Res, _$TaskReportMetricsImpl>
    implements _$$TaskReportMetricsImplCopyWith<$Res> {
  __$$TaskReportMetricsImplCopyWithImpl(
    _$TaskReportMetricsImpl _value,
    $Res Function(_$TaskReportMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTasks = null,
    Object? completedTasks = null,
    Object? inProgressTasks = null,
    Object? overdueTasks = null,
    Object? completionRate = null,
    Object? averageCompletionTime = null,
    Object? tasksPerDay = null,
    Object? hoursPerDay = null,
    Object? minutesPerTask = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
  }) {
    return _then(
      _$TaskReportMetricsImpl(
        totalTasks: null == totalTasks
            ? _value.totalTasks
            : totalTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        completedTasks: null == completedTasks
            ? _value.completedTasks
            : completedTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        inProgressTasks: null == inProgressTasks
            ? _value.inProgressTasks
            : inProgressTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        overdueTasks: null == overdueTasks
            ? _value.overdueTasks
            : overdueTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        averageCompletionTime: null == averageCompletionTime
            ? _value.averageCompletionTime
            : averageCompletionTime // ignore: cast_nullable_to_non_nullable
                  as double,
        tasksPerDay: null == tasksPerDay
            ? _value.tasksPerDay
            : tasksPerDay // ignore: cast_nullable_to_non_nullable
                  as double,
        hoursPerDay: null == hoursPerDay
            ? _value.hoursPerDay
            : hoursPerDay // ignore: cast_nullable_to_non_nullable
                  as double,
        minutesPerTask: null == minutesPerTask
            ? _value.minutesPerTask
            : minutesPerTask // ignore: cast_nullable_to_non_nullable
                  as double,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestStreak: null == longestStreak
            ? _value.longestStreak
            : longestStreak // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskReportMetricsImpl implements _TaskReportMetrics {
  const _$TaskReportMetricsImpl({
    this.totalTasks = 0,
    this.completedTasks = 0,
    this.inProgressTasks = 0,
    this.overdueTasks = 0,
    this.completionRate = 0.0,
    this.averageCompletionTime = 0.0,
    this.tasksPerDay = 0.0,
    this.hoursPerDay = 0.0,
    this.minutesPerTask = 0.0,
    this.currentStreak = 0,
    this.longestStreak = 0,
  });

  factory _$TaskReportMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskReportMetricsImplFromJson(json);

  @override
  @JsonKey()
  final int totalTasks;
  @override
  @JsonKey()
  final int completedTasks;
  @override
  @JsonKey()
  final int inProgressTasks;
  @override
  @JsonKey()
  final int overdueTasks;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final double averageCompletionTime;
  @override
  @JsonKey()
  final double tasksPerDay;
  @override
  @JsonKey()
  final double hoursPerDay;
  @override
  @JsonKey()
  final double minutesPerTask;
  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int longestStreak;

  @override
  String toString() {
    return 'TaskReportMetrics(totalTasks: $totalTasks, completedTasks: $completedTasks, inProgressTasks: $inProgressTasks, overdueTasks: $overdueTasks, completionRate: $completionRate, averageCompletionTime: $averageCompletionTime, tasksPerDay: $tasksPerDay, hoursPerDay: $hoursPerDay, minutesPerTask: $minutesPerTask, currentStreak: $currentStreak, longestStreak: $longestStreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskReportMetricsImpl &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.inProgressTasks, inProgressTasks) ||
                other.inProgressTasks == inProgressTasks) &&
            (identical(other.overdueTasks, overdueTasks) ||
                other.overdueTasks == overdueTasks) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.averageCompletionTime, averageCompletionTime) ||
                other.averageCompletionTime == averageCompletionTime) &&
            (identical(other.tasksPerDay, tasksPerDay) ||
                other.tasksPerDay == tasksPerDay) &&
            (identical(other.hoursPerDay, hoursPerDay) ||
                other.hoursPerDay == hoursPerDay) &&
            (identical(other.minutesPerTask, minutesPerTask) ||
                other.minutesPerTask == minutesPerTask) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalTasks,
    completedTasks,
    inProgressTasks,
    overdueTasks,
    completionRate,
    averageCompletionTime,
    tasksPerDay,
    hoursPerDay,
    minutesPerTask,
    currentStreak,
    longestStreak,
  );

  /// Create a copy of TaskReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskReportMetricsImplCopyWith<_$TaskReportMetricsImpl> get copyWith =>
      __$$TaskReportMetricsImplCopyWithImpl<_$TaskReportMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskReportMetricsImplToJson(this);
  }
}

abstract class _TaskReportMetrics implements TaskReportMetrics {
  const factory _TaskReportMetrics({
    final int totalTasks,
    final int completedTasks,
    final int inProgressTasks,
    final int overdueTasks,
    final double completionRate,
    final double averageCompletionTime,
    final double tasksPerDay,
    final double hoursPerDay,
    final double minutesPerTask,
    final int currentStreak,
    final int longestStreak,
  }) = _$TaskReportMetricsImpl;

  factory _TaskReportMetrics.fromJson(Map<String, dynamic> json) =
      _$TaskReportMetricsImpl.fromJson;

  @override
  int get totalTasks;
  @override
  int get completedTasks;
  @override
  int get inProgressTasks;
  @override
  int get overdueTasks;
  @override
  double get completionRate;
  @override
  double get averageCompletionTime;
  @override
  double get tasksPerDay;
  @override
  double get hoursPerDay;
  @override
  double get minutesPerTask;
  @override
  int get currentStreak;
  @override
  int get longestStreak;

  /// Create a copy of TaskReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskReportMetricsImplCopyWith<_$TaskReportMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectReportMetrics _$ProjectReportMetricsFromJson(Map<String, dynamic> json) {
  return _ProjectReportMetrics.fromJson(json);
}

/// @nodoc
mixin _$ProjectReportMetrics {
  int get totalProjects => throw _privateConstructorUsedError;
  int get activeProjects => throw _privateConstructorUsedError;
  int get completedProjects => throw _privateConstructorUsedError;
  int get archivedProjects => throw _privateConstructorUsedError;
  double get averageProgress => throw _privateConstructorUsedError;
  int get projectsWithOverdue => throw _privateConstructorUsedError;

  /// Serializes this ProjectReportMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectReportMetricsCopyWith<ProjectReportMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectReportMetricsCopyWith<$Res> {
  factory $ProjectReportMetricsCopyWith(
    ProjectReportMetrics value,
    $Res Function(ProjectReportMetrics) then,
  ) = _$ProjectReportMetricsCopyWithImpl<$Res, ProjectReportMetrics>;
  @useResult
  $Res call({
    int totalProjects,
    int activeProjects,
    int completedProjects,
    int archivedProjects,
    double averageProgress,
    int projectsWithOverdue,
  });
}

/// @nodoc
class _$ProjectReportMetricsCopyWithImpl<
  $Res,
  $Val extends ProjectReportMetrics
>
    implements $ProjectReportMetricsCopyWith<$Res> {
  _$ProjectReportMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? completedProjects = null,
    Object? archivedProjects = null,
    Object? averageProgress = null,
    Object? projectsWithOverdue = null,
  }) {
    return _then(
      _value.copyWith(
            totalProjects: null == totalProjects
                ? _value.totalProjects
                : totalProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            activeProjects: null == activeProjects
                ? _value.activeProjects
                : activeProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            completedProjects: null == completedProjects
                ? _value.completedProjects
                : completedProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            archivedProjects: null == archivedProjects
                ? _value.archivedProjects
                : archivedProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            averageProgress: null == averageProgress
                ? _value.averageProgress
                : averageProgress // ignore: cast_nullable_to_non_nullable
                      as double,
            projectsWithOverdue: null == projectsWithOverdue
                ? _value.projectsWithOverdue
                : projectsWithOverdue // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectReportMetricsImplCopyWith<$Res>
    implements $ProjectReportMetricsCopyWith<$Res> {
  factory _$$ProjectReportMetricsImplCopyWith(
    _$ProjectReportMetricsImpl value,
    $Res Function(_$ProjectReportMetricsImpl) then,
  ) = __$$ProjectReportMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalProjects,
    int activeProjects,
    int completedProjects,
    int archivedProjects,
    double averageProgress,
    int projectsWithOverdue,
  });
}

/// @nodoc
class __$$ProjectReportMetricsImplCopyWithImpl<$Res>
    extends _$ProjectReportMetricsCopyWithImpl<$Res, _$ProjectReportMetricsImpl>
    implements _$$ProjectReportMetricsImplCopyWith<$Res> {
  __$$ProjectReportMetricsImplCopyWithImpl(
    _$ProjectReportMetricsImpl _value,
    $Res Function(_$ProjectReportMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? completedProjects = null,
    Object? archivedProjects = null,
    Object? averageProgress = null,
    Object? projectsWithOverdue = null,
  }) {
    return _then(
      _$ProjectReportMetricsImpl(
        totalProjects: null == totalProjects
            ? _value.totalProjects
            : totalProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        activeProjects: null == activeProjects
            ? _value.activeProjects
            : activeProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        completedProjects: null == completedProjects
            ? _value.completedProjects
            : completedProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        archivedProjects: null == archivedProjects
            ? _value.archivedProjects
            : archivedProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        averageProgress: null == averageProgress
            ? _value.averageProgress
            : averageProgress // ignore: cast_nullable_to_non_nullable
                  as double,
        projectsWithOverdue: null == projectsWithOverdue
            ? _value.projectsWithOverdue
            : projectsWithOverdue // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectReportMetricsImpl implements _ProjectReportMetrics {
  const _$ProjectReportMetricsImpl({
    this.totalProjects = 0,
    this.activeProjects = 0,
    this.completedProjects = 0,
    this.archivedProjects = 0,
    this.averageProgress = 0.0,
    this.projectsWithOverdue = 0,
  });

  factory _$ProjectReportMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectReportMetricsImplFromJson(json);

  @override
  @JsonKey()
  final int totalProjects;
  @override
  @JsonKey()
  final int activeProjects;
  @override
  @JsonKey()
  final int completedProjects;
  @override
  @JsonKey()
  final int archivedProjects;
  @override
  @JsonKey()
  final double averageProgress;
  @override
  @JsonKey()
  final int projectsWithOverdue;

  @override
  String toString() {
    return 'ProjectReportMetrics(totalProjects: $totalProjects, activeProjects: $activeProjects, completedProjects: $completedProjects, archivedProjects: $archivedProjects, averageProgress: $averageProgress, projectsWithOverdue: $projectsWithOverdue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectReportMetricsImpl &&
            (identical(other.totalProjects, totalProjects) ||
                other.totalProjects == totalProjects) &&
            (identical(other.activeProjects, activeProjects) ||
                other.activeProjects == activeProjects) &&
            (identical(other.completedProjects, completedProjects) ||
                other.completedProjects == completedProjects) &&
            (identical(other.archivedProjects, archivedProjects) ||
                other.archivedProjects == archivedProjects) &&
            (identical(other.averageProgress, averageProgress) ||
                other.averageProgress == averageProgress) &&
            (identical(other.projectsWithOverdue, projectsWithOverdue) ||
                other.projectsWithOverdue == projectsWithOverdue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalProjects,
    activeProjects,
    completedProjects,
    archivedProjects,
    averageProgress,
    projectsWithOverdue,
  );

  /// Create a copy of ProjectReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectReportMetricsImplCopyWith<_$ProjectReportMetricsImpl>
  get copyWith =>
      __$$ProjectReportMetricsImplCopyWithImpl<_$ProjectReportMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectReportMetricsImplToJson(this);
  }
}

abstract class _ProjectReportMetrics implements ProjectReportMetrics {
  const factory _ProjectReportMetrics({
    final int totalProjects,
    final int activeProjects,
    final int completedProjects,
    final int archivedProjects,
    final double averageProgress,
    final int projectsWithOverdue,
  }) = _$ProjectReportMetricsImpl;

  factory _ProjectReportMetrics.fromJson(Map<String, dynamic> json) =
      _$ProjectReportMetricsImpl.fromJson;

  @override
  int get totalProjects;
  @override
  int get activeProjects;
  @override
  int get completedProjects;
  @override
  int get archivedProjects;
  @override
  double get averageProgress;
  @override
  int get projectsWithOverdue;

  /// Create a copy of ProjectReportMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectReportMetricsImplCopyWith<_$ProjectReportMetricsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TimeDistribution _$TimeDistributionFromJson(Map<String, dynamic> json) {
  return _TimeDistribution.fromJson(json);
}

/// @nodoc
mixin _$TimeDistribution {
  String get category => throw _privateConstructorUsedError;
  int get totalMinutes => throw _privateConstructorUsedError;
  double get totalHours => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  int get taskCount => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this TimeDistribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeDistributionCopyWith<TimeDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeDistributionCopyWith<$Res> {
  factory $TimeDistributionCopyWith(
    TimeDistribution value,
    $Res Function(TimeDistribution) then,
  ) = _$TimeDistributionCopyWithImpl<$Res, TimeDistribution>;
  @useResult
  $Res call({
    String category,
    int totalMinutes,
    double totalHours,
    double percentage,
    int taskCount,
    String color,
  });
}

/// @nodoc
class _$TimeDistributionCopyWithImpl<$Res, $Val extends TimeDistribution>
    implements $TimeDistributionCopyWith<$Res> {
  _$TimeDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? totalMinutes = null,
    Object? totalHours = null,
    Object? percentage = null,
    Object? taskCount = null,
    Object? color = null,
  }) {
    return _then(
      _value.copyWith(
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            totalMinutes: null == totalMinutes
                ? _value.totalMinutes
                : totalMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            totalHours: null == totalHours
                ? _value.totalHours
                : totalHours // ignore: cast_nullable_to_non_nullable
                      as double,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
            taskCount: null == taskCount
                ? _value.taskCount
                : taskCount // ignore: cast_nullable_to_non_nullable
                      as int,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeDistributionImplCopyWith<$Res>
    implements $TimeDistributionCopyWith<$Res> {
  factory _$$TimeDistributionImplCopyWith(
    _$TimeDistributionImpl value,
    $Res Function(_$TimeDistributionImpl) then,
  ) = __$$TimeDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String category,
    int totalMinutes,
    double totalHours,
    double percentage,
    int taskCount,
    String color,
  });
}

/// @nodoc
class __$$TimeDistributionImplCopyWithImpl<$Res>
    extends _$TimeDistributionCopyWithImpl<$Res, _$TimeDistributionImpl>
    implements _$$TimeDistributionImplCopyWith<$Res> {
  __$$TimeDistributionImplCopyWithImpl(
    _$TimeDistributionImpl _value,
    $Res Function(_$TimeDistributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? totalMinutes = null,
    Object? totalHours = null,
    Object? percentage = null,
    Object? taskCount = null,
    Object? color = null,
  }) {
    return _then(
      _$TimeDistributionImpl(
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        totalMinutes: null == totalMinutes
            ? _value.totalMinutes
            : totalMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        totalHours: null == totalHours
            ? _value.totalHours
            : totalHours // ignore: cast_nullable_to_non_nullable
                  as double,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
        taskCount: null == taskCount
            ? _value.taskCount
            : taskCount // ignore: cast_nullable_to_non_nullable
                  as int,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeDistributionImpl implements _TimeDistribution {
  const _$TimeDistributionImpl({
    required this.category,
    this.totalMinutes = 0,
    this.totalHours = 0.0,
    this.percentage = 0.0,
    this.taskCount = 0,
    this.color = '#6B7280',
  });

  factory _$TimeDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeDistributionImplFromJson(json);

  @override
  final String category;
  @override
  @JsonKey()
  final int totalMinutes;
  @override
  @JsonKey()
  final double totalHours;
  @override
  @JsonKey()
  final double percentage;
  @override
  @JsonKey()
  final int taskCount;
  @override
  @JsonKey()
  final String color;

  @override
  String toString() {
    return 'TimeDistribution(category: $category, totalMinutes: $totalMinutes, totalHours: $totalHours, percentage: $percentage, taskCount: $taskCount, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeDistributionImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.totalMinutes, totalMinutes) ||
                other.totalMinutes == totalMinutes) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.taskCount, taskCount) ||
                other.taskCount == taskCount) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    category,
    totalMinutes,
    totalHours,
    percentage,
    taskCount,
    color,
  );

  /// Create a copy of TimeDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeDistributionImplCopyWith<_$TimeDistributionImpl> get copyWith =>
      __$$TimeDistributionImplCopyWithImpl<_$TimeDistributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeDistributionImplToJson(this);
  }
}

abstract class _TimeDistribution implements TimeDistribution {
  const factory _TimeDistribution({
    required final String category,
    final int totalMinutes,
    final double totalHours,
    final double percentage,
    final int taskCount,
    final String color,
  }) = _$TimeDistributionImpl;

  factory _TimeDistribution.fromJson(Map<String, dynamic> json) =
      _$TimeDistributionImpl.fromJson;

  @override
  String get category;
  @override
  int get totalMinutes;
  @override
  double get totalHours;
  @override
  double get percentage;
  @override
  int get taskCount;
  @override
  String get color;

  /// Create a copy of TimeDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeDistributionImplCopyWith<_$TimeDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyProductivity _$DailyProductivityFromJson(Map<String, dynamic> json) {
  return _DailyProductivity.fromJson(json);
}

/// @nodoc
mixin _$DailyProductivity {
  DateTime get date => throw _privateConstructorUsedError;
  int get tasksCompleted => throw _privateConstructorUsedError;
  double get hoursWorked => throw _privateConstructorUsedError;
  int get breaksTaken => throw _privateConstructorUsedError;
  int get breakMinutes => throw _privateConstructorUsedError;
  int get focusTime => throw _privateConstructorUsedError;
  double get productivityScore => throw _privateConstructorUsedError;

  /// Serializes this DailyProductivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyProductivityCopyWith<DailyProductivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyProductivityCopyWith<$Res> {
  factory $DailyProductivityCopyWith(
    DailyProductivity value,
    $Res Function(DailyProductivity) then,
  ) = _$DailyProductivityCopyWithImpl<$Res, DailyProductivity>;
  @useResult
  $Res call({
    DateTime date,
    int tasksCompleted,
    double hoursWorked,
    int breaksTaken,
    int breakMinutes,
    int focusTime,
    double productivityScore,
  });
}

/// @nodoc
class _$DailyProductivityCopyWithImpl<$Res, $Val extends DailyProductivity>
    implements $DailyProductivityCopyWith<$Res> {
  _$DailyProductivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasksCompleted = null,
    Object? hoursWorked = null,
    Object? breaksTaken = null,
    Object? breakMinutes = null,
    Object? focusTime = null,
    Object? productivityScore = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            tasksCompleted: null == tasksCompleted
                ? _value.tasksCompleted
                : tasksCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            hoursWorked: null == hoursWorked
                ? _value.hoursWorked
                : hoursWorked // ignore: cast_nullable_to_non_nullable
                      as double,
            breaksTaken: null == breaksTaken
                ? _value.breaksTaken
                : breaksTaken // ignore: cast_nullable_to_non_nullable
                      as int,
            breakMinutes: null == breakMinutes
                ? _value.breakMinutes
                : breakMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            focusTime: null == focusTime
                ? _value.focusTime
                : focusTime // ignore: cast_nullable_to_non_nullable
                      as int,
            productivityScore: null == productivityScore
                ? _value.productivityScore
                : productivityScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyProductivityImplCopyWith<$Res>
    implements $DailyProductivityCopyWith<$Res> {
  factory _$$DailyProductivityImplCopyWith(
    _$DailyProductivityImpl value,
    $Res Function(_$DailyProductivityImpl) then,
  ) = __$$DailyProductivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    int tasksCompleted,
    double hoursWorked,
    int breaksTaken,
    int breakMinutes,
    int focusTime,
    double productivityScore,
  });
}

/// @nodoc
class __$$DailyProductivityImplCopyWithImpl<$Res>
    extends _$DailyProductivityCopyWithImpl<$Res, _$DailyProductivityImpl>
    implements _$$DailyProductivityImplCopyWith<$Res> {
  __$$DailyProductivityImplCopyWithImpl(
    _$DailyProductivityImpl _value,
    $Res Function(_$DailyProductivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tasksCompleted = null,
    Object? hoursWorked = null,
    Object? breaksTaken = null,
    Object? breakMinutes = null,
    Object? focusTime = null,
    Object? productivityScore = null,
  }) {
    return _then(
      _$DailyProductivityImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        tasksCompleted: null == tasksCompleted
            ? _value.tasksCompleted
            : tasksCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        hoursWorked: null == hoursWorked
            ? _value.hoursWorked
            : hoursWorked // ignore: cast_nullable_to_non_nullable
                  as double,
        breaksTaken: null == breaksTaken
            ? _value.breaksTaken
            : breaksTaken // ignore: cast_nullable_to_non_nullable
                  as int,
        breakMinutes: null == breakMinutes
            ? _value.breakMinutes
            : breakMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        focusTime: null == focusTime
            ? _value.focusTime
            : focusTime // ignore: cast_nullable_to_non_nullable
                  as int,
        productivityScore: null == productivityScore
            ? _value.productivityScore
            : productivityScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyProductivityImpl implements _DailyProductivity {
  const _$DailyProductivityImpl({
    required this.date,
    this.tasksCompleted = 0,
    this.hoursWorked = 0.0,
    this.breaksTaken = 0,
    this.breakMinutes = 0,
    this.focusTime = 0,
    this.productivityScore = 0.0,
  });

  factory _$DailyProductivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyProductivityImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final int tasksCompleted;
  @override
  @JsonKey()
  final double hoursWorked;
  @override
  @JsonKey()
  final int breaksTaken;
  @override
  @JsonKey()
  final int breakMinutes;
  @override
  @JsonKey()
  final int focusTime;
  @override
  @JsonKey()
  final double productivityScore;

  @override
  String toString() {
    return 'DailyProductivity(date: $date, tasksCompleted: $tasksCompleted, hoursWorked: $hoursWorked, breaksTaken: $breaksTaken, breakMinutes: $breakMinutes, focusTime: $focusTime, productivityScore: $productivityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyProductivityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tasksCompleted, tasksCompleted) ||
                other.tasksCompleted == tasksCompleted) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.breaksTaken, breaksTaken) ||
                other.breaksTaken == breaksTaken) &&
            (identical(other.breakMinutes, breakMinutes) ||
                other.breakMinutes == breakMinutes) &&
            (identical(other.focusTime, focusTime) ||
                other.focusTime == focusTime) &&
            (identical(other.productivityScore, productivityScore) ||
                other.productivityScore == productivityScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    tasksCompleted,
    hoursWorked,
    breaksTaken,
    breakMinutes,
    focusTime,
    productivityScore,
  );

  /// Create a copy of DailyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyProductivityImplCopyWith<_$DailyProductivityImpl> get copyWith =>
      __$$DailyProductivityImplCopyWithImpl<_$DailyProductivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyProductivityImplToJson(this);
  }
}

abstract class _DailyProductivity implements DailyProductivity {
  const factory _DailyProductivity({
    required final DateTime date,
    final int tasksCompleted,
    final double hoursWorked,
    final int breaksTaken,
    final int breakMinutes,
    final int focusTime,
    final double productivityScore,
  }) = _$DailyProductivityImpl;

  factory _DailyProductivity.fromJson(Map<String, dynamic> json) =
      _$DailyProductivityImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get tasksCompleted;
  @override
  double get hoursWorked;
  @override
  int get breaksTaken;
  @override
  int get breakMinutes;
  @override
  int get focusTime;
  @override
  double get productivityScore;

  /// Create a copy of DailyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyProductivityImplCopyWith<_$DailyProductivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyProductivity _$HourlyProductivityFromJson(Map<String, dynamic> json) {
  return _HourlyProductivity.fromJson(json);
}

/// @nodoc
mixin _$HourlyProductivity {
  int get hour => throw _privateConstructorUsedError;
  int get tasksCompleted => throw _privateConstructorUsedError;
  int get minutesWorked => throw _privateConstructorUsedError;
  double get productivityScore => throw _privateConstructorUsedError;

  /// Serializes this HourlyProductivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyProductivityCopyWith<HourlyProductivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyProductivityCopyWith<$Res> {
  factory $HourlyProductivityCopyWith(
    HourlyProductivity value,
    $Res Function(HourlyProductivity) then,
  ) = _$HourlyProductivityCopyWithImpl<$Res, HourlyProductivity>;
  @useResult
  $Res call({
    int hour,
    int tasksCompleted,
    int minutesWorked,
    double productivityScore,
  });
}

/// @nodoc
class _$HourlyProductivityCopyWithImpl<$Res, $Val extends HourlyProductivity>
    implements $HourlyProductivityCopyWith<$Res> {
  _$HourlyProductivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? tasksCompleted = null,
    Object? minutesWorked = null,
    Object? productivityScore = null,
  }) {
    return _then(
      _value.copyWith(
            hour: null == hour
                ? _value.hour
                : hour // ignore: cast_nullable_to_non_nullable
                      as int,
            tasksCompleted: null == tasksCompleted
                ? _value.tasksCompleted
                : tasksCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            minutesWorked: null == minutesWorked
                ? _value.minutesWorked
                : minutesWorked // ignore: cast_nullable_to_non_nullable
                      as int,
            productivityScore: null == productivityScore
                ? _value.productivityScore
                : productivityScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HourlyProductivityImplCopyWith<$Res>
    implements $HourlyProductivityCopyWith<$Res> {
  factory _$$HourlyProductivityImplCopyWith(
    _$HourlyProductivityImpl value,
    $Res Function(_$HourlyProductivityImpl) then,
  ) = __$$HourlyProductivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int hour,
    int tasksCompleted,
    int minutesWorked,
    double productivityScore,
  });
}

/// @nodoc
class __$$HourlyProductivityImplCopyWithImpl<$Res>
    extends _$HourlyProductivityCopyWithImpl<$Res, _$HourlyProductivityImpl>
    implements _$$HourlyProductivityImplCopyWith<$Res> {
  __$$HourlyProductivityImplCopyWithImpl(
    _$HourlyProductivityImpl _value,
    $Res Function(_$HourlyProductivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? tasksCompleted = null,
    Object? minutesWorked = null,
    Object? productivityScore = null,
  }) {
    return _then(
      _$HourlyProductivityImpl(
        hour: null == hour
            ? _value.hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as int,
        tasksCompleted: null == tasksCompleted
            ? _value.tasksCompleted
            : tasksCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        minutesWorked: null == minutesWorked
            ? _value.minutesWorked
            : minutesWorked // ignore: cast_nullable_to_non_nullable
                  as int,
        productivityScore: null == productivityScore
            ? _value.productivityScore
            : productivityScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyProductivityImpl implements _HourlyProductivity {
  const _$HourlyProductivityImpl({
    required this.hour,
    this.tasksCompleted = 0,
    this.minutesWorked = 0,
    this.productivityScore = 0.0,
  });

  factory _$HourlyProductivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyProductivityImplFromJson(json);

  @override
  final int hour;
  @override
  @JsonKey()
  final int tasksCompleted;
  @override
  @JsonKey()
  final int minutesWorked;
  @override
  @JsonKey()
  final double productivityScore;

  @override
  String toString() {
    return 'HourlyProductivity(hour: $hour, tasksCompleted: $tasksCompleted, minutesWorked: $minutesWorked, productivityScore: $productivityScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyProductivityImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.tasksCompleted, tasksCompleted) ||
                other.tasksCompleted == tasksCompleted) &&
            (identical(other.minutesWorked, minutesWorked) ||
                other.minutesWorked == minutesWorked) &&
            (identical(other.productivityScore, productivityScore) ||
                other.productivityScore == productivityScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hour,
    tasksCompleted,
    minutesWorked,
    productivityScore,
  );

  /// Create a copy of HourlyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyProductivityImplCopyWith<_$HourlyProductivityImpl> get copyWith =>
      __$$HourlyProductivityImplCopyWithImpl<_$HourlyProductivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyProductivityImplToJson(this);
  }
}

abstract class _HourlyProductivity implements HourlyProductivity {
  const factory _HourlyProductivity({
    required final int hour,
    final int tasksCompleted,
    final int minutesWorked,
    final double productivityScore,
  }) = _$HourlyProductivityImpl;

  factory _HourlyProductivity.fromJson(Map<String, dynamic> json) =
      _$HourlyProductivityImpl.fromJson;

  @override
  int get hour;
  @override
  int get tasksCompleted;
  @override
  int get minutesWorked;
  @override
  double get productivityScore;

  /// Create a copy of HourlyProductivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyProductivityImplCopyWith<_$HourlyProductivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TasksByStatus _$TasksByStatusFromJson(Map<String, dynamic> json) {
  return _TasksByStatus.fromJson(json);
}

/// @nodoc
mixin _$TasksByStatus {
  TaskStatus get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this TasksByStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TasksByStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksByStatusCopyWith<TasksByStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksByStatusCopyWith<$Res> {
  factory $TasksByStatusCopyWith(
    TasksByStatus value,
    $Res Function(TasksByStatus) then,
  ) = _$TasksByStatusCopyWithImpl<$Res, TasksByStatus>;
  @useResult
  $Res call({TaskStatus status, int count, double percentage});
}

/// @nodoc
class _$TasksByStatusCopyWithImpl<$Res, $Val extends TasksByStatus>
    implements $TasksByStatusCopyWith<$Res> {
  _$TasksByStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksByStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TasksByStatusImplCopyWith<$Res>
    implements $TasksByStatusCopyWith<$Res> {
  factory _$$TasksByStatusImplCopyWith(
    _$TasksByStatusImpl value,
    $Res Function(_$TasksByStatusImpl) then,
  ) = __$$TasksByStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaskStatus status, int count, double percentage});
}

/// @nodoc
class __$$TasksByStatusImplCopyWithImpl<$Res>
    extends _$TasksByStatusCopyWithImpl<$Res, _$TasksByStatusImpl>
    implements _$$TasksByStatusImplCopyWith<$Res> {
  __$$TasksByStatusImplCopyWithImpl(
    _$TasksByStatusImpl _value,
    $Res Function(_$TasksByStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TasksByStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(
      _$TasksByStatusImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksByStatusImpl implements _TasksByStatus {
  const _$TasksByStatusImpl({
    required this.status,
    this.count = 0,
    this.percentage = 0.0,
  });

  factory _$TasksByStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksByStatusImplFromJson(json);

  @override
  final TaskStatus status;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double percentage;

  @override
  String toString() {
    return 'TasksByStatus(status: $status, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksByStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, count, percentage);

  /// Create a copy of TasksByStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksByStatusImplCopyWith<_$TasksByStatusImpl> get copyWith =>
      __$$TasksByStatusImplCopyWithImpl<_$TasksByStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksByStatusImplToJson(this);
  }
}

abstract class _TasksByStatus implements TasksByStatus {
  const factory _TasksByStatus({
    required final TaskStatus status,
    final int count,
    final double percentage,
  }) = _$TasksByStatusImpl;

  factory _TasksByStatus.fromJson(Map<String, dynamic> json) =
      _$TasksByStatusImpl.fromJson;

  @override
  TaskStatus get status;
  @override
  int get count;
  @override
  double get percentage;

  /// Create a copy of TasksByStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksByStatusImplCopyWith<_$TasksByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TasksByPriority _$TasksByPriorityFromJson(Map<String, dynamic> json) {
  return _TasksByPriority.fromJson(json);
}

/// @nodoc
mixin _$TasksByPriority {
  PriorityLevel get priority => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this TasksByPriority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TasksByPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksByPriorityCopyWith<TasksByPriority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksByPriorityCopyWith<$Res> {
  factory $TasksByPriorityCopyWith(
    TasksByPriority value,
    $Res Function(TasksByPriority) then,
  ) = _$TasksByPriorityCopyWithImpl<$Res, TasksByPriority>;
  @useResult
  $Res call({PriorityLevel priority, int count, double percentage});
}

/// @nodoc
class _$TasksByPriorityCopyWithImpl<$Res, $Val extends TasksByPriority>
    implements $TasksByPriorityCopyWith<$Res> {
  _$TasksByPriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksByPriority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priority = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as PriorityLevel,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TasksByPriorityImplCopyWith<$Res>
    implements $TasksByPriorityCopyWith<$Res> {
  factory _$$TasksByPriorityImplCopyWith(
    _$TasksByPriorityImpl value,
    $Res Function(_$TasksByPriorityImpl) then,
  ) = __$$TasksByPriorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PriorityLevel priority, int count, double percentage});
}

/// @nodoc
class __$$TasksByPriorityImplCopyWithImpl<$Res>
    extends _$TasksByPriorityCopyWithImpl<$Res, _$TasksByPriorityImpl>
    implements _$$TasksByPriorityImplCopyWith<$Res> {
  __$$TasksByPriorityImplCopyWithImpl(
    _$TasksByPriorityImpl _value,
    $Res Function(_$TasksByPriorityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TasksByPriority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priority = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(
      _$TasksByPriorityImpl(
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as PriorityLevel,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksByPriorityImpl implements _TasksByPriority {
  const _$TasksByPriorityImpl({
    required this.priority,
    this.count = 0,
    this.percentage = 0.0,
  });

  factory _$TasksByPriorityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksByPriorityImplFromJson(json);

  @override
  final PriorityLevel priority;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double percentage;

  @override
  String toString() {
    return 'TasksByPriority(priority: $priority, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksByPriorityImpl &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, priority, count, percentage);

  /// Create a copy of TasksByPriority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksByPriorityImplCopyWith<_$TasksByPriorityImpl> get copyWith =>
      __$$TasksByPriorityImplCopyWithImpl<_$TasksByPriorityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksByPriorityImplToJson(this);
  }
}

abstract class _TasksByPriority implements TasksByPriority {
  const factory _TasksByPriority({
    required final PriorityLevel priority,
    final int count,
    final double percentage,
  }) = _$TasksByPriorityImpl;

  factory _TasksByPriority.fromJson(Map<String, dynamic> json) =
      _$TasksByPriorityImpl.fromJson;

  @override
  PriorityLevel get priority;
  @override
  int get count;
  @override
  double get percentage;

  /// Create a copy of TasksByPriority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksByPriorityImplCopyWith<_$TasksByPriorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductivityInsights _$ProductivityInsightsFromJson(Map<String, dynamic> json) {
  return _ProductivityInsights.fromJson(json);
}

/// @nodoc
mixin _$ProductivityInsights {
  int get mostProductiveHour => throw _privateConstructorUsedError;
  String get mostProductiveDay => throw _privateConstructorUsedError;
  String get mostProductiveMonth => throw _privateConstructorUsedError;
  String get bestPerformingCategory => throw _privateConstructorUsedError;
  double get averageSessionLength => throw _privateConstructorUsedError;
  int get optimalBreakFrequency => throw _privateConstructorUsedError;

  /// Serializes this ProductivityInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductivityInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductivityInsightsCopyWith<ProductivityInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductivityInsightsCopyWith<$Res> {
  factory $ProductivityInsightsCopyWith(
    ProductivityInsights value,
    $Res Function(ProductivityInsights) then,
  ) = _$ProductivityInsightsCopyWithImpl<$Res, ProductivityInsights>;
  @useResult
  $Res call({
    int mostProductiveHour,
    String mostProductiveDay,
    String mostProductiveMonth,
    String bestPerformingCategory,
    double averageSessionLength,
    int optimalBreakFrequency,
  });
}

/// @nodoc
class _$ProductivityInsightsCopyWithImpl<
  $Res,
  $Val extends ProductivityInsights
>
    implements $ProductivityInsightsCopyWith<$Res> {
  _$ProductivityInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductivityInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostProductiveHour = null,
    Object? mostProductiveDay = null,
    Object? mostProductiveMonth = null,
    Object? bestPerformingCategory = null,
    Object? averageSessionLength = null,
    Object? optimalBreakFrequency = null,
  }) {
    return _then(
      _value.copyWith(
            mostProductiveHour: null == mostProductiveHour
                ? _value.mostProductiveHour
                : mostProductiveHour // ignore: cast_nullable_to_non_nullable
                      as int,
            mostProductiveDay: null == mostProductiveDay
                ? _value.mostProductiveDay
                : mostProductiveDay // ignore: cast_nullable_to_non_nullable
                      as String,
            mostProductiveMonth: null == mostProductiveMonth
                ? _value.mostProductiveMonth
                : mostProductiveMonth // ignore: cast_nullable_to_non_nullable
                      as String,
            bestPerformingCategory: null == bestPerformingCategory
                ? _value.bestPerformingCategory
                : bestPerformingCategory // ignore: cast_nullable_to_non_nullable
                      as String,
            averageSessionLength: null == averageSessionLength
                ? _value.averageSessionLength
                : averageSessionLength // ignore: cast_nullable_to_non_nullable
                      as double,
            optimalBreakFrequency: null == optimalBreakFrequency
                ? _value.optimalBreakFrequency
                : optimalBreakFrequency // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductivityInsightsImplCopyWith<$Res>
    implements $ProductivityInsightsCopyWith<$Res> {
  factory _$$ProductivityInsightsImplCopyWith(
    _$ProductivityInsightsImpl value,
    $Res Function(_$ProductivityInsightsImpl) then,
  ) = __$$ProductivityInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int mostProductiveHour,
    String mostProductiveDay,
    String mostProductiveMonth,
    String bestPerformingCategory,
    double averageSessionLength,
    int optimalBreakFrequency,
  });
}

/// @nodoc
class __$$ProductivityInsightsImplCopyWithImpl<$Res>
    extends _$ProductivityInsightsCopyWithImpl<$Res, _$ProductivityInsightsImpl>
    implements _$$ProductivityInsightsImplCopyWith<$Res> {
  __$$ProductivityInsightsImplCopyWithImpl(
    _$ProductivityInsightsImpl _value,
    $Res Function(_$ProductivityInsightsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductivityInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostProductiveHour = null,
    Object? mostProductiveDay = null,
    Object? mostProductiveMonth = null,
    Object? bestPerformingCategory = null,
    Object? averageSessionLength = null,
    Object? optimalBreakFrequency = null,
  }) {
    return _then(
      _$ProductivityInsightsImpl(
        mostProductiveHour: null == mostProductiveHour
            ? _value.mostProductiveHour
            : mostProductiveHour // ignore: cast_nullable_to_non_nullable
                  as int,
        mostProductiveDay: null == mostProductiveDay
            ? _value.mostProductiveDay
            : mostProductiveDay // ignore: cast_nullable_to_non_nullable
                  as String,
        mostProductiveMonth: null == mostProductiveMonth
            ? _value.mostProductiveMonth
            : mostProductiveMonth // ignore: cast_nullable_to_non_nullable
                  as String,
        bestPerformingCategory: null == bestPerformingCategory
            ? _value.bestPerformingCategory
            : bestPerformingCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        averageSessionLength: null == averageSessionLength
            ? _value.averageSessionLength
            : averageSessionLength // ignore: cast_nullable_to_non_nullable
                  as double,
        optimalBreakFrequency: null == optimalBreakFrequency
            ? _value.optimalBreakFrequency
            : optimalBreakFrequency // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductivityInsightsImpl implements _ProductivityInsights {
  const _$ProductivityInsightsImpl({
    this.mostProductiveHour = 9,
    this.mostProductiveDay = 'Monday',
    this.mostProductiveMonth = 'January',
    this.bestPerformingCategory = 'work',
    this.averageSessionLength = 0.0,
    this.optimalBreakFrequency = 60,
  });

  factory _$ProductivityInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductivityInsightsImplFromJson(json);

  @override
  @JsonKey()
  final int mostProductiveHour;
  @override
  @JsonKey()
  final String mostProductiveDay;
  @override
  @JsonKey()
  final String mostProductiveMonth;
  @override
  @JsonKey()
  final String bestPerformingCategory;
  @override
  @JsonKey()
  final double averageSessionLength;
  @override
  @JsonKey()
  final int optimalBreakFrequency;

  @override
  String toString() {
    return 'ProductivityInsights(mostProductiveHour: $mostProductiveHour, mostProductiveDay: $mostProductiveDay, mostProductiveMonth: $mostProductiveMonth, bestPerformingCategory: $bestPerformingCategory, averageSessionLength: $averageSessionLength, optimalBreakFrequency: $optimalBreakFrequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductivityInsightsImpl &&
            (identical(other.mostProductiveHour, mostProductiveHour) ||
                other.mostProductiveHour == mostProductiveHour) &&
            (identical(other.mostProductiveDay, mostProductiveDay) ||
                other.mostProductiveDay == mostProductiveDay) &&
            (identical(other.mostProductiveMonth, mostProductiveMonth) ||
                other.mostProductiveMonth == mostProductiveMonth) &&
            (identical(other.bestPerformingCategory, bestPerformingCategory) ||
                other.bestPerformingCategory == bestPerformingCategory) &&
            (identical(other.averageSessionLength, averageSessionLength) ||
                other.averageSessionLength == averageSessionLength) &&
            (identical(other.optimalBreakFrequency, optimalBreakFrequency) ||
                other.optimalBreakFrequency == optimalBreakFrequency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mostProductiveHour,
    mostProductiveDay,
    mostProductiveMonth,
    bestPerformingCategory,
    averageSessionLength,
    optimalBreakFrequency,
  );

  /// Create a copy of ProductivityInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductivityInsightsImplCopyWith<_$ProductivityInsightsImpl>
  get copyWith =>
      __$$ProductivityInsightsImplCopyWithImpl<_$ProductivityInsightsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductivityInsightsImplToJson(this);
  }
}

abstract class _ProductivityInsights implements ProductivityInsights {
  const factory _ProductivityInsights({
    final int mostProductiveHour,
    final String mostProductiveDay,
    final String mostProductiveMonth,
    final String bestPerformingCategory,
    final double averageSessionLength,
    final int optimalBreakFrequency,
  }) = _$ProductivityInsightsImpl;

  factory _ProductivityInsights.fromJson(Map<String, dynamic> json) =
      _$ProductivityInsightsImpl.fromJson;

  @override
  int get mostProductiveHour;
  @override
  String get mostProductiveDay;
  @override
  String get mostProductiveMonth;
  @override
  String get bestPerformingCategory;
  @override
  double get averageSessionLength;
  @override
  int get optimalBreakFrequency;

  /// Create a copy of ProductivityInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductivityInsightsImplCopyWith<_$ProductivityInsightsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReportTask _$ReportTaskFromJson(Map<String, dynamic> json) {
  return _ReportTask.fromJson(json);
}

/// @nodoc
mixin _$ReportTask {
  String get id => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  PriorityLevel get priority => throw _privateConstructorUsedError;
  String get projectTitle => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  int? get estimatedTime => throw _privateConstructorUsedError;
  int get actualTime => throw _privateConstructorUsedError;
  int? get difficultyRating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  bool get isOverdue => throw _privateConstructorUsedError;

  /// Serializes this ReportTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportTaskCopyWith<ReportTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTaskCopyWith<$Res> {
  factory $ReportTaskCopyWith(
    ReportTask value,
    $Res Function(ReportTask) then,
  ) = _$ReportTaskCopyWithImpl<$Res, ReportTask>;
  @useResult
  $Res call({
    String id,
    String taskName,
    TaskStatus status,
    PriorityLevel priority,
    String projectTitle,
    DateTime? completedAt,
    int? estimatedTime,
    int actualTime,
    int? difficultyRating,
    DateTime createdAt,
    DateTime? dueDate,
    bool isOverdue,
  });
}

/// @nodoc
class _$ReportTaskCopyWithImpl<$Res, $Val extends ReportTask>
    implements $ReportTaskCopyWith<$Res> {
  _$ReportTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskName = null,
    Object? status = null,
    Object? priority = null,
    Object? projectTitle = null,
    Object? completedAt = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = null,
    Object? difficultyRating = freezed,
    Object? createdAt = null,
    Object? dueDate = freezed,
    Object? isOverdue = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            taskName: null == taskName
                ? _value.taskName
                : taskName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as PriorityLevel,
            projectTitle: null == projectTitle
                ? _value.projectTitle
                : projectTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            estimatedTime: freezed == estimatedTime
                ? _value.estimatedTime
                : estimatedTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            actualTime: null == actualTime
                ? _value.actualTime
                : actualTime // ignore: cast_nullable_to_non_nullable
                      as int,
            difficultyRating: freezed == difficultyRating
                ? _value.difficultyRating
                : difficultyRating // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isOverdue: null == isOverdue
                ? _value.isOverdue
                : isOverdue // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportTaskImplCopyWith<$Res>
    implements $ReportTaskCopyWith<$Res> {
  factory _$$ReportTaskImplCopyWith(
    _$ReportTaskImpl value,
    $Res Function(_$ReportTaskImpl) then,
  ) = __$$ReportTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String taskName,
    TaskStatus status,
    PriorityLevel priority,
    String projectTitle,
    DateTime? completedAt,
    int? estimatedTime,
    int actualTime,
    int? difficultyRating,
    DateTime createdAt,
    DateTime? dueDate,
    bool isOverdue,
  });
}

/// @nodoc
class __$$ReportTaskImplCopyWithImpl<$Res>
    extends _$ReportTaskCopyWithImpl<$Res, _$ReportTaskImpl>
    implements _$$ReportTaskImplCopyWith<$Res> {
  __$$ReportTaskImplCopyWithImpl(
    _$ReportTaskImpl _value,
    $Res Function(_$ReportTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskName = null,
    Object? status = null,
    Object? priority = null,
    Object? projectTitle = null,
    Object? completedAt = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = null,
    Object? difficultyRating = freezed,
    Object? createdAt = null,
    Object? dueDate = freezed,
    Object? isOverdue = null,
  }) {
    return _then(
      _$ReportTaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        taskName: null == taskName
            ? _value.taskName
            : taskName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as PriorityLevel,
        projectTitle: null == projectTitle
            ? _value.projectTitle
            : projectTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        estimatedTime: freezed == estimatedTime
            ? _value.estimatedTime
            : estimatedTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        actualTime: null == actualTime
            ? _value.actualTime
            : actualTime // ignore: cast_nullable_to_non_nullable
                  as int,
        difficultyRating: freezed == difficultyRating
            ? _value.difficultyRating
            : difficultyRating // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isOverdue: null == isOverdue
            ? _value.isOverdue
            : isOverdue // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportTaskImpl implements _ReportTask {
  const _$ReportTaskImpl({
    required this.id,
    required this.taskName,
    required this.status,
    required this.priority,
    required this.projectTitle,
    this.completedAt,
    this.estimatedTime,
    this.actualTime = 0,
    this.difficultyRating,
    required this.createdAt,
    this.dueDate,
    this.isOverdue = false,
  });

  factory _$ReportTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String taskName;
  @override
  final TaskStatus status;
  @override
  final PriorityLevel priority;
  @override
  final String projectTitle;
  @override
  final DateTime? completedAt;
  @override
  final int? estimatedTime;
  @override
  @JsonKey()
  final int actualTime;
  @override
  final int? difficultyRating;
  @override
  final DateTime createdAt;
  @override
  final DateTime? dueDate;
  @override
  @JsonKey()
  final bool isOverdue;

  @override
  String toString() {
    return 'ReportTask(id: $id, taskName: $taskName, status: $status, priority: $priority, projectTitle: $projectTitle, completedAt: $completedAt, estimatedTime: $estimatedTime, actualTime: $actualTime, difficultyRating: $difficultyRating, createdAt: $createdAt, dueDate: $dueDate, isOverdue: $isOverdue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.projectTitle, projectTitle) ||
                other.projectTitle == projectTitle) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.difficultyRating, difficultyRating) ||
                other.difficultyRating == difficultyRating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.isOverdue, isOverdue) ||
                other.isOverdue == isOverdue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    taskName,
    status,
    priority,
    projectTitle,
    completedAt,
    estimatedTime,
    actualTime,
    difficultyRating,
    createdAt,
    dueDate,
    isOverdue,
  );

  /// Create a copy of ReportTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTaskImplCopyWith<_$ReportTaskImpl> get copyWith =>
      __$$ReportTaskImplCopyWithImpl<_$ReportTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportTaskImplToJson(this);
  }
}

abstract class _ReportTask implements ReportTask {
  const factory _ReportTask({
    required final String id,
    required final String taskName,
    required final TaskStatus status,
    required final PriorityLevel priority,
    required final String projectTitle,
    final DateTime? completedAt,
    final int? estimatedTime,
    final int actualTime,
    final int? difficultyRating,
    required final DateTime createdAt,
    final DateTime? dueDate,
    final bool isOverdue,
  }) = _$ReportTaskImpl;

  factory _ReportTask.fromJson(Map<String, dynamic> json) =
      _$ReportTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get taskName;
  @override
  TaskStatus get status;
  @override
  PriorityLevel get priority;
  @override
  String get projectTitle;
  @override
  DateTime? get completedAt;
  @override
  int? get estimatedTime;
  @override
  int get actualTime;
  @override
  int? get difficultyRating;
  @override
  DateTime get createdAt;
  @override
  DateTime? get dueDate;
  @override
  bool get isOverdue;

  /// Create a copy of ReportTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportTaskImplCopyWith<_$ReportTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportsOverview _$ReportsOverviewFromJson(Map<String, dynamic> json) {
  return _ReportsOverview.fromJson(json);
}

/// @nodoc
mixin _$ReportsOverview {
  TaskReportMetrics? get taskMetrics => throw _privateConstructorUsedError;
  ProjectReportMetrics? get projectMetrics =>
      throw _privateConstructorUsedError;
  List<TimeDistribution> get timeDistribution =>
      throw _privateConstructorUsedError;
  List<DailyProductivity> get dailyProductivity =>
      throw _privateConstructorUsedError;
  List<HourlyProductivity> get hourlyProductivity =>
      throw _privateConstructorUsedError;
  List<TasksByStatus> get tasksByStatus => throw _privateConstructorUsedError;
  List<TasksByPriority> get tasksByPriority =>
      throw _privateConstructorUsedError;
  ProductivityInsights? get productivityInsights =>
      throw _privateConstructorUsedError;
  List<ReportTask> get recentTasks => throw _privateConstructorUsedError;
  List<ReportTask> get upcomingDeadlines => throw _privateConstructorUsedError;

  /// Serializes this ReportsOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportsOverviewCopyWith<ReportsOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsOverviewCopyWith<$Res> {
  factory $ReportsOverviewCopyWith(
    ReportsOverview value,
    $Res Function(ReportsOverview) then,
  ) = _$ReportsOverviewCopyWithImpl<$Res, ReportsOverview>;
  @useResult
  $Res call({
    TaskReportMetrics? taskMetrics,
    ProjectReportMetrics? projectMetrics,
    List<TimeDistribution> timeDistribution,
    List<DailyProductivity> dailyProductivity,
    List<HourlyProductivity> hourlyProductivity,
    List<TasksByStatus> tasksByStatus,
    List<TasksByPriority> tasksByPriority,
    ProductivityInsights? productivityInsights,
    List<ReportTask> recentTasks,
    List<ReportTask> upcomingDeadlines,
  });

  $TaskReportMetricsCopyWith<$Res>? get taskMetrics;
  $ProjectReportMetricsCopyWith<$Res>? get projectMetrics;
  $ProductivityInsightsCopyWith<$Res>? get productivityInsights;
}

/// @nodoc
class _$ReportsOverviewCopyWithImpl<$Res, $Val extends ReportsOverview>
    implements $ReportsOverviewCopyWith<$Res> {
  _$ReportsOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskMetrics = freezed,
    Object? projectMetrics = freezed,
    Object? timeDistribution = null,
    Object? dailyProductivity = null,
    Object? hourlyProductivity = null,
    Object? tasksByStatus = null,
    Object? tasksByPriority = null,
    Object? productivityInsights = freezed,
    Object? recentTasks = null,
    Object? upcomingDeadlines = null,
  }) {
    return _then(
      _value.copyWith(
            taskMetrics: freezed == taskMetrics
                ? _value.taskMetrics
                : taskMetrics // ignore: cast_nullable_to_non_nullable
                      as TaskReportMetrics?,
            projectMetrics: freezed == projectMetrics
                ? _value.projectMetrics
                : projectMetrics // ignore: cast_nullable_to_non_nullable
                      as ProjectReportMetrics?,
            timeDistribution: null == timeDistribution
                ? _value.timeDistribution
                : timeDistribution // ignore: cast_nullable_to_non_nullable
                      as List<TimeDistribution>,
            dailyProductivity: null == dailyProductivity
                ? _value.dailyProductivity
                : dailyProductivity // ignore: cast_nullable_to_non_nullable
                      as List<DailyProductivity>,
            hourlyProductivity: null == hourlyProductivity
                ? _value.hourlyProductivity
                : hourlyProductivity // ignore: cast_nullable_to_non_nullable
                      as List<HourlyProductivity>,
            tasksByStatus: null == tasksByStatus
                ? _value.tasksByStatus
                : tasksByStatus // ignore: cast_nullable_to_non_nullable
                      as List<TasksByStatus>,
            tasksByPriority: null == tasksByPriority
                ? _value.tasksByPriority
                : tasksByPriority // ignore: cast_nullable_to_non_nullable
                      as List<TasksByPriority>,
            productivityInsights: freezed == productivityInsights
                ? _value.productivityInsights
                : productivityInsights // ignore: cast_nullable_to_non_nullable
                      as ProductivityInsights?,
            recentTasks: null == recentTasks
                ? _value.recentTasks
                : recentTasks // ignore: cast_nullable_to_non_nullable
                      as List<ReportTask>,
            upcomingDeadlines: null == upcomingDeadlines
                ? _value.upcomingDeadlines
                : upcomingDeadlines // ignore: cast_nullable_to_non_nullable
                      as List<ReportTask>,
          )
          as $Val,
    );
  }

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskReportMetricsCopyWith<$Res>? get taskMetrics {
    if (_value.taskMetrics == null) {
      return null;
    }

    return $TaskReportMetricsCopyWith<$Res>(_value.taskMetrics!, (value) {
      return _then(_value.copyWith(taskMetrics: value) as $Val);
    });
  }

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectReportMetricsCopyWith<$Res>? get projectMetrics {
    if (_value.projectMetrics == null) {
      return null;
    }

    return $ProjectReportMetricsCopyWith<$Res>(_value.projectMetrics!, (value) {
      return _then(_value.copyWith(projectMetrics: value) as $Val);
    });
  }

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductivityInsightsCopyWith<$Res>? get productivityInsights {
    if (_value.productivityInsights == null) {
      return null;
    }

    return $ProductivityInsightsCopyWith<$Res>(_value.productivityInsights!, (
      value,
    ) {
      return _then(_value.copyWith(productivityInsights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportsOverviewImplCopyWith<$Res>
    implements $ReportsOverviewCopyWith<$Res> {
  factory _$$ReportsOverviewImplCopyWith(
    _$ReportsOverviewImpl value,
    $Res Function(_$ReportsOverviewImpl) then,
  ) = __$$ReportsOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TaskReportMetrics? taskMetrics,
    ProjectReportMetrics? projectMetrics,
    List<TimeDistribution> timeDistribution,
    List<DailyProductivity> dailyProductivity,
    List<HourlyProductivity> hourlyProductivity,
    List<TasksByStatus> tasksByStatus,
    List<TasksByPriority> tasksByPriority,
    ProductivityInsights? productivityInsights,
    List<ReportTask> recentTasks,
    List<ReportTask> upcomingDeadlines,
  });

  @override
  $TaskReportMetricsCopyWith<$Res>? get taskMetrics;
  @override
  $ProjectReportMetricsCopyWith<$Res>? get projectMetrics;
  @override
  $ProductivityInsightsCopyWith<$Res>? get productivityInsights;
}

/// @nodoc
class __$$ReportsOverviewImplCopyWithImpl<$Res>
    extends _$ReportsOverviewCopyWithImpl<$Res, _$ReportsOverviewImpl>
    implements _$$ReportsOverviewImplCopyWith<$Res> {
  __$$ReportsOverviewImplCopyWithImpl(
    _$ReportsOverviewImpl _value,
    $Res Function(_$ReportsOverviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskMetrics = freezed,
    Object? projectMetrics = freezed,
    Object? timeDistribution = null,
    Object? dailyProductivity = null,
    Object? hourlyProductivity = null,
    Object? tasksByStatus = null,
    Object? tasksByPriority = null,
    Object? productivityInsights = freezed,
    Object? recentTasks = null,
    Object? upcomingDeadlines = null,
  }) {
    return _then(
      _$ReportsOverviewImpl(
        taskMetrics: freezed == taskMetrics
            ? _value.taskMetrics
            : taskMetrics // ignore: cast_nullable_to_non_nullable
                  as TaskReportMetrics?,
        projectMetrics: freezed == projectMetrics
            ? _value.projectMetrics
            : projectMetrics // ignore: cast_nullable_to_non_nullable
                  as ProjectReportMetrics?,
        timeDistribution: null == timeDistribution
            ? _value._timeDistribution
            : timeDistribution // ignore: cast_nullable_to_non_nullable
                  as List<TimeDistribution>,
        dailyProductivity: null == dailyProductivity
            ? _value._dailyProductivity
            : dailyProductivity // ignore: cast_nullable_to_non_nullable
                  as List<DailyProductivity>,
        hourlyProductivity: null == hourlyProductivity
            ? _value._hourlyProductivity
            : hourlyProductivity // ignore: cast_nullable_to_non_nullable
                  as List<HourlyProductivity>,
        tasksByStatus: null == tasksByStatus
            ? _value._tasksByStatus
            : tasksByStatus // ignore: cast_nullable_to_non_nullable
                  as List<TasksByStatus>,
        tasksByPriority: null == tasksByPriority
            ? _value._tasksByPriority
            : tasksByPriority // ignore: cast_nullable_to_non_nullable
                  as List<TasksByPriority>,
        productivityInsights: freezed == productivityInsights
            ? _value.productivityInsights
            : productivityInsights // ignore: cast_nullable_to_non_nullable
                  as ProductivityInsights?,
        recentTasks: null == recentTasks
            ? _value._recentTasks
            : recentTasks // ignore: cast_nullable_to_non_nullable
                  as List<ReportTask>,
        upcomingDeadlines: null == upcomingDeadlines
            ? _value._upcomingDeadlines
            : upcomingDeadlines // ignore: cast_nullable_to_non_nullable
                  as List<ReportTask>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportsOverviewImpl implements _ReportsOverview {
  const _$ReportsOverviewImpl({
    this.taskMetrics,
    this.projectMetrics,
    final List<TimeDistribution> timeDistribution = const [],
    final List<DailyProductivity> dailyProductivity = const [],
    final List<HourlyProductivity> hourlyProductivity = const [],
    final List<TasksByStatus> tasksByStatus = const [],
    final List<TasksByPriority> tasksByPriority = const [],
    this.productivityInsights,
    final List<ReportTask> recentTasks = const [],
    final List<ReportTask> upcomingDeadlines = const [],
  }) : _timeDistribution = timeDistribution,
       _dailyProductivity = dailyProductivity,
       _hourlyProductivity = hourlyProductivity,
       _tasksByStatus = tasksByStatus,
       _tasksByPriority = tasksByPriority,
       _recentTasks = recentTasks,
       _upcomingDeadlines = upcomingDeadlines;

  factory _$ReportsOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportsOverviewImplFromJson(json);

  @override
  final TaskReportMetrics? taskMetrics;
  @override
  final ProjectReportMetrics? projectMetrics;
  final List<TimeDistribution> _timeDistribution;
  @override
  @JsonKey()
  List<TimeDistribution> get timeDistribution {
    if (_timeDistribution is EqualUnmodifiableListView)
      return _timeDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeDistribution);
  }

  final List<DailyProductivity> _dailyProductivity;
  @override
  @JsonKey()
  List<DailyProductivity> get dailyProductivity {
    if (_dailyProductivity is EqualUnmodifiableListView)
      return _dailyProductivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyProductivity);
  }

  final List<HourlyProductivity> _hourlyProductivity;
  @override
  @JsonKey()
  List<HourlyProductivity> get hourlyProductivity {
    if (_hourlyProductivity is EqualUnmodifiableListView)
      return _hourlyProductivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyProductivity);
  }

  final List<TasksByStatus> _tasksByStatus;
  @override
  @JsonKey()
  List<TasksByStatus> get tasksByStatus {
    if (_tasksByStatus is EqualUnmodifiableListView) return _tasksByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasksByStatus);
  }

  final List<TasksByPriority> _tasksByPriority;
  @override
  @JsonKey()
  List<TasksByPriority> get tasksByPriority {
    if (_tasksByPriority is EqualUnmodifiableListView) return _tasksByPriority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasksByPriority);
  }

  @override
  final ProductivityInsights? productivityInsights;
  final List<ReportTask> _recentTasks;
  @override
  @JsonKey()
  List<ReportTask> get recentTasks {
    if (_recentTasks is EqualUnmodifiableListView) return _recentTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTasks);
  }

  final List<ReportTask> _upcomingDeadlines;
  @override
  @JsonKey()
  List<ReportTask> get upcomingDeadlines {
    if (_upcomingDeadlines is EqualUnmodifiableListView)
      return _upcomingDeadlines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingDeadlines);
  }

  @override
  String toString() {
    return 'ReportsOverview(taskMetrics: $taskMetrics, projectMetrics: $projectMetrics, timeDistribution: $timeDistribution, dailyProductivity: $dailyProductivity, hourlyProductivity: $hourlyProductivity, tasksByStatus: $tasksByStatus, tasksByPriority: $tasksByPriority, productivityInsights: $productivityInsights, recentTasks: $recentTasks, upcomingDeadlines: $upcomingDeadlines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsOverviewImpl &&
            (identical(other.taskMetrics, taskMetrics) ||
                other.taskMetrics == taskMetrics) &&
            (identical(other.projectMetrics, projectMetrics) ||
                other.projectMetrics == projectMetrics) &&
            const DeepCollectionEquality().equals(
              other._timeDistribution,
              _timeDistribution,
            ) &&
            const DeepCollectionEquality().equals(
              other._dailyProductivity,
              _dailyProductivity,
            ) &&
            const DeepCollectionEquality().equals(
              other._hourlyProductivity,
              _hourlyProductivity,
            ) &&
            const DeepCollectionEquality().equals(
              other._tasksByStatus,
              _tasksByStatus,
            ) &&
            const DeepCollectionEquality().equals(
              other._tasksByPriority,
              _tasksByPriority,
            ) &&
            (identical(other.productivityInsights, productivityInsights) ||
                other.productivityInsights == productivityInsights) &&
            const DeepCollectionEquality().equals(
              other._recentTasks,
              _recentTasks,
            ) &&
            const DeepCollectionEquality().equals(
              other._upcomingDeadlines,
              _upcomingDeadlines,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    taskMetrics,
    projectMetrics,
    const DeepCollectionEquality().hash(_timeDistribution),
    const DeepCollectionEquality().hash(_dailyProductivity),
    const DeepCollectionEquality().hash(_hourlyProductivity),
    const DeepCollectionEquality().hash(_tasksByStatus),
    const DeepCollectionEquality().hash(_tasksByPriority),
    productivityInsights,
    const DeepCollectionEquality().hash(_recentTasks),
    const DeepCollectionEquality().hash(_upcomingDeadlines),
  );

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsOverviewImplCopyWith<_$ReportsOverviewImpl> get copyWith =>
      __$$ReportsOverviewImplCopyWithImpl<_$ReportsOverviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportsOverviewImplToJson(this);
  }
}

abstract class _ReportsOverview implements ReportsOverview {
  const factory _ReportsOverview({
    final TaskReportMetrics? taskMetrics,
    final ProjectReportMetrics? projectMetrics,
    final List<TimeDistribution> timeDistribution,
    final List<DailyProductivity> dailyProductivity,
    final List<HourlyProductivity> hourlyProductivity,
    final List<TasksByStatus> tasksByStatus,
    final List<TasksByPriority> tasksByPriority,
    final ProductivityInsights? productivityInsights,
    final List<ReportTask> recentTasks,
    final List<ReportTask> upcomingDeadlines,
  }) = _$ReportsOverviewImpl;

  factory _ReportsOverview.fromJson(Map<String, dynamic> json) =
      _$ReportsOverviewImpl.fromJson;

  @override
  TaskReportMetrics? get taskMetrics;
  @override
  ProjectReportMetrics? get projectMetrics;
  @override
  List<TimeDistribution> get timeDistribution;
  @override
  List<DailyProductivity> get dailyProductivity;
  @override
  List<HourlyProductivity> get hourlyProductivity;
  @override
  List<TasksByStatus> get tasksByStatus;
  @override
  List<TasksByPriority> get tasksByPriority;
  @override
  ProductivityInsights? get productivityInsights;
  @override
  List<ReportTask> get recentTasks;
  @override
  List<ReportTask> get upcomingDeadlines;

  /// Create a copy of ReportsOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsOverviewImplCopyWith<_$ReportsOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComparisonReport _$ComparisonReportFromJson(Map<String, dynamic> json) {
  return _ComparisonReport.fromJson(json);
}

/// @nodoc
mixin _$ComparisonReport {
  TaskReportMetrics? get currentPeriod => throw _privateConstructorUsedError;
  TaskReportMetrics? get previousPeriod => throw _privateConstructorUsedError;
  Map<String, double> get percentageChange =>
      throw _privateConstructorUsedError;

  /// Serializes this ComparisonReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComparisonReportCopyWith<ComparisonReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparisonReportCopyWith<$Res> {
  factory $ComparisonReportCopyWith(
    ComparisonReport value,
    $Res Function(ComparisonReport) then,
  ) = _$ComparisonReportCopyWithImpl<$Res, ComparisonReport>;
  @useResult
  $Res call({
    TaskReportMetrics? currentPeriod,
    TaskReportMetrics? previousPeriod,
    Map<String, double> percentageChange,
  });

  $TaskReportMetricsCopyWith<$Res>? get currentPeriod;
  $TaskReportMetricsCopyWith<$Res>? get previousPeriod;
}

/// @nodoc
class _$ComparisonReportCopyWithImpl<$Res, $Val extends ComparisonReport>
    implements $ComparisonReportCopyWith<$Res> {
  _$ComparisonReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPeriod = freezed,
    Object? previousPeriod = freezed,
    Object? percentageChange = null,
  }) {
    return _then(
      _value.copyWith(
            currentPeriod: freezed == currentPeriod
                ? _value.currentPeriod
                : currentPeriod // ignore: cast_nullable_to_non_nullable
                      as TaskReportMetrics?,
            previousPeriod: freezed == previousPeriod
                ? _value.previousPeriod
                : previousPeriod // ignore: cast_nullable_to_non_nullable
                      as TaskReportMetrics?,
            percentageChange: null == percentageChange
                ? _value.percentageChange
                : percentageChange // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
          )
          as $Val,
    );
  }

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskReportMetricsCopyWith<$Res>? get currentPeriod {
    if (_value.currentPeriod == null) {
      return null;
    }

    return $TaskReportMetricsCopyWith<$Res>(_value.currentPeriod!, (value) {
      return _then(_value.copyWith(currentPeriod: value) as $Val);
    });
  }

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskReportMetricsCopyWith<$Res>? get previousPeriod {
    if (_value.previousPeriod == null) {
      return null;
    }

    return $TaskReportMetricsCopyWith<$Res>(_value.previousPeriod!, (value) {
      return _then(_value.copyWith(previousPeriod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComparisonReportImplCopyWith<$Res>
    implements $ComparisonReportCopyWith<$Res> {
  factory _$$ComparisonReportImplCopyWith(
    _$ComparisonReportImpl value,
    $Res Function(_$ComparisonReportImpl) then,
  ) = __$$ComparisonReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TaskReportMetrics? currentPeriod,
    TaskReportMetrics? previousPeriod,
    Map<String, double> percentageChange,
  });

  @override
  $TaskReportMetricsCopyWith<$Res>? get currentPeriod;
  @override
  $TaskReportMetricsCopyWith<$Res>? get previousPeriod;
}

/// @nodoc
class __$$ComparisonReportImplCopyWithImpl<$Res>
    extends _$ComparisonReportCopyWithImpl<$Res, _$ComparisonReportImpl>
    implements _$$ComparisonReportImplCopyWith<$Res> {
  __$$ComparisonReportImplCopyWithImpl(
    _$ComparisonReportImpl _value,
    $Res Function(_$ComparisonReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPeriod = freezed,
    Object? previousPeriod = freezed,
    Object? percentageChange = null,
  }) {
    return _then(
      _$ComparisonReportImpl(
        currentPeriod: freezed == currentPeriod
            ? _value.currentPeriod
            : currentPeriod // ignore: cast_nullable_to_non_nullable
                  as TaskReportMetrics?,
        previousPeriod: freezed == previousPeriod
            ? _value.previousPeriod
            : previousPeriod // ignore: cast_nullable_to_non_nullable
                  as TaskReportMetrics?,
        percentageChange: null == percentageChange
            ? _value._percentageChange
            : percentageChange // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComparisonReportImpl implements _ComparisonReport {
  const _$ComparisonReportImpl({
    this.currentPeriod,
    this.previousPeriod,
    final Map<String, double> percentageChange = const {},
  }) : _percentageChange = percentageChange;

  factory _$ComparisonReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComparisonReportImplFromJson(json);

  @override
  final TaskReportMetrics? currentPeriod;
  @override
  final TaskReportMetrics? previousPeriod;
  final Map<String, double> _percentageChange;
  @override
  @JsonKey()
  Map<String, double> get percentageChange {
    if (_percentageChange is EqualUnmodifiableMapView) return _percentageChange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_percentageChange);
  }

  @override
  String toString() {
    return 'ComparisonReport(currentPeriod: $currentPeriod, previousPeriod: $previousPeriod, percentageChange: $percentageChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparisonReportImpl &&
            (identical(other.currentPeriod, currentPeriod) ||
                other.currentPeriod == currentPeriod) &&
            (identical(other.previousPeriod, previousPeriod) ||
                other.previousPeriod == previousPeriod) &&
            const DeepCollectionEquality().equals(
              other._percentageChange,
              _percentageChange,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentPeriod,
    previousPeriod,
    const DeepCollectionEquality().hash(_percentageChange),
  );

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparisonReportImplCopyWith<_$ComparisonReportImpl> get copyWith =>
      __$$ComparisonReportImplCopyWithImpl<_$ComparisonReportImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ComparisonReportImplToJson(this);
  }
}

abstract class _ComparisonReport implements ComparisonReport {
  const factory _ComparisonReport({
    final TaskReportMetrics? currentPeriod,
    final TaskReportMetrics? previousPeriod,
    final Map<String, double> percentageChange,
  }) = _$ComparisonReportImpl;

  factory _ComparisonReport.fromJson(Map<String, dynamic> json) =
      _$ComparisonReportImpl.fromJson;

  @override
  TaskReportMetrics? get currentPeriod;
  @override
  TaskReportMetrics? get previousPeriod;
  @override
  Map<String, double> get percentageChange;

  /// Create a copy of ComparisonReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparisonReportImplCopyWith<_$ComparisonReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExportRequest _$ExportRequestFromJson(Map<String, dynamic> json) {
  return _ExportRequest.fromJson(json);
}

/// @nodoc
mixin _$ExportRequest {
  String get format => throw _privateConstructorUsedError;
  String get reportType => throw _privateConstructorUsedError;
  ReportFilterRequest? get filters => throw _privateConstructorUsedError;

  /// Serializes this ExportRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportRequestCopyWith<ExportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportRequestCopyWith<$Res> {
  factory $ExportRequestCopyWith(
    ExportRequest value,
    $Res Function(ExportRequest) then,
  ) = _$ExportRequestCopyWithImpl<$Res, ExportRequest>;
  @useResult
  $Res call({String format, String reportType, ReportFilterRequest? filters});

  $ReportFilterRequestCopyWith<$Res>? get filters;
}

/// @nodoc
class _$ExportRequestCopyWithImpl<$Res, $Val extends ExportRequest>
    implements $ExportRequestCopyWith<$Res> {
  _$ExportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? reportType = null,
    Object? filters = freezed,
  }) {
    return _then(
      _value.copyWith(
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as String,
            reportType: null == reportType
                ? _value.reportType
                : reportType // ignore: cast_nullable_to_non_nullable
                      as String,
            filters: freezed == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                      as ReportFilterRequest?,
          )
          as $Val,
    );
  }

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportFilterRequestCopyWith<$Res>? get filters {
    if (_value.filters == null) {
      return null;
    }

    return $ReportFilterRequestCopyWith<$Res>(_value.filters!, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExportRequestImplCopyWith<$Res>
    implements $ExportRequestCopyWith<$Res> {
  factory _$$ExportRequestImplCopyWith(
    _$ExportRequestImpl value,
    $Res Function(_$ExportRequestImpl) then,
  ) = __$$ExportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String format, String reportType, ReportFilterRequest? filters});

  @override
  $ReportFilterRequestCopyWith<$Res>? get filters;
}

/// @nodoc
class __$$ExportRequestImplCopyWithImpl<$Res>
    extends _$ExportRequestCopyWithImpl<$Res, _$ExportRequestImpl>
    implements _$$ExportRequestImplCopyWith<$Res> {
  __$$ExportRequestImplCopyWithImpl(
    _$ExportRequestImpl _value,
    $Res Function(_$ExportRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? reportType = null,
    Object? filters = freezed,
  }) {
    return _then(
      _$ExportRequestImpl(
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String,
        reportType: null == reportType
            ? _value.reportType
            : reportType // ignore: cast_nullable_to_non_nullable
                  as String,
        filters: freezed == filters
            ? _value.filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as ReportFilterRequest?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExportRequestImpl implements _ExportRequest {
  const _$ExportRequestImpl({
    required this.format,
    required this.reportType,
    this.filters,
  });

  factory _$ExportRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExportRequestImplFromJson(json);

  @override
  final String format;
  @override
  final String reportType;
  @override
  final ReportFilterRequest? filters;

  @override
  String toString() {
    return 'ExportRequest(format: $format, reportType: $reportType, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportRequestImpl &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, format, reportType, filters);

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportRequestImplCopyWith<_$ExportRequestImpl> get copyWith =>
      __$$ExportRequestImplCopyWithImpl<_$ExportRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExportRequestImplToJson(this);
  }
}

abstract class _ExportRequest implements ExportRequest {
  const factory _ExportRequest({
    required final String format,
    required final String reportType,
    final ReportFilterRequest? filters,
  }) = _$ExportRequestImpl;

  factory _ExportRequest.fromJson(Map<String, dynamic> json) =
      _$ExportRequestImpl.fromJson;

  @override
  String get format;
  @override
  String get reportType;
  @override
  ReportFilterRequest? get filters;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportRequestImplCopyWith<_$ExportRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportApiResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  T? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of ReportApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportApiResponseCopyWith<T, ReportApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportApiResponseCopyWith<T, $Res> {
  factory $ReportApiResponseCopyWith(
    ReportApiResponse<T> value,
    $Res Function(ReportApiResponse<T>) then,
  ) = _$ReportApiResponseCopyWithImpl<T, $Res, ReportApiResponse<T>>;
  @useResult
  $Res call({
    bool success,
    @JsonKey(includeFromJson: false, includeToJson: false) T? data,
    Map<String, dynamic>? meta,
    Map<String, dynamic>? error,
  });
}

/// @nodoc
class _$ReportApiResponseCopyWithImpl<
  T,
  $Res,
  $Val extends ReportApiResponse<T>
>
    implements $ReportApiResponseCopyWith<T, $Res> {
  _$ReportApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? meta = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportApiResponseImplCopyWith<T, $Res>
    implements $ReportApiResponseCopyWith<T, $Res> {
  factory _$$ReportApiResponseImplCopyWith(
    _$ReportApiResponseImpl<T> value,
    $Res Function(_$ReportApiResponseImpl<T>) then,
  ) = __$$ReportApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    bool success,
    @JsonKey(includeFromJson: false, includeToJson: false) T? data,
    Map<String, dynamic>? meta,
    Map<String, dynamic>? error,
  });
}

/// @nodoc
class __$$ReportApiResponseImplCopyWithImpl<T, $Res>
    extends _$ReportApiResponseCopyWithImpl<T, $Res, _$ReportApiResponseImpl<T>>
    implements _$$ReportApiResponseImplCopyWith<T, $Res> {
  __$$ReportApiResponseImplCopyWithImpl(
    _$ReportApiResponseImpl<T> _value,
    $Res Function(_$ReportApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? meta = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$ReportApiResponseImpl<T>(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
        meta: freezed == meta
            ? _value._meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        error: freezed == error
            ? _value._error
            : error // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ReportApiResponseImpl<T> implements _ReportApiResponse<T> {
  const _$ReportApiResponseImpl({
    required this.success,
    @JsonKey(includeFromJson: false, includeToJson: false) this.data,
    final Map<String, dynamic>? meta,
    final Map<String, dynamic>? error,
  }) : _meta = meta,
       _error = error;

  @override
  final bool success;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final T? data;
  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _error;
  @override
  Map<String, dynamic>? get error {
    final value = _error;
    if (value == null) return null;
    if (_error is EqualUnmodifiableMapView) return _error;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ReportApiResponse<$T>(success: $success, data: $data, meta: $meta, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            const DeepCollectionEquality().equals(other._error, _error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    const DeepCollectionEquality().hash(data),
    const DeepCollectionEquality().hash(_meta),
    const DeepCollectionEquality().hash(_error),
  );

  /// Create a copy of ReportApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportApiResponseImplCopyWith<T, _$ReportApiResponseImpl<T>>
  get copyWith =>
      __$$ReportApiResponseImplCopyWithImpl<T, _$ReportApiResponseImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _ReportApiResponse<T> implements ReportApiResponse<T> {
  const factory _ReportApiResponse({
    required final bool success,
    @JsonKey(includeFromJson: false, includeToJson: false) final T? data,
    final Map<String, dynamic>? meta,
    final Map<String, dynamic>? error,
  }) = _$ReportApiResponseImpl<T>;

  @override
  bool get success;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  T? get data;
  @override
  Map<String, dynamic>? get meta;
  @override
  Map<String, dynamic>? get error;

  /// Create a copy of ReportApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportApiResponseImplCopyWith<T, _$ReportApiResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

ChartDataPoint _$ChartDataPointFromJson(Map<String, dynamic> json) {
  return _ChartDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ChartDataPoint {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get secondaryLabel => throw _privateConstructorUsedError;
  double? get secondaryValue => throw _privateConstructorUsedError;

  /// Serializes this ChartDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartDataPointCopyWith<ChartDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataPointCopyWith<$Res> {
  factory $ChartDataPointCopyWith(
    ChartDataPoint value,
    $Res Function(ChartDataPoint) then,
  ) = _$ChartDataPointCopyWithImpl<$Res, ChartDataPoint>;
  @useResult
  $Res call({
    String label,
    double value,
    String? color,
    String? secondaryLabel,
    double? secondaryValue,
  });
}

/// @nodoc
class _$ChartDataPointCopyWithImpl<$Res, $Val extends ChartDataPoint>
    implements $ChartDataPointCopyWith<$Res> {
  _$ChartDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = freezed,
    Object? secondaryLabel = freezed,
    Object? secondaryValue = freezed,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            secondaryLabel: freezed == secondaryLabel
                ? _value.secondaryLabel
                : secondaryLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            secondaryValue: freezed == secondaryValue
                ? _value.secondaryValue
                : secondaryValue // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChartDataPointImplCopyWith<$Res>
    implements $ChartDataPointCopyWith<$Res> {
  factory _$$ChartDataPointImplCopyWith(
    _$ChartDataPointImpl value,
    $Res Function(_$ChartDataPointImpl) then,
  ) = __$$ChartDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    double value,
    String? color,
    String? secondaryLabel,
    double? secondaryValue,
  });
}

/// @nodoc
class __$$ChartDataPointImplCopyWithImpl<$Res>
    extends _$ChartDataPointCopyWithImpl<$Res, _$ChartDataPointImpl>
    implements _$$ChartDataPointImplCopyWith<$Res> {
  __$$ChartDataPointImplCopyWithImpl(
    _$ChartDataPointImpl _value,
    $Res Function(_$ChartDataPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? color = freezed,
    Object? secondaryLabel = freezed,
    Object? secondaryValue = freezed,
  }) {
    return _then(
      _$ChartDataPointImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        secondaryLabel: freezed == secondaryLabel
            ? _value.secondaryLabel
            : secondaryLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        secondaryValue: freezed == secondaryValue
            ? _value.secondaryValue
            : secondaryValue // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataPointImpl implements _ChartDataPoint {
  const _$ChartDataPointImpl({
    required this.label,
    required this.value,
    this.color,
    this.secondaryLabel,
    this.secondaryValue,
  });

  factory _$ChartDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataPointImplFromJson(json);

  @override
  final String label;
  @override
  final double value;
  @override
  final String? color;
  @override
  final String? secondaryLabel;
  @override
  final double? secondaryValue;

  @override
  String toString() {
    return 'ChartDataPoint(label: $label, value: $value, color: $color, secondaryLabel: $secondaryLabel, secondaryValue: $secondaryValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataPointImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.secondaryLabel, secondaryLabel) ||
                other.secondaryLabel == secondaryLabel) &&
            (identical(other.secondaryValue, secondaryValue) ||
                other.secondaryValue == secondaryValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    value,
    color,
    secondaryLabel,
    secondaryValue,
  );

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      __$$ChartDataPointImplCopyWithImpl<_$ChartDataPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataPointImplToJson(this);
  }
}

abstract class _ChartDataPoint implements ChartDataPoint {
  const factory _ChartDataPoint({
    required final String label,
    required final double value,
    final String? color,
    final String? secondaryLabel,
    final double? secondaryValue,
  }) = _$ChartDataPointImpl;

  factory _ChartDataPoint.fromJson(Map<String, dynamic> json) =
      _$ChartDataPointImpl.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  String? get color;
  @override
  String? get secondaryLabel;
  @override
  double? get secondaryValue;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
