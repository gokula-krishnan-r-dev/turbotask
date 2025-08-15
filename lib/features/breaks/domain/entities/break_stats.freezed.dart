// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BreakStats _$BreakStatsFromJson(Map<String, dynamic> json) {
  return _BreakStats.fromJson(json);
}

/// @nodoc
mixin _$BreakStats {
  int get totalBreaks => throw _privateConstructorUsedError;
  int get totalDuration =>
      throw _privateConstructorUsedError; // Total duration in seconds
  double get averageDuration =>
      throw _privateConstructorUsedError; // Average duration in seconds
  int get todayBreaks => throw _privateConstructorUsedError;
  int get todayDuration =>
      throw _privateConstructorUsedError; // Today's total duration in seconds
  int get thisWeekBreaks => throw _privateConstructorUsedError;
  int get thisWeekDuration =>
      throw _privateConstructorUsedError; // This week's total duration in seconds
  BreakSession? get currentActiveBreak => throw _privateConstructorUsedError;

  /// Serializes this BreakStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakStatsCopyWith<BreakStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakStatsCopyWith<$Res> {
  factory $BreakStatsCopyWith(
    BreakStats value,
    $Res Function(BreakStats) then,
  ) = _$BreakStatsCopyWithImpl<$Res, BreakStats>;
  @useResult
  $Res call({
    int totalBreaks,
    int totalDuration,
    double averageDuration,
    int todayBreaks,
    int todayDuration,
    int thisWeekBreaks,
    int thisWeekDuration,
    BreakSession? currentActiveBreak,
  });

  $BreakSessionCopyWith<$Res>? get currentActiveBreak;
}

