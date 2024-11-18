// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_compensation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobCompensation _$JobCompensationFromJson(Map<String, dynamic> json) {
  return _JobCompensation.fromJson(json);
}

/// @nodoc
mixin _$JobCompensation {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get salaryInfo => throw _privateConstructorUsedError;

  /// Serializes this JobCompensation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobCompensation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobCompensationCopyWith<JobCompensation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCompensationCopyWith<$Res> {
  factory $JobCompensationCopyWith(
          JobCompensation value, $Res Function(JobCompensation) then) =
      _$JobCompensationCopyWithImpl<$Res, JobCompensation>;
  @useResult
  $Res call({String? code, String? name, List<String>? salaryInfo});
}

/// @nodoc
class _$JobCompensationCopyWithImpl<$Res, $Val extends JobCompensation>
    implements $JobCompensationCopyWith<$Res> {
  _$JobCompensationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobCompensation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? salaryInfo = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryInfo: freezed == salaryInfo
          ? _value.salaryInfo
          : salaryInfo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobCompensationImplCopyWith<$Res>
    implements $JobCompensationCopyWith<$Res> {
  factory _$$JobCompensationImplCopyWith(_$JobCompensationImpl value,
          $Res Function(_$JobCompensationImpl) then) =
      __$$JobCompensationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? name, List<String>? salaryInfo});
}

/// @nodoc
class __$$JobCompensationImplCopyWithImpl<$Res>
    extends _$JobCompensationCopyWithImpl<$Res, _$JobCompensationImpl>
    implements _$$JobCompensationImplCopyWith<$Res> {
  __$$JobCompensationImplCopyWithImpl(
      _$JobCompensationImpl _value, $Res Function(_$JobCompensationImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobCompensation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? salaryInfo = freezed,
  }) {
    return _then(_$JobCompensationImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryInfo: freezed == salaryInfo
          ? _value._salaryInfo
          : salaryInfo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$JobCompensationImpl extends _JobCompensation {
  const _$JobCompensationImpl(
      {this.code, this.name, final List<String>? salaryInfo})
      : _salaryInfo = salaryInfo,
        super._();

  factory _$JobCompensationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobCompensationImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  final List<String>? _salaryInfo;
  @override
  List<String>? get salaryInfo {
    final value = _salaryInfo;
    if (value == null) return null;
    if (_salaryInfo is EqualUnmodifiableListView) return _salaryInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JobCompensation(code: $code, name: $name, salaryInfo: $salaryInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobCompensationImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._salaryInfo, _salaryInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name,
      const DeepCollectionEquality().hash(_salaryInfo));

  /// Create a copy of JobCompensation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobCompensationImplCopyWith<_$JobCompensationImpl> get copyWith =>
      __$$JobCompensationImplCopyWithImpl<_$JobCompensationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobCompensationImplToJson(
      this,
    );
  }
}

abstract class _JobCompensation extends JobCompensation {
  const factory _JobCompensation(
      {final String? code,
      final String? name,
      final List<String>? salaryInfo}) = _$JobCompensationImpl;
  const _JobCompensation._() : super._();

  factory _JobCompensation.fromJson(Map<String, dynamic> json) =
      _$JobCompensationImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  List<String>? get salaryInfo;

  /// Create a copy of JobCompensation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobCompensationImplCopyWith<_$JobCompensationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
