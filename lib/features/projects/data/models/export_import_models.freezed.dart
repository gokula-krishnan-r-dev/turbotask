// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_import_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExportProjectResponse _$ExportProjectResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ExportProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ExportProjectResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  int? get fileSize => throw _privateConstructorUsedError;

  /// Serializes this ExportProjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportProjectResponseCopyWith<ExportProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportProjectResponseCopyWith<$Res> {
  factory $ExportProjectResponseCopyWith(
    ExportProjectResponse value,
    $Res Function(ExportProjectResponse) then,
  ) = _$ExportProjectResponseCopyWithImpl<$Res, ExportProjectResponse>;
  @useResult
  $Res call({
    bool success,
    String message,
    String? downloadUrl,
    String? fileName,
    int? fileSize,
  });
}

/// @nodoc
class _$ExportProjectResponseCopyWithImpl<
  $Res,
  $Val extends ExportProjectResponse
>
    implements $ExportProjectResponseCopyWith<$Res> {
  _$ExportProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? downloadUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
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
            downloadUrl: freezed == downloadUrl
                ? _value.downloadUrl
                : downloadUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileName: freezed == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileSize: freezed == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExportProjectResponseImplCopyWith<$Res>
    implements $ExportProjectResponseCopyWith<$Res> {
  factory _$$ExportProjectResponseImplCopyWith(
    _$ExportProjectResponseImpl value,
    $Res Function(_$ExportProjectResponseImpl) then,
  ) = __$$ExportProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    String? downloadUrl,
    String? fileName,
    int? fileSize,
  });
}