/// @nodoc
class _$BreakStatsCopyWithImpl<$Res, $Val extends BreakStats>
    implements $BreakStatsCopyWith<$Res> {
  _$BreakStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBreaks = null,
    Object? totalDuration = null,
    Object? averageDuration = null,
    Object? todayBreaks = null,
    Object? todayDuration = null,
    Object? thisWeekBreaks = null,
    Object? thisWeekDuration = null,
    Object? currentActiveBreak = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalBreaks: null == totalBreaks
                ? _value.totalBreaks
                : totalBreaks // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDuration: null == totalDuration
                ? _value.totalDuration
                : totalDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            averageDuration: null == averageDuration
                ? _value.averageDuration
                : averageDuration // ignore: cast_nullable_to_non_nullable
                      as double,
            todayBreaks: null == todayBreaks
                ? _value.todayBreaks
                : todayBreaks // ignore: cast_nullable_to_non_nullable
                      as int,
            todayDuration: null == todayDuration
                ? _value.todayDuration
                : todayDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            thisWeekBreaks: null == thisWeekBreaks
                ? _value.thisWeekBreaks
                : thisWeekBreaks // ignore: cast_nullable_to_non_nullable
                      as int,
            thisWeekDuration: null == thisWeekDuration
                ? _value.thisWeekDuration
                : thisWeekDuration // ignore: cast_nullable_to_non_nullable
                      as int,
            currentActiveBreak: freezed == currentActiveBreak
                ? _value.currentActiveBreak
                : currentActiveBreak // ignore: cast_nullable_to_non_nullable
                      as BreakSession?,
          )
          as $Val,
    );
  }

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreakSessionCopyWith<$Res>? get currentActiveBreak {
    if (_value.currentActiveBreak == null) {
      return null;
    }

    return $BreakSessionCopyWith<$Res>(_value.currentActiveBreak!, (value) {
      return _then(_value.copyWith(currentActiveBreak: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BreakStatsImplCopyWith<$Res>
    implements $BreakStatsCopyWith<$Res> {
  factory _$$BreakStatsImplCopyWith(
    _$BreakStatsImpl value,
    $Res Function(_$BreakStatsImpl) then,
  ) = __$$BreakStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalBreaks,
    int totalDuration,
    double averageDuration,
    int todayBreaks,
    int todayDuration,
    int thisWeekBreaks,
    int thisWeekDuration,
    BreakSession? currentActiveBreak,
  });

  @override
  $BreakSessionCopyWith<$Res>? get currentActiveBreak;
}

/// @nodoc
class __$$BreakStatsImplCopyWithImpl<$Res>
    extends _$BreakStatsCopyWithImpl<$Res, _$BreakStatsImpl>
    implements _$$BreakStatsImplCopyWith<$Res> {
  __$$BreakStatsImplCopyWithImpl(
    _$BreakStatsImpl _value,
    $Res Function(_$BreakStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBreaks = null,
    Object? totalDuration = null,
    Object? averageDuration = null,
    Object? todayBreaks = null,
    Object? todayDuration = null,
    Object? thisWeekBreaks = null,
    Object? thisWeekDuration = null,
    Object? currentActiveBreak = freezed,
  }) {
    return _then(
      _$BreakStatsImpl(
        totalBreaks: null == totalBreaks
            ? _value.totalBreaks
            : totalBreaks // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        averageDuration: null == averageDuration
            ? _value.averageDuration
            : averageDuration // ignore: cast_nullable_to_non_nullable
                  as double,
        todayBreaks: null == todayBreaks
            ? _value.todayBreaks
            : todayBreaks // ignore: cast_nullable_to_non_nullable
                  as int,
        todayDuration: null == todayDuration
            ? _value.todayDuration
            : todayDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        thisWeekBreaks: null == thisWeekBreaks
            ? _value.thisWeekBreaks
            : thisWeekBreaks // ignore: cast_nullable_to_non_nullable
                  as int,
        thisWeekDuration: null == thisWeekDuration
            ? _value.thisWeekDuration
            : thisWeekDuration // ignore: cast_nullable_to_non_nullable
                  as int,
        currentActiveBreak: freezed == currentActiveBreak
            ? _value.currentActiveBreak
            : currentActiveBreak // ignore: cast_nullable_to_non_nullable
                  as BreakSession?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakStatsImpl implements _BreakStats {
  const _$BreakStatsImpl({
    required this.totalBreaks,
    required this.totalDuration,
    required this.averageDuration,
    required this.todayBreaks,
    required this.todayDuration,
    required this.thisWeekBreaks,
    required this.thisWeekDuration,
    this.currentActiveBreak,
  });

  factory _$BreakStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakStatsImplFromJson(json);

  @override
  final int totalBreaks;
  @override
  final int totalDuration;
  // Total duration in seconds
  @override
  final double averageDuration;
  // Average duration in seconds
  @override
  final int todayBreaks;
  @override
  final int todayDuration;
  // Today's total duration in seconds
  @override
  final int thisWeekBreaks;
  @override
  final int thisWeekDuration;
  // This week's total duration in seconds
  @override
  final BreakSession? currentActiveBreak;

  @override
  String toString() {
    return 'BreakStats(totalBreaks: $totalBreaks, totalDuration: $totalDuration, averageDuration: $averageDuration, todayBreaks: $todayBreaks, todayDuration: $todayDuration, thisWeekBreaks: $thisWeekBreaks, thisWeekDuration: $thisWeekDuration, currentActiveBreak: $currentActiveBreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakStatsImpl &&
            (identical(other.totalBreaks, totalBreaks) ||
                other.totalBreaks == totalBreaks) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.averageDuration, averageDuration) ||
                other.averageDuration == averageDuration) &&
            (identical(other.todayBreaks, todayBreaks) ||
                other.todayBreaks == todayBreaks) &&
            (identical(other.todayDuration, todayDuration) ||
                other.todayDuration == todayDuration) &&
            (identical(other.thisWeekBreaks, thisWeekBreaks) ||
                other.thisWeekBreaks == thisWeekBreaks) &&
            (identical(other.thisWeekDuration, thisWeekDuration) ||
                other.thisWeekDuration == thisWeekDuration) &&
            (identical(other.currentActiveBreak, currentActiveBreak) ||
                other.currentActiveBreak == currentActiveBreak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBreaks,
    totalDuration,
    averageDuration,
    todayBreaks,
    todayDuration,
    thisWeekBreaks,
    thisWeekDuration,
    currentActiveBreak,
  );

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakStatsImplCopyWith<_$BreakStatsImpl> get copyWith =>
      __$$BreakStatsImplCopyWithImpl<_$BreakStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakStatsImplToJson(this);
  }
}

abstract class _BreakStats implements BreakStats {
  const factory _BreakStats({
    required final int totalBreaks,
    required final int totalDuration,
    required final double averageDuration,
    required final int todayBreaks,
    required final int todayDuration,
    required final int thisWeekBreaks,
    required final int thisWeekDuration,
    final BreakSession? currentActiveBreak,
  }) = _$BreakStatsImpl;

  factory _BreakStats.fromJson(Map<String, dynamic> json) =
      _$BreakStatsImpl.fromJson;

  @override
  int get totalBreaks;
  @override
  int get totalDuration; // Total duration in seconds
  @override
  double get averageDuration; // Average duration in seconds
  @override
  int get todayBreaks;
  @override
  int get todayDuration; // Today's total duration in seconds
  @override
  int get thisWeekBreaks;
  @override
  int get thisWeekDuration; // This week's total duration in seconds
  @override
  BreakSession? get currentActiveBreak;

  /// Create a copy of BreakStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakStatsImplCopyWith<_$BreakStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
