// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BreakEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakEventCopyWith<$Res> {
  factory $BreakEventCopyWith(
    BreakEvent value,
    $Res Function(BreakEvent) then,
  ) = _$BreakEventCopyWithImpl<$Res, BreakEvent>;
}

/// @nodoc
class _$BreakEventCopyWithImpl<$Res, $Val extends BreakEvent>
    implements $BreakEventCopyWith<$Res> {
  _$BreakEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartBreakImplCopyWith<$Res> {
  factory _$$StartBreakImplCopyWith(
    _$StartBreakImpl value,
    $Res Function(_$StartBreakImpl) then,
  ) = __$$StartBreakImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, String projectId, String breakType, String notes});
}

/// @nodoc
class __$$StartBreakImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$StartBreakImpl>
    implements _$$StartBreakImplCopyWith<$Res> {
  __$$StartBreakImplCopyWithImpl(
    _$StartBreakImpl _value,
    $Res Function(_$StartBreakImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? projectId = null,
    Object? breakType = null,
    Object? notes = null,
  }) {
    return _then(
      _$StartBreakImpl(
        todoId: null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        breakType: null == breakType
            ? _value.breakType
            : breakType // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StartBreakImpl implements StartBreak {
  const _$StartBreakImpl({
    required this.todoId,
    required this.projectId,
    this.breakType = 'manual',
    this.notes = '',
  });

  @override
  final String todoId;
  @override
  final String projectId;
  @override
  @JsonKey()
  final String breakType;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'BreakEvent.startBreak(todoId: $todoId, projectId: $projectId, breakType: $breakType, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartBreakImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.breakType, breakType) ||
                other.breakType == breakType) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, todoId, projectId, breakType, notes);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartBreakImplCopyWith<_$StartBreakImpl> get copyWith =>
      __$$StartBreakImplCopyWithImpl<_$StartBreakImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return startBreak(todoId, projectId, breakType, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return startBreak?.call(todoId, projectId, breakType, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (startBreak != null) {
      return startBreak(todoId, projectId, breakType, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return startBreak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return startBreak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (startBreak != null) {
      return startBreak(this);
    }
    return orElse();
  }
}

abstract class StartBreak implements BreakEvent {
  const factory StartBreak({
    required final String todoId,
    required final String projectId,
    final String breakType,
    final String notes,
  }) = _$StartBreakImpl;

  String get todoId;
  String get projectId;
  String get breakType;
  String get notes;

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartBreakImplCopyWith<_$StartBreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopBreakImplCopyWith<$Res> {
  factory _$$StopBreakImplCopyWith(
    _$StopBreakImpl value,
    $Res Function(_$StopBreakImpl) then,
  ) = __$$StopBreakImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String notes});
}

/// @nodoc
class __$$StopBreakImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$StopBreakImpl>
    implements _$$StopBreakImplCopyWith<$Res> {
  __$$StopBreakImplCopyWithImpl(
    _$StopBreakImpl _value,
    $Res Function(_$StopBreakImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notes = null}) {
    return _then(
      _$StopBreakImpl(
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StopBreakImpl implements StopBreak {
  const _$StopBreakImpl({this.notes = ''});

  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'BreakEvent.stopBreak(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopBreakImpl &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notes);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopBreakImplCopyWith<_$StopBreakImpl> get copyWith =>
      __$$StopBreakImplCopyWithImpl<_$StopBreakImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return stopBreak(notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return stopBreak?.call(notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (stopBreak != null) {
      return stopBreak(notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return stopBreak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return stopBreak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (stopBreak != null) {
      return stopBreak(this);
    }
    return orElse();
  }
}

abstract class StopBreak implements BreakEvent {
  const factory StopBreak({final String notes}) = _$StopBreakImpl;

  String get notes;

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopBreakImplCopyWith<_$StopBreakImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadActiveBreakImplCopyWith<$Res> {
  factory _$$LoadActiveBreakImplCopyWith(
    _$LoadActiveBreakImpl value,
    $Res Function(_$LoadActiveBreakImpl) then,
  ) = __$$LoadActiveBreakImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadActiveBreakImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$LoadActiveBreakImpl>
    implements _$$LoadActiveBreakImplCopyWith<$Res> {
  __$$LoadActiveBreakImplCopyWithImpl(
    _$LoadActiveBreakImpl _value,
    $Res Function(_$LoadActiveBreakImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadActiveBreakImpl implements LoadActiveBreak {
  const _$LoadActiveBreakImpl();

  @override
  String toString() {
    return 'BreakEvent.loadActiveBreak()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadActiveBreakImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return loadActiveBreak();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return loadActiveBreak?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (loadActiveBreak != null) {
      return loadActiveBreak();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return loadActiveBreak(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return loadActiveBreak?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (loadActiveBreak != null) {
      return loadActiveBreak(this);
    }
    return orElse();
  }
}

abstract class LoadActiveBreak implements BreakEvent {
  const factory LoadActiveBreak() = _$LoadActiveBreakImpl;
}

/// @nodoc
abstract class _$$LoadBreakHistoryImplCopyWith<$Res> {
  factory _$$LoadBreakHistoryImplCopyWith(
    _$LoadBreakHistoryImpl value,
    $Res Function(_$LoadBreakHistoryImpl) then,
  ) = __$$LoadBreakHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$LoadBreakHistoryImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$LoadBreakHistoryImpl>
    implements _$$LoadBreakHistoryImplCopyWith<$Res> {
  __$$LoadBreakHistoryImplCopyWithImpl(
    _$LoadBreakHistoryImpl _value,
    $Res Function(_$LoadBreakHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null, Object? offset = null}) {
    return _then(
      _$LoadBreakHistoryImpl(
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$LoadBreakHistoryImpl implements LoadBreakHistory {
  const _$LoadBreakHistoryImpl({this.limit = 20, this.offset = 0});

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'BreakEvent.loadBreakHistory(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBreakHistoryImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBreakHistoryImplCopyWith<_$LoadBreakHistoryImpl> get copyWith =>
      __$$LoadBreakHistoryImplCopyWithImpl<_$LoadBreakHistoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return loadBreakHistory(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return loadBreakHistory?.call(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (loadBreakHistory != null) {
      return loadBreakHistory(limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return loadBreakHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return loadBreakHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (loadBreakHistory != null) {
      return loadBreakHistory(this);
    }
    return orElse();
  }
}

abstract class LoadBreakHistory implements BreakEvent {
  const factory LoadBreakHistory({final int limit, final int offset}) =
      _$LoadBreakHistoryImpl;

  int get limit;
  int get offset;

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadBreakHistoryImplCopyWith<_$LoadBreakHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadBreakStatsImplCopyWith<$Res> {
  factory _$$LoadBreakStatsImplCopyWith(
    _$LoadBreakStatsImpl value,
    $Res Function(_$LoadBreakStatsImpl) then,
  ) = __$$LoadBreakStatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadBreakStatsImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$LoadBreakStatsImpl>
    implements _$$LoadBreakStatsImplCopyWith<$Res> {
  __$$LoadBreakStatsImplCopyWithImpl(
    _$LoadBreakStatsImpl _value,
    $Res Function(_$LoadBreakStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadBreakStatsImpl implements LoadBreakStats {
  const _$LoadBreakStatsImpl();

  @override
  String toString() {
    return 'BreakEvent.loadBreakStats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadBreakStatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return loadBreakStats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return loadBreakStats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (loadBreakStats != null) {
      return loadBreakStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return loadBreakStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return loadBreakStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (loadBreakStats != null) {
      return loadBreakStats(this);
    }
    return orElse();
  }
}

abstract class LoadBreakStats implements BreakEvent {
  const factory LoadBreakStats() = _$LoadBreakStatsImpl;
}

/// @nodoc
abstract class _$$UpdateTimerImplCopyWith<$Res> {
  factory _$$UpdateTimerImplCopyWith(
    _$UpdateTimerImpl value,
    $Res Function(_$UpdateTimerImpl) then,
  ) = __$$UpdateTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateTimerImplCopyWithImpl<$Res>
    extends _$BreakEventCopyWithImpl<$Res, _$UpdateTimerImpl>
    implements _$$UpdateTimerImplCopyWith<$Res> {
  __$$UpdateTimerImplCopyWithImpl(
    _$UpdateTimerImpl _value,
    $Res Function(_$UpdateTimerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateTimerImpl implements UpdateTimer {
  const _$UpdateTimerImpl();

  @override
  String toString() {
    return 'BreakEvent.updateTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )
    startBreak,
    required TResult Function(String notes) stopBreak,
    required TResult Function() loadActiveBreak,
    required TResult Function(int limit, int offset) loadBreakHistory,
    required TResult Function() loadBreakStats,
    required TResult Function() updateTimer,
  }) {
    return updateTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult? Function(String notes)? stopBreak,
    TResult? Function()? loadActiveBreak,
    TResult? Function(int limit, int offset)? loadBreakHistory,
    TResult? Function()? loadBreakStats,
    TResult? Function()? updateTimer,
  }) {
    return updateTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String todoId,
      String projectId,
      String breakType,
      String notes,
    )?
    startBreak,
    TResult Function(String notes)? stopBreak,
    TResult Function()? loadActiveBreak,
    TResult Function(int limit, int offset)? loadBreakHistory,
    TResult Function()? loadBreakStats,
    TResult Function()? updateTimer,
    required TResult orElse(),
  }) {
    if (updateTimer != null) {
      return updateTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartBreak value) startBreak,
    required TResult Function(StopBreak value) stopBreak,
    required TResult Function(LoadActiveBreak value) loadActiveBreak,
    required TResult Function(LoadBreakHistory value) loadBreakHistory,
    required TResult Function(LoadBreakStats value) loadBreakStats,
    required TResult Function(UpdateTimer value) updateTimer,
  }) {
    return updateTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartBreak value)? startBreak,
    TResult? Function(StopBreak value)? stopBreak,
    TResult? Function(LoadActiveBreak value)? loadActiveBreak,
    TResult? Function(LoadBreakHistory value)? loadBreakHistory,
    TResult? Function(LoadBreakStats value)? loadBreakStats,
    TResult? Function(UpdateTimer value)? updateTimer,
  }) {
    return updateTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartBreak value)? startBreak,
    TResult Function(StopBreak value)? stopBreak,
    TResult Function(LoadActiveBreak value)? loadActiveBreak,
    TResult Function(LoadBreakHistory value)? loadBreakHistory,
    TResult Function(LoadBreakStats value)? loadBreakStats,
    TResult Function(UpdateTimer value)? updateTimer,
    required TResult orElse(),
  }) {
    if (updateTimer != null) {
      return updateTimer(this);
    }
    return orElse();
  }
}

abstract class UpdateTimer implements BreakEvent {
  const factory UpdateTimer() = _$UpdateTimerImpl;
}
