// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoResponseModel _$TodoResponseModelFromJson(Map<String, dynamic> json) {
  return _TodoResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TodoResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TodoModel? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'todos')
  List<TodoModel>? get todos => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this TodoResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoResponseModelCopyWith<TodoResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoResponseModelCopyWith<$Res> {
  factory $TodoResponseModelCopyWith(
    TodoResponseModel value,
    $Res Function(TodoResponseModel) then,
  ) = _$TodoResponseModelCopyWithImpl<$Res, TodoResponseModel>;
  @useResult
  $Res call({
    bool success,
    String message,
    TodoModel? data,
    @JsonKey(name: 'todos') List<TodoModel>? todos,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });

  $TodoModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$TodoResponseModelCopyWithImpl<$Res, $Val extends TodoResponseModel>
    implements $TodoResponseModelCopyWith<$Res> {
  _$TodoResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? todos = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as TodoModel?,
            todos: freezed == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TodoModel>?,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPage: freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            perPage: freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastPage: freezed == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TodoModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoResponseModelImplCopyWith<$Res>
    implements $TodoResponseModelCopyWith<$Res> {
  factory _$$TodoResponseModelImplCopyWith(
    _$TodoResponseModelImpl value,
    $Res Function(_$TodoResponseModelImpl) then,
  ) = __$$TodoResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    TodoModel? data,
    @JsonKey(name: 'todos') List<TodoModel>? todos,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });

  @override
  $TodoModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TodoResponseModelImplCopyWithImpl<$Res>
    extends _$TodoResponseModelCopyWithImpl<$Res, _$TodoResponseModelImpl>
    implements _$$TodoResponseModelImplCopyWith<$Res> {
  __$$TodoResponseModelImplCopyWithImpl(
    _$TodoResponseModelImpl _value,
    $Res Function(_$TodoResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? todos = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _$TodoResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as TodoModel?,
        todos: freezed == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoModel>?,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPage: freezed == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        perPage: freezed == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastPage: freezed == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoResponseModelImpl implements _TodoResponseModel {
  const _$TodoResponseModelImpl({
    required this.success,
    required this.message,
    this.data,
    @JsonKey(name: 'todos') final List<TodoModel>? todos,
    @JsonKey(name: 'total_count') this.totalCount,
    @JsonKey(name: 'current_page') this.currentPage,
    @JsonKey(name: 'per_page') this.perPage,
    @JsonKey(name: 'last_page') this.lastPage,
  }) : _todos = todos;

  factory _$TodoResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final TodoModel? data;
  final List<TodoModel>? _todos;
  @override
  @JsonKey(name: 'todos')
  List<TodoModel>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;

  @override
  String toString() {
    return 'TodoResponseModel(success: $success, message: $message, data: $data, todos: $todos, totalCount: $totalCount, currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    data,
    const DeepCollectionEquality().hash(_todos),
    totalCount,
    currentPage,
    perPage,
    lastPage,
  );

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoResponseModelImplCopyWith<_$TodoResponseModelImpl> get copyWith =>
      __$$TodoResponseModelImplCopyWithImpl<_$TodoResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoResponseModelImplToJson(this);
  }
}

abstract class _TodoResponseModel implements TodoResponseModel {
  const factory _TodoResponseModel({
    required final bool success,
    required final String message,
    final TodoModel? data,
    @JsonKey(name: 'todos') final List<TodoModel>? todos,
    @JsonKey(name: 'total_count') final int? totalCount,
    @JsonKey(name: 'current_page') final int? currentPage,
    @JsonKey(name: 'per_page') final int? perPage,
    @JsonKey(name: 'last_page') final int? lastPage,
  }) = _$TodoResponseModelImpl;

  factory _TodoResponseModel.fromJson(Map<String, dynamic> json) =
      _$TodoResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  TodoModel? get data;
  @override
  @JsonKey(name: 'todos')
  List<TodoModel>? get todos;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of TodoResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoResponseModelImplCopyWith<_$TodoResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoListResponseModel _$TodoListResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _TodoListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TodoListResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<TodoModel> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this TodoListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoListResponseModelCopyWith<TodoListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListResponseModelCopyWith<$Res> {
  factory $TodoListResponseModelCopyWith(
    TodoListResponseModel value,
    $Res Function(TodoListResponseModel) then,
  ) = _$TodoListResponseModelCopyWithImpl<$Res, TodoListResponseModel>;
  @useResult
  $Res call({
    bool success,
    String message,
    List<TodoModel> data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });
}

/// @nodoc
class _$TodoListResponseModelCopyWithImpl<
  $Res,
  $Val extends TodoListResponseModel
>
    implements $TodoListResponseModelCopyWith<$Res> {
  _$TodoListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<TodoModel>,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPage: freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            perPage: freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastPage: freezed == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoListResponseModelImplCopyWith<$Res>
    implements $TodoListResponseModelCopyWith<$Res> {
  factory _$$TodoListResponseModelImplCopyWith(
    _$TodoListResponseModelImpl value,
    $Res Function(_$TodoListResponseModelImpl) then,
  ) = __$$TodoListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    List<TodoModel> data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });
}

/// @nodoc
class __$$TodoListResponseModelImplCopyWithImpl<$Res>
    extends
        _$TodoListResponseModelCopyWithImpl<$Res, _$TodoListResponseModelImpl>
    implements _$$TodoListResponseModelImplCopyWith<$Res> {
  __$$TodoListResponseModelImplCopyWithImpl(
    _$TodoListResponseModelImpl _value,
    $Res Function(_$TodoListResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _$TodoListResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<TodoModel>,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPage: freezed == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        perPage: freezed == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastPage: freezed == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoListResponseModelImpl implements _TodoListResponseModel {
  const _$TodoListResponseModelImpl({
    required this.success,
    required this.message,
    required final List<TodoModel> data,
    @JsonKey(name: 'total_count') this.totalCount,
    @JsonKey(name: 'current_page') this.currentPage,
    @JsonKey(name: 'per_page') this.perPage,
    @JsonKey(name: 'last_page') this.lastPage,
  }) : _data = data;

  factory _$TodoListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoListResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<TodoModel> _data;
  @override
  List<TodoModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;

  @override
  String toString() {
    return 'TodoListResponseModel(success: $success, message: $message, data: $data, totalCount: $totalCount, currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(_data),
    totalCount,
    currentPage,
    perPage,
    lastPage,
  );

  /// Create a copy of TodoListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListResponseModelImplCopyWith<_$TodoListResponseModelImpl>
  get copyWith =>
      __$$TodoListResponseModelImplCopyWithImpl<_$TodoListResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoListResponseModelImplToJson(this);
  }
}

abstract class _TodoListResponseModel implements TodoListResponseModel {
  const factory _TodoListResponseModel({
    required final bool success,
    required final String message,
    required final List<TodoModel> data,
    @JsonKey(name: 'total_count') final int? totalCount,
    @JsonKey(name: 'current_page') final int? currentPage,
    @JsonKey(name: 'per_page') final int? perPage,
    @JsonKey(name: 'last_page') final int? lastPage,
  }) = _$TodoListResponseModelImpl;

  factory _TodoListResponseModel.fromJson(Map<String, dynamic> json) =
      _$TodoListResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<TodoModel> get data;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of TodoListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoListResponseModelImplCopyWith<_$TodoListResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubtaskResponseModel _$SubtaskResponseModelFromJson(Map<String, dynamic> json) {
  return _SubtaskResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SubtaskResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SubtaskModel? get data => throw _privateConstructorUsedError;

  /// Serializes this SubtaskResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskResponseModelCopyWith<SubtaskResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskResponseModelCopyWith<$Res> {
  factory $SubtaskResponseModelCopyWith(
    SubtaskResponseModel value,
    $Res Function(SubtaskResponseModel) then,
  ) = _$SubtaskResponseModelCopyWithImpl<$Res, SubtaskResponseModel>;
  @useResult
  $Res call({bool success, String message, SubtaskModel? data});

  $SubtaskModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$SubtaskResponseModelCopyWithImpl<
  $Res,
  $Val extends SubtaskResponseModel
>
    implements $SubtaskResponseModelCopyWith<$Res> {
  _$SubtaskResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as SubtaskModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubtaskModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SubtaskModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubtaskResponseModelImplCopyWith<$Res>
    implements $SubtaskResponseModelCopyWith<$Res> {
  factory _$$SubtaskResponseModelImplCopyWith(
    _$SubtaskResponseModelImpl value,
    $Res Function(_$SubtaskResponseModelImpl) then,
  ) = __$$SubtaskResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, SubtaskModel? data});

  @override
  $SubtaskModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SubtaskResponseModelImplCopyWithImpl<$Res>
    extends _$SubtaskResponseModelCopyWithImpl<$Res, _$SubtaskResponseModelImpl>
    implements _$$SubtaskResponseModelImplCopyWith<$Res> {
  __$$SubtaskResponseModelImplCopyWithImpl(
    _$SubtaskResponseModelImpl _value,
    $Res Function(_$SubtaskResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(
      _$SubtaskResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as SubtaskModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskResponseModelImpl implements _SubtaskResponseModel {
  const _$SubtaskResponseModelImpl({
    required this.success,
    required this.message,
    this.data,
  });

  factory _$SubtaskResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final SubtaskModel? data;

  @override
  String toString() {
    return 'SubtaskResponseModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskResponseModelImplCopyWith<_$SubtaskResponseModelImpl>
  get copyWith =>
      __$$SubtaskResponseModelImplCopyWithImpl<_$SubtaskResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskResponseModelImplToJson(this);
  }
}

abstract class _SubtaskResponseModel implements SubtaskResponseModel {
  const factory _SubtaskResponseModel({
    required final bool success,
    required final String message,
    final SubtaskModel? data,
  }) = _$SubtaskResponseModelImpl;

  factory _SubtaskResponseModel.fromJson(Map<String, dynamic> json) =
      _$SubtaskResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  SubtaskModel? get data;

  /// Create a copy of SubtaskResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskResponseModelImplCopyWith<_$SubtaskResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubtaskListResponseModel _$SubtaskListResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _SubtaskListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SubtaskListResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<SubtaskModel> get data => throw _privateConstructorUsedError;

  /// Serializes this SubtaskListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtaskListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskListResponseModelCopyWith<SubtaskListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskListResponseModelCopyWith<$Res> {
  factory $SubtaskListResponseModelCopyWith(
    SubtaskListResponseModel value,
    $Res Function(SubtaskListResponseModel) then,
  ) = _$SubtaskListResponseModelCopyWithImpl<$Res, SubtaskListResponseModel>;
  @useResult
  $Res call({bool success, String message, List<SubtaskModel> data});
}

/// @nodoc
class _$SubtaskListResponseModelCopyWithImpl<
  $Res,
  $Val extends SubtaskListResponseModel
>
    implements $SubtaskListResponseModelCopyWith<$Res> {
  _$SubtaskListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtaskListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<SubtaskModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubtaskListResponseModelImplCopyWith<$Res>
    implements $SubtaskListResponseModelCopyWith<$Res> {
  factory _$$SubtaskListResponseModelImplCopyWith(
    _$SubtaskListResponseModelImpl value,
    $Res Function(_$SubtaskListResponseModelImpl) then,
  ) = __$$SubtaskListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<SubtaskModel> data});
}

/// @nodoc
class __$$SubtaskListResponseModelImplCopyWithImpl<$Res>
    extends
        _$SubtaskListResponseModelCopyWithImpl<
          $Res,
          _$SubtaskListResponseModelImpl
        >
    implements _$$SubtaskListResponseModelImplCopyWith<$Res> {
  __$$SubtaskListResponseModelImplCopyWithImpl(
    _$SubtaskListResponseModelImpl _value,
    $Res Function(_$SubtaskListResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubtaskListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _$SubtaskListResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SubtaskModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskListResponseModelImpl implements _SubtaskListResponseModel {
  const _$SubtaskListResponseModelImpl({
    required this.success,
    required this.message,
    required final List<SubtaskModel> data,
  }) : _data = data;

  factory _$SubtaskListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskListResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<SubtaskModel> _data;
  @override
  List<SubtaskModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SubtaskListResponseModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskListResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of SubtaskListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskListResponseModelImplCopyWith<_$SubtaskListResponseModelImpl>
  get copyWith =>
      __$$SubtaskListResponseModelImplCopyWithImpl<
        _$SubtaskListResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskListResponseModelImplToJson(this);
  }
}

abstract class _SubtaskListResponseModel implements SubtaskListResponseModel {
  const factory _SubtaskListResponseModel({
    required final bool success,
    required final String message,
    required final List<SubtaskModel> data,
  }) = _$SubtaskListResponseModelImpl;

  factory _SubtaskListResponseModel.fromJson(Map<String, dynamic> json) =
      _$SubtaskListResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<SubtaskModel> get data;

  /// Create a copy of SubtaskListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskListResponseModelImplCopyWith<_$SubtaskListResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