/// @nodoc
class __$$ExportProjectResponseImplCopyWithImpl<$Res>
    extends
        _$ExportProjectResponseCopyWithImpl<$Res, _$ExportProjectResponseImpl>
    implements _$$ExportProjectResponseImplCopyWith<$Res> {
  __$$ExportProjectResponseImplCopyWithImpl(
    _$ExportProjectResponseImpl _value,
    $Res Function(_$ExportProjectResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? downloadUrl = freezed,
    Object? fileName = freezed,
    Object? fileSize = freezed,
  }) {
    return _then(
      _$ExportProjectResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        downloadUrl: freezed == downloadUrl
            ? _value.downloadUrl
            : downloadUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileName: freezed == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExportProjectResponseImpl implements _ExportProjectResponse {
  const _$ExportProjectResponseImpl({
    required this.success,
    required this.message,
    this.downloadUrl,
    this.fileName,
    this.fileSize,
  });

  factory _$ExportProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExportProjectResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final String? downloadUrl;
  @override
  final String? fileName;
  @override
  final int? fileSize;

  @override
  String toString() {
    return 'ExportProjectResponse(success: $success, message: $message, downloadUrl: $downloadUrl, fileName: $fileName, fileSize: $fileSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportProjectResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    downloadUrl,
    fileName,
    fileSize,
  );

  /// Create a copy of ExportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportProjectResponseImplCopyWith<_$ExportProjectResponseImpl>
  get copyWith =>
      __$$ExportProjectResponseImplCopyWithImpl<_$ExportProjectResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExportProjectResponseImplToJson(this);
  }
}

abstract class _ExportProjectResponse implements ExportProjectResponse {
  const factory _ExportProjectResponse({
    required final bool success,
    required final String message,
    final String? downloadUrl,
    final String? fileName,
    final int? fileSize,
  }) = _$ExportProjectResponseImpl;

  factory _ExportProjectResponse.fromJson(Map<String, dynamic> json) =
      _$ExportProjectResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  String? get downloadUrl;
  @override
  String? get fileName;
  @override
  int? get fileSize;

  /// Create a copy of ExportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportProjectResponseImplCopyWith<_$ExportProjectResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ImportProjectResponse _$ImportProjectResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ImportProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ImportProjectResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ImportStatistics? get statistics => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  List<String>? get warnings => throw _privateConstructorUsedError;

  /// Serializes this ImportProjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImportProjectResponseCopyWith<ImportProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportProjectResponseCopyWith<$Res> {
  factory $ImportProjectResponseCopyWith(
    ImportProjectResponse value,
    $Res Function(ImportProjectResponse) then,
  ) = _$ImportProjectResponseCopyWithImpl<$Res, ImportProjectResponse>;
  @useResult
  $Res call({
    bool success,
    String message,
    ImportStatistics? statistics,
    List<String>? errors,
    List<String>? warnings,
  });

  $ImportStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class _$ImportProjectResponseCopyWithImpl<
  $Res,
  $Val extends ImportProjectResponse
>
    implements $ImportProjectResponseCopyWith<$Res> {
  _$ImportProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? statistics = freezed,
    Object? errors = freezed,
    Object? warnings = freezed,
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
            statistics: freezed == statistics
                ? _value.statistics
                : statistics // ignore: cast_nullable_to_non_nullable
                      as ImportStatistics?,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            warnings: freezed == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImportStatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $ImportStatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImportProjectResponseImplCopyWith<$Res>
    implements $ImportProjectResponseCopyWith<$Res> {
  factory _$$ImportProjectResponseImplCopyWith(
    _$ImportProjectResponseImpl value,
    $Res Function(_$ImportProjectResponseImpl) then,
  ) = __$$ImportProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    ImportStatistics? statistics,
    List<String>? errors,
    List<String>? warnings,
  });

  @override
  $ImportStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class __$$ImportProjectResponseImplCopyWithImpl<$Res>
    extends
        _$ImportProjectResponseCopyWithImpl<$Res, _$ImportProjectResponseImpl>
    implements _$$ImportProjectResponseImplCopyWith<$Res> {
  __$$ImportProjectResponseImplCopyWithImpl(
    _$ImportProjectResponseImpl _value,
    $Res Function(_$ImportProjectResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? statistics = freezed,
    Object? errors = freezed,
    Object? warnings = freezed,
  }) {
    return _then(
      _$ImportProjectResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statistics: freezed == statistics
            ? _value.statistics
            : statistics // ignore: cast_nullable_to_non_nullable
                  as ImportStatistics?,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        warnings: freezed == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportProjectResponseImpl implements _ImportProjectResponse {
  const _$ImportProjectResponseImpl({
    required this.success,
    required this.message,
    this.statistics,
    final List<String>? errors,
    final List<String>? warnings,
  }) : _errors = errors,
       _warnings = warnings;

  factory _$ImportProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportProjectResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ImportStatistics? statistics;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _warnings;
  @override
  List<String>? get warnings {
    final value = _warnings;
    if (value == null) return null;
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImportProjectResponse(success: $success, message: $message, statistics: $statistics, errors: $errors, warnings: $warnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportProjectResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    statistics,
    const DeepCollectionEquality().hash(_errors),
    const DeepCollectionEquality().hash(_warnings),
  );

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportProjectResponseImplCopyWith<_$ImportProjectResponseImpl>
  get copyWith =>
      __$$ImportProjectResponseImplCopyWithImpl<_$ImportProjectResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportProjectResponseImplToJson(this);
  }
}

abstract class _ImportProjectResponse implements ImportProjectResponse {
  const factory _ImportProjectResponse({
    required final bool success,
    required final String message,
    final ImportStatistics? statistics,
    final List<String>? errors,
    final List<String>? warnings,
  }) = _$ImportProjectResponseImpl;

  factory _ImportProjectResponse.fromJson(Map<String, dynamic> json) =
      _$ImportProjectResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ImportStatistics? get statistics;
  @override
  List<String>? get errors;
  @override
  List<String>? get warnings;

  /// Create a copy of ImportProjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportProjectResponseImplCopyWith<_$ImportProjectResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ImportStatistics _$ImportStatisticsFromJson(Map<String, dynamic> json) {
  return _ImportStatistics.fromJson(json);
}

/// @nodoc
mixin _$ImportStatistics {
  int get totalRecords => throw _privateConstructorUsedError;
  int get successfulImports => throw _privateConstructorUsedError;
  int get failedImports => throw _privateConstructorUsedError;
  int get skippedRecords => throw _privateConstructorUsedError;
  int get duplicatesFound => throw _privateConstructorUsedError;
  Map<String, int>? get categoryBreakdown => throw _privateConstructorUsedError;

  /// Serializes this ImportStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImportStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImportStatisticsCopyWith<ImportStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportStatisticsCopyWith<$Res> {
  factory $ImportStatisticsCopyWith(
    ImportStatistics value,
    $Res Function(ImportStatistics) then,
  ) = _$ImportStatisticsCopyWithImpl<$Res, ImportStatistics>;
  @useResult
  $Res call({
    int totalRecords,
    int successfulImports,
    int failedImports,
    int skippedRecords,
    int duplicatesFound,
    Map<String, int>? categoryBreakdown,
  });
}

/// @nodoc
class _$ImportStatisticsCopyWithImpl<$Res, $Val extends ImportStatistics>
    implements $ImportStatisticsCopyWith<$Res> {
  _$ImportStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImportStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? successfulImports = null,
    Object? failedImports = null,
    Object? skippedRecords = null,
    Object? duplicatesFound = null,
    Object? categoryBreakdown = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalRecords: null == totalRecords
                ? _value.totalRecords
                : totalRecords // ignore: cast_nullable_to_non_nullable
                      as int,
            successfulImports: null == successfulImports
                ? _value.successfulImports
                : successfulImports // ignore: cast_nullable_to_non_nullable
                      as int,
            failedImports: null == failedImports
                ? _value.failedImports
                : failedImports // ignore: cast_nullable_to_non_nullable
                      as int,
            skippedRecords: null == skippedRecords
                ? _value.skippedRecords
                : skippedRecords // ignore: cast_nullable_to_non_nullable
                      as int,
            duplicatesFound: null == duplicatesFound
                ? _value.duplicatesFound
                : duplicatesFound // ignore: cast_nullable_to_non_nullable
                      as int,
            categoryBreakdown: freezed == categoryBreakdown
                ? _value.categoryBreakdown
                : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImportStatisticsImplCopyWith<$Res>
    implements $ImportStatisticsCopyWith<$Res> {
  factory _$$ImportStatisticsImplCopyWith(
    _$ImportStatisticsImpl value,
    $Res Function(_$ImportStatisticsImpl) then,
  ) = __$$ImportStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalRecords,
    int successfulImports,
    int failedImports,
    int skippedRecords,
    int duplicatesFound,
    Map<String, int>? categoryBreakdown,
  });
}

/// @nodoc
class __$$ImportStatisticsImplCopyWithImpl<$Res>
    extends _$ImportStatisticsCopyWithImpl<$Res, _$ImportStatisticsImpl>
    implements _$$ImportStatisticsImplCopyWith<$Res> {
  __$$ImportStatisticsImplCopyWithImpl(
    _$ImportStatisticsImpl _value,
    $Res Function(_$ImportStatisticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImportStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? successfulImports = null,
    Object? failedImports = null,
    Object? skippedRecords = null,
    Object? duplicatesFound = null,
    Object? categoryBreakdown = freezed,
  }) {
    return _then(
      _$ImportStatisticsImpl(
        totalRecords: null == totalRecords
            ? _value.totalRecords
            : totalRecords // ignore: cast_nullable_to_non_nullable
                  as int,
        successfulImports: null == successfulImports
            ? _value.successfulImports
            : successfulImports // ignore: cast_nullable_to_non_nullable
                  as int,
        failedImports: null == failedImports
            ? _value.failedImports
            : failedImports // ignore: cast_nullable_to_non_nullable
                  as int,
        skippedRecords: null == skippedRecords
            ? _value.skippedRecords
            : skippedRecords // ignore: cast_nullable_to_non_nullable
                  as int,
        duplicatesFound: null == duplicatesFound
            ? _value.duplicatesFound
            : duplicatesFound // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryBreakdown: freezed == categoryBreakdown
            ? _value._categoryBreakdown
            : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportStatisticsImpl implements _ImportStatistics {
  const _$ImportStatisticsImpl({
    this.totalRecords = 0,
    this.successfulImports = 0,
    this.failedImports = 0,
    this.skippedRecords = 0,
    this.duplicatesFound = 0,
    final Map<String, int>? categoryBreakdown,
  }) : _categoryBreakdown = categoryBreakdown;

  factory _$ImportStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportStatisticsImplFromJson(json);

  @override
  @JsonKey()
  final int totalRecords;
  @override
  @JsonKey()
  final int successfulImports;
  @override
  @JsonKey()
  final int failedImports;
  @override
  @JsonKey()
  final int skippedRecords;
  @override
  @JsonKey()
  final int duplicatesFound;
  final Map<String, int>? _categoryBreakdown;
  @override
  Map<String, int>? get categoryBreakdown {
    final value = _categoryBreakdown;
    if (value == null) return null;
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ImportStatistics(totalRecords: $totalRecords, successfulImports: $successfulImports, failedImports: $failedImports, skippedRecords: $skippedRecords, duplicatesFound: $duplicatesFound, categoryBreakdown: $categoryBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportStatisticsImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.successfulImports, successfulImports) ||
                other.successfulImports == successfulImports) &&
            (identical(other.failedImports, failedImports) ||
                other.failedImports == failedImports) &&
            (identical(other.skippedRecords, skippedRecords) ||
                other.skippedRecords == skippedRecords) &&
            (identical(other.duplicatesFound, duplicatesFound) ||
                other.duplicatesFound == duplicatesFound) &&
            const DeepCollectionEquality().equals(
              other._categoryBreakdown,
              _categoryBreakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalRecords,
    successfulImports,
    failedImports,
    skippedRecords,
    duplicatesFound,
    const DeepCollectionEquality().hash(_categoryBreakdown),
  );

  /// Create a copy of ImportStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportStatisticsImplCopyWith<_$ImportStatisticsImpl> get copyWith =>
      __$$ImportStatisticsImplCopyWithImpl<_$ImportStatisticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportStatisticsImplToJson(this);
  }
}

abstract class _ImportStatistics implements ImportStatistics {
  const factory _ImportStatistics({
    final int totalRecords,
    final int successfulImports,
    final int failedImports,
    final int skippedRecords,
    final int duplicatesFound,
    final Map<String, int>? categoryBreakdown,
  }) = _$ImportStatisticsImpl;

  factory _ImportStatistics.fromJson(Map<String, dynamic> json) =
      _$ImportStatisticsImpl.fromJson;

  @override
  int get totalRecords;
  @override
  int get successfulImports;
  @override
  int get failedImports;
  @override
  int get skippedRecords;
  @override
  int get duplicatesFound;
  @override
  Map<String, int>? get categoryBreakdown;

  /// Create a copy of ImportStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportStatisticsImplCopyWith<_$ImportStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CsvTaskData _$CsvTaskDataFromJson(Map<String, dynamic> json) {
  return _CsvTaskData.fromJson(json);
}

/// @nodoc
mixin _$CsvTaskData {
  String get taskName => throw _privateConstructorUsedError;
  String? get taskDescription => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  String? get estimatedTime => throw _privateConstructorUsedError;
  String? get actualTime => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;
  String? get difficultyRating => throw _privateConstructorUsedError;
  String? get energyLevelRequired => throw _privateConstructorUsedError;
  String? get completionPercentage => throw _privateConstructorUsedError;
  String? get isRecurring => throw _privateConstructorUsedError;
  String? get isPinned => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CsvTaskData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CsvTaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CsvTaskDataCopyWith<CsvTaskData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CsvTaskDataCopyWith<$Res> {
  factory $CsvTaskDataCopyWith(
    CsvTaskData value,
    $Res Function(CsvTaskData) then,
  ) = _$CsvTaskDataCopyWithImpl<$Res, CsvTaskData>;
  @useResult
  $Res call({
    String taskName,
    String? taskDescription,
    String? status,
    String? priority,
    String? dueDate,
    String? startDate,
    String? completedAt,
    String? tags,
    String? estimatedTime,
    String? actualTime,
    String? assignedTo,
    String? location,
    String? context,
    String? difficultyRating,
    String? energyLevelRequired,
    String? completionPercentage,
    String? isRecurring,
    String? isPinned,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class _$CsvTaskDataCopyWithImpl<$Res, $Val extends CsvTaskData>
    implements $CsvTaskDataCopyWith<$Res> {
  _$CsvTaskDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CsvTaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? taskDescription = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? dueDate = freezed,
    Object? startDate = freezed,
    Object? completedAt = freezed,
    Object? tags = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? assignedTo = freezed,
    Object? location = freezed,
    Object? context = freezed,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? completionPercentage = freezed,
    Object? isRecurring = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            taskName: null == taskName
                ? _value.taskName
                : taskName // ignore: cast_nullable_to_non_nullable
                      as String,
            taskDescription: freezed == taskDescription
                ? _value.taskDescription
                : taskDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String?,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as String?,
            estimatedTime: freezed == estimatedTime
                ? _value.estimatedTime
                : estimatedTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            actualTime: freezed == actualTime
                ? _value.actualTime
                : actualTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String?,
            difficultyRating: freezed == difficultyRating
                ? _value.difficultyRating
                : difficultyRating // ignore: cast_nullable_to_non_nullable
                      as String?,
            energyLevelRequired: freezed == energyLevelRequired
                ? _value.energyLevelRequired
                : energyLevelRequired // ignore: cast_nullable_to_non_nullable
                      as String?,
            completionPercentage: freezed == completionPercentage
                ? _value.completionPercentage
                : completionPercentage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRecurring: freezed == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPinned: freezed == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CsvTaskDataImplCopyWith<$Res>
    implements $CsvTaskDataCopyWith<$Res> {
  factory _$$CsvTaskDataImplCopyWith(
    _$CsvTaskDataImpl value,
    $Res Function(_$CsvTaskDataImpl) then,
  ) = __$$CsvTaskDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String taskName,
    String? taskDescription,
    String? status,
    String? priority,
    String? dueDate,
    String? startDate,
    String? completedAt,
    String? tags,
    String? estimatedTime,
    String? actualTime,
    String? assignedTo,
    String? location,
    String? context,
    String? difficultyRating,
    String? energyLevelRequired,
    String? completionPercentage,
    String? isRecurring,
    String? isPinned,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class __$$CsvTaskDataImplCopyWithImpl<$Res>
    extends _$CsvTaskDataCopyWithImpl<$Res, _$CsvTaskDataImpl>
    implements _$$CsvTaskDataImplCopyWith<$Res> {
  __$$CsvTaskDataImplCopyWithImpl(
    _$CsvTaskDataImpl _value,
    $Res Function(_$CsvTaskDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CsvTaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? taskDescription = freezed,
    Object? status = freezed,
    Object? priority = freezed,
    Object? dueDate = freezed,
    Object? startDate = freezed,
    Object? completedAt = freezed,
    Object? tags = freezed,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? assignedTo = freezed,
    Object? location = freezed,
    Object? context = freezed,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? completionPercentage = freezed,
    Object? isRecurring = freezed,
    Object? isPinned = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CsvTaskDataImpl(
        taskName: null == taskName
            ? _value.taskName
            : taskName // ignore: cast_nullable_to_non_nullable
                  as String,
        taskDescription: freezed == taskDescription
            ? _value.taskDescription
            : taskDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String?,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: freezed == tags
            ? _value.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as String?,
        estimatedTime: freezed == estimatedTime
            ? _value.estimatedTime
            : estimatedTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        actualTime: freezed == actualTime
            ? _value.actualTime
            : actualTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String?,
        difficultyRating: freezed == difficultyRating
            ? _value.difficultyRating
            : difficultyRating // ignore: cast_nullable_to_non_nullable
                  as String?,
        energyLevelRequired: freezed == energyLevelRequired
            ? _value.energyLevelRequired
            : energyLevelRequired // ignore: cast_nullable_to_non_nullable
                  as String?,
        completionPercentage: freezed == completionPercentage
            ? _value.completionPercentage
            : completionPercentage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRecurring: freezed == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPinned: freezed == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CsvTaskDataImpl implements _CsvTaskData {
  const _$CsvTaskDataImpl({
    required this.taskName,
    this.taskDescription,
    this.status,
    this.priority,
    this.dueDate,
    this.startDate,
    this.completedAt,
    this.tags,
    this.estimatedTime,
    this.actualTime,
    this.assignedTo,
    this.location,
    this.context,
    this.difficultyRating,
    this.energyLevelRequired,
    this.completionPercentage,
    this.isRecurring,
    this.isPinned,
    this.createdAt,
    this.updatedAt,
  });

  factory _$CsvTaskDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CsvTaskDataImplFromJson(json);

  @override
  final String taskName;
  @override
  final String? taskDescription;
  @override
  final String? status;
  @override
  final String? priority;
  @override
  final String? dueDate;
  @override
  final String? startDate;
  @override
  final String? completedAt;
  @override
  final String? tags;
  @override
  final String? estimatedTime;
  @override
  final String? actualTime;
  @override
  final String? assignedTo;
  @override
  final String? location;
  @override
  final String? context;
  @override
  final String? difficultyRating;
  @override
  final String? energyLevelRequired;
  @override
  final String? completionPercentage;
  @override
  final String? isRecurring;
  @override
  final String? isPinned;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'CsvTaskData(taskName: $taskName, taskDescription: $taskDescription, status: $status, priority: $priority, dueDate: $dueDate, startDate: $startDate, completedAt: $completedAt, tags: $tags, estimatedTime: $estimatedTime, actualTime: $actualTime, assignedTo: $assignedTo, location: $location, context: $context, difficultyRating: $difficultyRating, energyLevelRequired: $energyLevelRequired, completionPercentage: $completionPercentage, isRecurring: $isRecurring, isPinned: $isPinned, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CsvTaskDataImpl &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.difficultyRating, difficultyRating) ||
                other.difficultyRating == difficultyRating) &&
            (identical(other.energyLevelRequired, energyLevelRequired) ||
                other.energyLevelRequired == energyLevelRequired) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    taskName,
    taskDescription,
    status,
    priority,
    dueDate,
    startDate,
    completedAt,
    tags,
    estimatedTime,
    actualTime,
    assignedTo,
    location,
    context,
    difficultyRating,
    energyLevelRequired,
    completionPercentage,
    isRecurring,
    isPinned,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of CsvTaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CsvTaskDataImplCopyWith<_$CsvTaskDataImpl> get copyWith =>
      __$$CsvTaskDataImplCopyWithImpl<_$CsvTaskDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CsvTaskDataImplToJson(this);
  }
}

abstract class _CsvTaskData implements CsvTaskData {
  const factory _CsvTaskData({
    required final String taskName,
    final String? taskDescription,
    final String? status,
    final String? priority,
    final String? dueDate,
    final String? startDate,
    final String? completedAt,
    final String? tags,
    final String? estimatedTime,
    final String? actualTime,
    final String? assignedTo,
    final String? location,
    final String? context,
    final String? difficultyRating,
    final String? energyLevelRequired,
    final String? completionPercentage,
    final String? isRecurring,
    final String? isPinned,
    final String? createdAt,
    final String? updatedAt,
  }) = _$CsvTaskDataImpl;

  factory _CsvTaskData.fromJson(Map<String, dynamic> json) =
      _$CsvTaskDataImpl.fromJson;

  @override
  String get taskName;
  @override
  String? get taskDescription;
  @override
  String? get status;
  @override
  String? get priority;
  @override
  String? get dueDate;
  @override
  String? get startDate;
  @override
  String? get completedAt;
  @override
  String? get tags;
  @override
  String? get estimatedTime;
  @override
  String? get actualTime;
  @override
  String? get assignedTo;
  @override
  String? get location;
  @override
  String? get context;
  @override
  String? get difficultyRating;
  @override
  String? get energyLevelRequired;
  @override
  String? get completionPercentage;
  @override
  String? get isRecurring;
  @override
  String? get isPinned;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of CsvTaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CsvTaskDataImplCopyWith<_$CsvTaskDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImportValidationRequest _$ImportValidationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ImportValidationRequest.fromJson(json);
}

/// @nodoc
mixin _$ImportValidationRequest {
  String get projectId => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  List<CsvTaskData> get tasks => throw _privateConstructorUsedError;

  /// Serializes this ImportValidationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImportValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImportValidationRequestCopyWith<ImportValidationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportValidationRequestCopyWith<$Res> {
  factory $ImportValidationRequestCopyWith(
    ImportValidationRequest value,
    $Res Function(ImportValidationRequest) then,
  ) = _$ImportValidationRequestCopyWithImpl<$Res, ImportValidationRequest>;
  @useResult
  $Res call({String projectId, String fileName, List<CsvTaskData> tasks});
}

/// @nodoc
class _$ImportValidationRequestCopyWithImpl<
  $Res,
  $Val extends ImportValidationRequest
>
    implements $ImportValidationRequestCopyWith<$Res> {
  _$ImportValidationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImportValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? fileName = null,
    Object? tasks = null,
  }) {
    return _then(
      _value.copyWith(
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            fileName: null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String,
            tasks: null == tasks
                ? _value.tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                      as List<CsvTaskData>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImportValidationRequestImplCopyWith<$Res>
    implements $ImportValidationRequestCopyWith<$Res> {
  factory _$$ImportValidationRequestImplCopyWith(
    _$ImportValidationRequestImpl value,
    $Res Function(_$ImportValidationRequestImpl) then,
  ) = __$$ImportValidationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, String fileName, List<CsvTaskData> tasks});
}

/// @nodoc
class __$$ImportValidationRequestImplCopyWithImpl<$Res>
    extends
        _$ImportValidationRequestCopyWithImpl<
          $Res,
          _$ImportValidationRequestImpl
        >
    implements _$$ImportValidationRequestImplCopyWith<$Res> {
  __$$ImportValidationRequestImplCopyWithImpl(
    _$ImportValidationRequestImpl _value,
    $Res Function(_$ImportValidationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImportValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? fileName = null,
    Object? tasks = null,
  }) {
    return _then(
      _$ImportValidationRequestImpl(
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        fileName: null == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String,
        tasks: null == tasks
            ? _value._tasks
            : tasks // ignore: cast_nullable_to_non_nullable
                  as List<CsvTaskData>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportValidationRequestImpl implements _ImportValidationRequest {
  const _$ImportValidationRequestImpl({
    required this.projectId,
    required this.fileName,
    required final List<CsvTaskData> tasks,
  }) : _tasks = tasks;

  factory _$ImportValidationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportValidationRequestImplFromJson(json);

  @override
  final String projectId;
  @override
  final String fileName;
  final List<CsvTaskData> _tasks;
  @override
  List<CsvTaskData> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'ImportValidationRequest(projectId: $projectId, fileName: $fileName, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportValidationRequestImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectId,
    fileName,
    const DeepCollectionEquality().hash(_tasks),
  );

  /// Create a copy of ImportValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportValidationRequestImplCopyWith<_$ImportValidationRequestImpl>
  get copyWith =>
      __$$ImportValidationRequestImplCopyWithImpl<
        _$ImportValidationRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportValidationRequestImplToJson(this);
  }
}

abstract class _ImportValidationRequest implements ImportValidationRequest {
  const factory _ImportValidationRequest({
    required final String projectId,
    required final String fileName,
    required final List<CsvTaskData> tasks,
  }) = _$ImportValidationRequestImpl;

  factory _ImportValidationRequest.fromJson(Map<String, dynamic> json) =
      _$ImportValidationRequestImpl.fromJson;

  @override
  String get projectId;
  @override
  String get fileName;
  @override
  List<CsvTaskData> get tasks;

  /// Create a copy of ImportValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportValidationRequestImplCopyWith<_$ImportValidationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ImportValidationResponse _$ImportValidationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ImportValidationResponse.fromJson(json);
}

/// @nodoc
mixin _$ImportValidationResponse {
  bool get isValid => throw _privateConstructorUsedError;
  List<String> get errors => throw _privateConstructorUsedError;
  List<String> get warnings => throw _privateConstructorUsedError;
  ImportStatistics? get previewStatistics => throw _privateConstructorUsedError;

  /// Serializes this ImportValidationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImportValidationResponseCopyWith<ImportValidationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportValidationResponseCopyWith<$Res> {
  factory $ImportValidationResponseCopyWith(
    ImportValidationResponse value,
    $Res Function(ImportValidationResponse) then,
  ) = _$ImportValidationResponseCopyWithImpl<$Res, ImportValidationResponse>;
  @useResult
  $Res call({
    bool isValid,
    List<String> errors,
    List<String> warnings,
    ImportStatistics? previewStatistics,
  });

  $ImportStatisticsCopyWith<$Res>? get previewStatistics;
}

/// @nodoc
class _$ImportValidationResponseCopyWithImpl<
  $Res,
  $Val extends ImportValidationResponse
>
    implements $ImportValidationResponseCopyWith<$Res> {
  _$ImportValidationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = null,
    Object? warnings = null,
    Object? previewStatistics = freezed,
  }) {
    return _then(
      _value.copyWith(
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            errors: null == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            warnings: null == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            previewStatistics: freezed == previewStatistics
                ? _value.previewStatistics
                : previewStatistics // ignore: cast_nullable_to_non_nullable
                      as ImportStatistics?,
          )
          as $Val,
    );
  }

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImportStatisticsCopyWith<$Res>? get previewStatistics {
    if (_value.previewStatistics == null) {
      return null;
    }

    return $ImportStatisticsCopyWith<$Res>(_value.previewStatistics!, (value) {
      return _then(_value.copyWith(previewStatistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImportValidationResponseImplCopyWith<$Res>
    implements $ImportValidationResponseCopyWith<$Res> {
  factory _$$ImportValidationResponseImplCopyWith(
    _$ImportValidationResponseImpl value,
    $Res Function(_$ImportValidationResponseImpl) then,
  ) = __$$ImportValidationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isValid,
    List<String> errors,
    List<String> warnings,
    ImportStatistics? previewStatistics,
  });

  @override
  $ImportStatisticsCopyWith<$Res>? get previewStatistics;
}

/// @nodoc
class __$$ImportValidationResponseImplCopyWithImpl<$Res>
    extends
        _$ImportValidationResponseCopyWithImpl<
          $Res,
          _$ImportValidationResponseImpl
        >
    implements _$$ImportValidationResponseImplCopyWith<$Res> {
  __$$ImportValidationResponseImplCopyWithImpl(
    _$ImportValidationResponseImpl _value,
    $Res Function(_$ImportValidationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = null,
    Object? warnings = null,
    Object? previewStatistics = freezed,
  }) {
    return _then(
      _$ImportValidationResponseImpl(
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        errors: null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        warnings: null == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        previewStatistics: freezed == previewStatistics
            ? _value.previewStatistics
            : previewStatistics // ignore: cast_nullable_to_non_nullable
                  as ImportStatistics?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportValidationResponseImpl implements _ImportValidationResponse {
  const _$ImportValidationResponseImpl({
    required this.isValid,
    required final List<String> errors,
    required final List<String> warnings,
    this.previewStatistics,
  }) : _errors = errors,
       _warnings = warnings;

  factory _$ImportValidationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportValidationResponseImplFromJson(json);

  @override
  final bool isValid;
  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  final List<String> _warnings;
  @override
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  @override
  final ImportStatistics? previewStatistics;

  @override
  String toString() {
    return 'ImportValidationResponse(isValid: $isValid, errors: $errors, warnings: $warnings, previewStatistics: $previewStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportValidationResponseImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            (identical(other.previewStatistics, previewStatistics) ||
                other.previewStatistics == previewStatistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isValid,
    const DeepCollectionEquality().hash(_errors),
    const DeepCollectionEquality().hash(_warnings),
    previewStatistics,
  );

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportValidationResponseImplCopyWith<_$ImportValidationResponseImpl>
  get copyWith =>
      __$$ImportValidationResponseImplCopyWithImpl<
        _$ImportValidationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportValidationResponseImplToJson(this);
  }
}

abstract class _ImportValidationResponse implements ImportValidationResponse {
  const factory _ImportValidationResponse({
    required final bool isValid,
    required final List<String> errors,
    required final List<String> warnings,
    final ImportStatistics? previewStatistics,
  }) = _$ImportValidationResponseImpl;

  factory _ImportValidationResponse.fromJson(Map<String, dynamic> json) =
      _$ImportValidationResponseImpl.fromJson;

  @override
  bool get isValid;
  @override
  List<String> get errors;
  @override
  List<String> get warnings;
  @override
  ImportStatistics? get previewStatistics;

  /// Create a copy of ImportValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportValidationResponseImplCopyWith<_$ImportValidationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
