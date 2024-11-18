// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_fulfillment_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobFulfillmentCategory _$JobFulfillmentCategoryFromJson(
    Map<String, dynamic> json) {
  return _JobFulfillmentCategory.fromJson(json);
}

/// @nodoc
mixin _$JobFulfillmentCategory {
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this JobFulfillmentCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobFulfillmentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobFulfillmentCategoryCopyWith<JobFulfillmentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobFulfillmentCategoryCopyWith<$Res> {
  factory $JobFulfillmentCategoryCopyWith(JobFulfillmentCategory value,
          $Res Function(JobFulfillmentCategory) then) =
      _$JobFulfillmentCategoryCopyWithImpl<$Res, JobFulfillmentCategory>;
  @useResult
  $Res call({String? id, String? type});
}

/// @nodoc
class _$JobFulfillmentCategoryCopyWithImpl<$Res,
        $Val extends JobFulfillmentCategory>
    implements $JobFulfillmentCategoryCopyWith<$Res> {
  _$JobFulfillmentCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobFulfillmentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobFulfillmentCategoryImplCopyWith<$Res>
    implements $JobFulfillmentCategoryCopyWith<$Res> {
  factory _$$JobFulfillmentCategoryImplCopyWith(
          _$JobFulfillmentCategoryImpl value,
          $Res Function(_$JobFulfillmentCategoryImpl) then) =
      __$$JobFulfillmentCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? type});
}

/// @nodoc
class __$$JobFulfillmentCategoryImplCopyWithImpl<$Res>
    extends _$JobFulfillmentCategoryCopyWithImpl<$Res,
        _$JobFulfillmentCategoryImpl>
    implements _$$JobFulfillmentCategoryImplCopyWith<$Res> {
  __$$JobFulfillmentCategoryImplCopyWithImpl(
      _$JobFulfillmentCategoryImpl _value,
      $Res Function(_$JobFulfillmentCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobFulfillmentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_$JobFulfillmentCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$JobFulfillmentCategoryImpl extends _JobFulfillmentCategory {
  const _$JobFulfillmentCategoryImpl({this.id, this.type}) : super._();

  factory _$JobFulfillmentCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobFulfillmentCategoryImplFromJson(json);

  @override
  final String? id;
  @override
  final String? type;

  @override
  String toString() {
    return 'JobFulfillmentCategory(id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobFulfillmentCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  /// Create a copy of JobFulfillmentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobFulfillmentCategoryImplCopyWith<_$JobFulfillmentCategoryImpl>
      get copyWith => __$$JobFulfillmentCategoryImplCopyWithImpl<
          _$JobFulfillmentCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobFulfillmentCategoryImplToJson(
      this,
    );
  }
}

abstract class _JobFulfillmentCategory extends JobFulfillmentCategory {
  const factory _JobFulfillmentCategory(
      {final String? id, final String? type}) = _$JobFulfillmentCategoryImpl;
  const _JobFulfillmentCategory._() : super._();

  factory _JobFulfillmentCategory.fromJson(Map<String, dynamic> json) =
      _$JobFulfillmentCategoryImpl.fromJson;

  @override
  String? get id;
  @override
  String? get type;

  /// Create a copy of JobFulfillmentCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobFulfillmentCategoryImplCopyWith<_$JobFulfillmentCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
