// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_iota_response_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetIotaResponseOutput _$GetIotaResponseOutputFromJson(
    Map<String, dynamic> json) {
  return _GetIotaResponseOutput.fromJson(json);
}

/// @nodoc
mixin _$GetIotaResponseOutput {
  VerifiablePresentation get vp => throw _privateConstructorUsedError;
  String get nonce => throw _privateConstructorUsedError;

  /// Serializes this GetIotaResponseOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetIotaResponseOutputCopyWith<GetIotaResponseOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetIotaResponseOutputCopyWith<$Res> {
  factory $GetIotaResponseOutputCopyWith(GetIotaResponseOutput value,
          $Res Function(GetIotaResponseOutput) then) =
      _$GetIotaResponseOutputCopyWithImpl<$Res, GetIotaResponseOutput>;
  @useResult
  $Res call({VerifiablePresentation vp, String nonce});

  $VerifiablePresentationCopyWith<$Res> get vp;
}

/// @nodoc
class _$GetIotaResponseOutputCopyWithImpl<$Res,
        $Val extends GetIotaResponseOutput>
    implements $GetIotaResponseOutputCopyWith<$Res> {
  _$GetIotaResponseOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vp = null,
    Object? nonce = null,
  }) {
    return _then(_value.copyWith(
      vp: null == vp
          ? _value.vp
          : vp // ignore: cast_nullable_to_non_nullable
              as VerifiablePresentation,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifiablePresentationCopyWith<$Res> get vp {
    return $VerifiablePresentationCopyWith<$Res>(_value.vp, (value) {
      return _then(_value.copyWith(vp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetIotaResponseOutputImplCopyWith<$Res>
    implements $GetIotaResponseOutputCopyWith<$Res> {
  factory _$$GetIotaResponseOutputImplCopyWith(
          _$GetIotaResponseOutputImpl value,
          $Res Function(_$GetIotaResponseOutputImpl) then) =
      __$$GetIotaResponseOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VerifiablePresentation vp, String nonce});

  @override
  $VerifiablePresentationCopyWith<$Res> get vp;
}

/// @nodoc
class __$$GetIotaResponseOutputImplCopyWithImpl<$Res>
    extends _$GetIotaResponseOutputCopyWithImpl<$Res,
        _$GetIotaResponseOutputImpl>
    implements _$$GetIotaResponseOutputImplCopyWith<$Res> {
  __$$GetIotaResponseOutputImplCopyWithImpl(_$GetIotaResponseOutputImpl _value,
      $Res Function(_$GetIotaResponseOutputImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vp = null,
    Object? nonce = null,
  }) {
    return _then(_$GetIotaResponseOutputImpl(
      vp: null == vp
          ? _value.vp
          : vp // ignore: cast_nullable_to_non_nullable
              as VerifiablePresentation,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$GetIotaResponseOutputImpl extends _GetIotaResponseOutput {
  const _$GetIotaResponseOutputImpl({required this.vp, required this.nonce})
      : super._();

  factory _$GetIotaResponseOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetIotaResponseOutputImplFromJson(json);

  @override
  final VerifiablePresentation vp;
  @override
  final String nonce;

  @override
  String toString() {
    return 'GetIotaResponseOutput(vp: $vp, nonce: $nonce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetIotaResponseOutputImpl &&
            (identical(other.vp, vp) || other.vp == vp) &&
            (identical(other.nonce, nonce) || other.nonce == nonce));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vp, nonce);

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetIotaResponseOutputImplCopyWith<_$GetIotaResponseOutputImpl>
      get copyWith => __$$GetIotaResponseOutputImplCopyWithImpl<
          _$GetIotaResponseOutputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetIotaResponseOutputImplToJson(
      this,
    );
  }
}

abstract class _GetIotaResponseOutput extends GetIotaResponseOutput {
  const factory _GetIotaResponseOutput(
      {required final VerifiablePresentation vp,
      required final String nonce}) = _$GetIotaResponseOutputImpl;
  const _GetIotaResponseOutput._() : super._();

  factory _GetIotaResponseOutput.fromJson(Map<String, dynamic> json) =
      _$GetIotaResponseOutputImpl.fromJson;

  @override
  VerifiablePresentation get vp;
  @override
  String get nonce;

  /// Create a copy of GetIotaResponseOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetIotaResponseOutputImplCopyWith<_$GetIotaResponseOutputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
