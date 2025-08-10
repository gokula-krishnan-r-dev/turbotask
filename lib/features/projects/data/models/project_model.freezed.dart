// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_theme')
  String get colorTheme => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_percentage')
  int get progressPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'todo_count')
  int get todoCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_count')
  int get completedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
    ProjectModel value,
    $Res Function(ProjectModel) then,
  ) = _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String? userId,
    String title,
    String description,
    String category,
    @JsonKey(name: 'color_theme') String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_favorite') bool isFavorite,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'progress_percentage') int progressPercentage,
    @JsonKey(name: 'todo_count') int todoCount,
    @JsonKey(name: 'completed_count') int completedCount,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? colorTheme = null,
    Object? imageUrl = freezed,
    Object? isFavorite = null,
    Object? isArchived = null,
    Object? progressPercentage = null,
    Object? todoCount = null,
    Object? completedCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            colorTheme: null == colorTheme
                ? _value.colorTheme
                : colorTheme // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
            progressPercentage: null == progressPercentage
                ? _value.progressPercentage
                : progressPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            todoCount: null == todoCount
                ? _value.todoCount
                : todoCount // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
    _$ProjectModelImpl value,
    $Res Function(_$ProjectModelImpl) then,
  ) = __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String? userId,
    String title,
    String description,
    String category,
    @JsonKey(name: 'color_theme') String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_favorite') bool isFavorite,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'progress_percentage') int progressPercentage,
    @JsonKey(name: 'todo_count') int todoCount,
    @JsonKey(name: 'completed_count') int completedCount,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
    _$ProjectModelImpl _value,
    $Res Function(_$ProjectModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? colorTheme = null,
    Object? imageUrl = freezed,
    Object? isFavorite = null,
    Object? isArchived = null,
    Object? progressPercentage = null,
    Object? todoCount = null,
    Object? completedCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ProjectModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        colorTheme: null == colorTheme
            ? _value.colorTheme
            : colorTheme // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
        progressPercentage: null == progressPercentage
            ? _value.progressPercentage
            : progressPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
        todoCount: null == todoCount
            ? _value.todoCount
            : todoCount // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$ProjectModelImpl extends _ProjectModel {
  const _$ProjectModelImpl({
    required this.id,
    @JsonKey(name: 'user_id') this.userId,
    required this.title,
    this.description = 'No description',
    this.category = 'work',
    @JsonKey(name: 'color_theme') this.colorTheme = '#8DE0C8',
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'is_favorite') this.isFavorite = false,
    @JsonKey(name: 'is_archived') this.isArchived = false,
    @JsonKey(name: 'progress_percentage') this.progressPercentage = 0,
    @JsonKey(name: 'todo_count') this.todoCount = 0,
    @JsonKey(name: 'completed_count') this.completedCount = 0,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
  }) : super._();

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey(name: 'color_theme')
  final String colorTheme;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @override
  @JsonKey(name: 'progress_percentage')
  final int progressPercentage;
  @override
  @JsonKey(name: 'todo_count')
  final int todoCount;
  @override
  @JsonKey(name: 'completed_count')
  final int completedCount;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'ProjectModel(id: $id, userId: $userId, title: $title, description: $description, category: $category, colorTheme: $colorTheme, imageUrl: $imageUrl, isFavorite: $isFavorite, isArchived: $isArchived, progressPercentage: $progressPercentage, todoCount: $todoCount, completedCount: $completedCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.todoCount, todoCount) ||
                other.todoCount == todoCount) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    title,
    description,
    category,
    colorTheme,
    imageUrl,
    isFavorite,
    isArchived,
    progressPercentage,
    todoCount,
    completedCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(this);
  }
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel({
    required final String id,
    @JsonKey(name: 'user_id') final String? userId,
    required final String title,
    final String description,
    final String category,
    @JsonKey(name: 'color_theme') final String colorTheme,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'is_favorite') final bool isFavorite,
    @JsonKey(name: 'is_archived') final bool isArchived,
    @JsonKey(name: 'progress_percentage') final int progressPercentage,
    @JsonKey(name: 'todo_count') final int todoCount,
    @JsonKey(name: 'completed_count') final int completedCount,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
  }) = _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  @JsonKey(name: 'color_theme')
  String get colorTheme;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  @JsonKey(name: 'progress_percentage')
  int get progressPercentage;
  @override
  @JsonKey(name: 'todo_count')
  int get todoCount;
  @override
  @JsonKey(name: 'completed_count')
  int get completedCount;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
