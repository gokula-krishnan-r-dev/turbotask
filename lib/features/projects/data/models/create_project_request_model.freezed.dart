// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateProjectRequestModel _$CreateProjectRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _CreateProjectRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectRequestModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_theme')
  String get colorTheme => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CreateProjectRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateProjectRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProjectRequestModelCopyWith<CreateProjectRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectRequestModelCopyWith<$Res> {
  factory $CreateProjectRequestModelCopyWith(
    CreateProjectRequestModel value,
    $Res Function(CreateProjectRequestModel) then,
  ) = _$CreateProjectRequestModelCopyWithImpl<$Res, CreateProjectRequestModel>;
  @useResult
  $Res call({
    String title,
    String description,
    String category,
    @JsonKey(name: 'color_theme') String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class _$CreateProjectRequestModelCopyWithImpl<
  $Res,
  $Val extends CreateProjectRequestModel
>
    implements $CreateProjectRequestModelCopyWith<$Res> {
  _$CreateProjectRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProjectRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? colorTheme = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateProjectRequestModelImplCopyWith<$Res>
    implements $CreateProjectRequestModelCopyWith<$Res> {
  factory _$$CreateProjectRequestModelImplCopyWith(
    _$CreateProjectRequestModelImpl value,
    $Res Function(_$CreateProjectRequestModelImpl) then,
  ) = __$$CreateProjectRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    String category,
    @JsonKey(name: 'color_theme') String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
  });
}

/// @nodoc
class __$$CreateProjectRequestModelImplCopyWithImpl<$Res>
    extends
        _$CreateProjectRequestModelCopyWithImpl<
          $Res,
          _$CreateProjectRequestModelImpl
        >
    implements _$$CreateProjectRequestModelImplCopyWith<$Res> {
  __$$CreateProjectRequestModelImplCopyWithImpl(
    _$CreateProjectRequestModelImpl _value,
    $Res Function(_$CreateProjectRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateProjectRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? colorTheme = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$CreateProjectRequestModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProjectRequestModelImpl extends _CreateProjectRequestModel {
  const _$CreateProjectRequestModelImpl({
    required this.title,
    required this.description,
    required this.category,
    @JsonKey(name: 'color_theme') required this.colorTheme,
    @JsonKey(name: 'image_url') this.imageUrl,
  }) : super._();

  factory _$CreateProjectRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProjectRequestModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey(name: 'color_theme')
  final String colorTheme;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'CreateProjectRequestModel(title: $title, description: $description, category: $category, colorTheme: $colorTheme, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectRequestModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    category,
    colorTheme,
    imageUrl,
  );

  /// Create a copy of CreateProjectRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectRequestModelImplCopyWith<_$CreateProjectRequestModelImpl>
  get copyWith =>
      __$$CreateProjectRequestModelImplCopyWithImpl<
        _$CreateProjectRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProjectRequestModelImplToJson(this);
  }
}

abstract class _CreateProjectRequestModel extends CreateProjectRequestModel {
  const factory _CreateProjectRequestModel({
    required final String title,
    required final String description,
    required final String category,
    @JsonKey(name: 'color_theme') required final String colorTheme,
    @JsonKey(name: 'image_url') final String? imageUrl,
  }) = _$CreateProjectRequestModelImpl;
  const _CreateProjectRequestModel._() : super._();

  factory _CreateProjectRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateProjectRequestModelImpl.fromJson;

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

  /// Create a copy of CreateProjectRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProjectRequestModelImplCopyWith<_$CreateProjectRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
