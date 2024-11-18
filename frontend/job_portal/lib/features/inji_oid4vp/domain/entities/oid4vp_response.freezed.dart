// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oid4vp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Oid4vpResponse _$Oid4vpResponseFromJson(Map<String, dynamic> json) {
  return _Oid4vpResponse.fromJson(json);
}

/// @nodoc
mixin _$Oid4vpResponse {
  VerifiablePresentation? get vp_token => throw _privateConstructorUsedError;
  String? get presentation_submission => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this Oid4vpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Oid4vpResponseCopyWith<Oid4vpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Oid4vpResponseCopyWith<$Res> {
  factory $Oid4vpResponseCopyWith(
          Oid4vpResponse value, $Res Function(Oid4vpResponse) then) =
      _$Oid4vpResponseCopyWithImpl<$Res, Oid4vpResponse>;
  @useResult
  $Res call(
      {VerifiablePresentation? vp_token,
      String? presentation_submission,
      String? state});

  $VerifiablePresentationCopyWith<$Res>? get vp_token;
}

/// @nodoc
class _$Oid4vpResponseCopyWithImpl<$Res, $Val extends Oid4vpResponse>
    implements $Oid4vpResponseCopyWith<$Res> {
  _$Oid4vpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vp_token = freezed,
    Object? presentation_submission = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      vp_token: freezed == vp_token
          ? _value.vp_token
          : vp_token // ignore: cast_nullable_to_non_nullable
              as VerifiablePresentation?,
      presentation_submission: freezed == presentation_submission
          ? _value.presentation_submission
          : presentation_submission // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifiablePresentationCopyWith<$Res>? get vp_token {
    if (_value.vp_token == null) {
      return null;
    }

    return $VerifiablePresentationCopyWith<$Res>(_value.vp_token!, (value) {
      return _then(_value.copyWith(vp_token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$Oid4vpResponseImplCopyWith<$Res>
    implements $Oid4vpResponseCopyWith<$Res> {
  factory _$$Oid4vpResponseImplCopyWith(_$Oid4vpResponseImpl value,
          $Res Function(_$Oid4vpResponseImpl) then) =
      __$$Oid4vpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VerifiablePresentation? vp_token,
      String? presentation_submission,
      String? state});

  @override
  $VerifiablePresentationCopyWith<$Res>? get vp_token;
}

/// @nodoc
class __$$Oid4vpResponseImplCopyWithImpl<$Res>
    extends _$Oid4vpResponseCopyWithImpl<$Res, _$Oid4vpResponseImpl>
    implements _$$Oid4vpResponseImplCopyWith<$Res> {
  __$$Oid4vpResponseImplCopyWithImpl(
      _$Oid4vpResponseImpl _value, $Res Function(_$Oid4vpResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vp_token = freezed,
    Object? presentation_submission = freezed,
    Object? state = freezed,
  }) {
    return _then(_$Oid4vpResponseImpl(
      vp_token: freezed == vp_token
          ? _value.vp_token
          : vp_token // ignore: cast_nullable_to_non_nullable
              as VerifiablePresentation?,
      presentation_submission: freezed == presentation_submission
          ? _value.presentation_submission
          : presentation_submission // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$Oid4vpResponseImpl extends _Oid4vpResponse {
  const _$Oid4vpResponseImpl(
      {this.vp_token, this.presentation_submission, this.state})
      : super._();

  factory _$Oid4vpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$Oid4vpResponseImplFromJson(json);

  @override
  final VerifiablePresentation? vp_token;
  @override
  final String? presentation_submission;
  @override
  final String? state;

  @override
  String toString() {
    return 'Oid4vpResponse(vp_token: $vp_token, presentation_submission: $presentation_submission, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Oid4vpResponseImpl &&
            (identical(other.vp_token, vp_token) ||
                other.vp_token == vp_token) &&
            (identical(
                    other.presentation_submission, presentation_submission) ||
                other.presentation_submission == presentation_submission) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vp_token, presentation_submission, state);

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Oid4vpResponseImplCopyWith<_$Oid4vpResponseImpl> get copyWith =>
      __$$Oid4vpResponseImplCopyWithImpl<_$Oid4vpResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Oid4vpResponseImplToJson(
      this,
    );
  }
}

abstract class _Oid4vpResponse extends Oid4vpResponse {
  const factory _Oid4vpResponse(
      {final VerifiablePresentation? vp_token,
      final String? presentation_submission,
      final String? state}) = _$Oid4vpResponseImpl;
  const _Oid4vpResponse._() : super._();

  factory _Oid4vpResponse.fromJson(Map<String, dynamic> json) =
      _$Oid4vpResponseImpl.fromJson;

  @override
  VerifiablePresentation? get vp_token;
  @override
  String? get presentation_submission;
  @override
  String? get state;

  /// Create a copy of Oid4vpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Oid4vpResponseImplCopyWith<_$Oid4vpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
