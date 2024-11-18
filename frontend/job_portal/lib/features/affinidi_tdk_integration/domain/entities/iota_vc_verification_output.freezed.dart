// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iota_vc_verification_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IotaVCVerificationOutput _$IotaVCVerificationOutputFromJson(
    Map<String, dynamic> json) {
  return _IotaVCVerificationOutput.fromJson(json);
}

/// @nodoc
mixin _$IotaVCVerificationOutput {
  bool? get isValid => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;

  /// Serializes this IotaVCVerificationOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IotaVCVerificationOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IotaVCVerificationOutputCopyWith<IotaVCVerificationOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IotaVCVerificationOutputCopyWith<$Res> {
  factory $IotaVCVerificationOutputCopyWith(IotaVCVerificationOutput value,
          $Res Function(IotaVCVerificationOutput) then) =
      _$IotaVCVerificationOutputCopyWithImpl<$Res, IotaVCVerificationOutput>;
  @useResult
  $Res call({bool? isValid, List<String>? errors});
}

/// @nodoc
class _$IotaVCVerificationOutputCopyWithImpl<$Res,
        $Val extends IotaVCVerificationOutput>
    implements $IotaVCVerificationOutputCopyWith<$Res> {
  _$IotaVCVerificationOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IotaVCVerificationOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IotaVCVerificationOutputImplCopyWith<$Res>
    implements $IotaVCVerificationOutputCopyWith<$Res> {
  factory _$$IotaVCVerificationOutputImplCopyWith(
          _$IotaVCVerificationOutputImpl value,
          $Res Function(_$IotaVCVerificationOutputImpl) then) =
      __$$IotaVCVerificationOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isValid, List<String>? errors});
}

/// @nodoc
class __$$IotaVCVerificationOutputImplCopyWithImpl<$Res>
    extends _$IotaVCVerificationOutputCopyWithImpl<$Res,
        _$IotaVCVerificationOutputImpl>
    implements _$$IotaVCVerificationOutputImplCopyWith<$Res> {
  __$$IotaVCVerificationOutputImplCopyWithImpl(
      _$IotaVCVerificationOutputImpl _value,
      $Res Function(_$IotaVCVerificationOutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of IotaVCVerificationOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$IotaVCVerificationOutputImpl(
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$IotaVCVerificationOutputImpl extends _IotaVCVerificationOutput {
  const _$IotaVCVerificationOutputImpl(
      {this.isValid, final List<String>? errors})
      : _errors = errors,
        super._();

  factory _$IotaVCVerificationOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$IotaVCVerificationOutputImplFromJson(json);

  @override
  final bool? isValid;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IotaVCVerificationOutput(isValid: $isValid, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IotaVCVerificationOutputImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isValid, const DeepCollectionEquality().hash(_errors));

  /// Create a copy of IotaVCVerificationOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IotaVCVerificationOutputImplCopyWith<_$IotaVCVerificationOutputImpl>
      get copyWith => __$$IotaVCVerificationOutputImplCopyWithImpl<
          _$IotaVCVerificationOutputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IotaVCVerificationOutputImplToJson(
      this,
    );
  }
}

abstract class _IotaVCVerificationOutput extends IotaVCVerificationOutput {
  const factory _IotaVCVerificationOutput(
      {final bool? isValid,
      final List<String>? errors}) = _$IotaVCVerificationOutputImpl;
  const _IotaVCVerificationOutput._() : super._();

  factory _IotaVCVerificationOutput.fromJson(Map<String, dynamic> json) =
      _$IotaVCVerificationOutputImpl.fromJson;

  @override
  bool? get isValid;
  @override
  List<String>? get errors;

  /// Create a copy of IotaVCVerificationOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IotaVCVerificationOutputImplCopyWith<_$IotaVCVerificationOutputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
