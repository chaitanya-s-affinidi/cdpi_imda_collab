// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CredentialWrapper _$CredentialWrapperFromJson(Map<String, dynamic> json) {
  return _CredentialWrapper.fromJson(json);
}

/// @nodoc
mixin _$CredentialWrapper {
  Map<String, dynamic>? get vc => throw _privateConstructorUsedError;
  bool? get isValid => throw _privateConstructorUsedError;

  /// Serializes this CredentialWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CredentialWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CredentialWrapperCopyWith<CredentialWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialWrapperCopyWith<$Res> {
  factory $CredentialWrapperCopyWith(
          CredentialWrapper value, $Res Function(CredentialWrapper) then) =
      _$CredentialWrapperCopyWithImpl<$Res, CredentialWrapper>;
  @useResult
  $Res call({Map<String, dynamic>? vc, bool? isValid});
}

/// @nodoc
class _$CredentialWrapperCopyWithImpl<$Res, $Val extends CredentialWrapper>
    implements $CredentialWrapperCopyWith<$Res> {
  _$CredentialWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CredentialWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vc = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      vc: freezed == vc
          ? _value.vc
          : vc // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CredentialWrapperImplCopyWith<$Res>
    implements $CredentialWrapperCopyWith<$Res> {
  factory _$$CredentialWrapperImplCopyWith(_$CredentialWrapperImpl value,
          $Res Function(_$CredentialWrapperImpl) then) =
      __$$CredentialWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? vc, bool? isValid});
}

/// @nodoc
class __$$CredentialWrapperImplCopyWithImpl<$Res>
    extends _$CredentialWrapperCopyWithImpl<$Res, _$CredentialWrapperImpl>
    implements _$$CredentialWrapperImplCopyWith<$Res> {
  __$$CredentialWrapperImplCopyWithImpl(_$CredentialWrapperImpl _value,
      $Res Function(_$CredentialWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of CredentialWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vc = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_$CredentialWrapperImpl(
      vc: freezed == vc
          ? _value._vc
          : vc // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CredentialWrapperImpl extends _CredentialWrapper {
  const _$CredentialWrapperImpl({final Map<String, dynamic>? vc, this.isValid})
      : _vc = vc,
        super._();

  factory _$CredentialWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialWrapperImplFromJson(json);

  final Map<String, dynamic>? _vc;
  @override
  Map<String, dynamic>? get vc {
    final value = _vc;
    if (value == null) return null;
    if (_vc is EqualUnmodifiableMapView) return _vc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? isValid;

  @override
  String toString() {
    return 'CredentialWrapper(vc: $vc, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialWrapperImpl &&
            const DeepCollectionEquality().equals(other._vc, _vc) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_vc), isValid);

  /// Create a copy of CredentialWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialWrapperImplCopyWith<_$CredentialWrapperImpl> get copyWith =>
      __$$CredentialWrapperImplCopyWithImpl<_$CredentialWrapperImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialWrapperImplToJson(
      this,
    );
  }
}

abstract class _CredentialWrapper extends CredentialWrapper {
  const factory _CredentialWrapper(
      {final Map<String, dynamic>? vc,
      final bool? isValid}) = _$CredentialWrapperImpl;
  const _CredentialWrapper._() : super._();

  factory _CredentialWrapper.fromJson(Map<String, dynamic> json) =
      _$CredentialWrapperImpl.fromJson;

  @override
  Map<String, dynamic>? get vc;
  @override
  bool? get isValid;

  /// Create a copy of CredentialWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialWrapperImplCopyWith<_$CredentialWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
