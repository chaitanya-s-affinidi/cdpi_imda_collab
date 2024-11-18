// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_iota_flow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartIotaFlowResponse _$StartIotaFlowResponseFromJson(
    Map<String, dynamic> json) {
  return _StartIotaFlowResponse.fromJson(json);
}

/// @nodoc
mixin _$StartIotaFlowResponse {
  String? get correlationId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get jwt => throw _privateConstructorUsedError;

  /// Serializes this StartIotaFlowResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartIotaFlowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartIotaFlowResponseCopyWith<StartIotaFlowResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartIotaFlowResponseCopyWith<$Res> {
  factory $StartIotaFlowResponseCopyWith(StartIotaFlowResponse value,
          $Res Function(StartIotaFlowResponse) then) =
      _$StartIotaFlowResponseCopyWithImpl<$Res, StartIotaFlowResponse>;
  @useResult
  $Res call({String? correlationId, String? transactionId, String? jwt});
}

/// @nodoc
class _$StartIotaFlowResponseCopyWithImpl<$Res,
        $Val extends StartIotaFlowResponse>
    implements $StartIotaFlowResponseCopyWith<$Res> {
  _$StartIotaFlowResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartIotaFlowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? jwt = freezed,
  }) {
    return _then(_value.copyWith(
      correlationId: freezed == correlationId
          ? _value.correlationId
          : correlationId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      jwt: freezed == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartIotaFlowResponseImplCopyWith<$Res>
    implements $StartIotaFlowResponseCopyWith<$Res> {
  factory _$$StartIotaFlowResponseImplCopyWith(
          _$StartIotaFlowResponseImpl value,
          $Res Function(_$StartIotaFlowResponseImpl) then) =
      __$$StartIotaFlowResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? correlationId, String? transactionId, String? jwt});
}

/// @nodoc
class __$$StartIotaFlowResponseImplCopyWithImpl<$Res>
    extends _$StartIotaFlowResponseCopyWithImpl<$Res,
        _$StartIotaFlowResponseImpl>
    implements _$$StartIotaFlowResponseImplCopyWith<$Res> {
  __$$StartIotaFlowResponseImplCopyWithImpl(_$StartIotaFlowResponseImpl _value,
      $Res Function(_$StartIotaFlowResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartIotaFlowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? jwt = freezed,
  }) {
    return _then(_$StartIotaFlowResponseImpl(
      correlationId: freezed == correlationId
          ? _value.correlationId
          : correlationId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      jwt: freezed == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$StartIotaFlowResponseImpl extends _StartIotaFlowResponse {
  const _$StartIotaFlowResponseImpl(
      {this.correlationId, this.transactionId, this.jwt})
      : super._();

  factory _$StartIotaFlowResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartIotaFlowResponseImplFromJson(json);

  @override
  final String? correlationId;
  @override
  final String? transactionId;
  @override
  final String? jwt;

  @override
  String toString() {
    return 'StartIotaFlowResponse(correlationId: $correlationId, transactionId: $transactionId, jwt: $jwt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartIotaFlowResponseImpl &&
            (identical(other.correlationId, correlationId) ||
                other.correlationId == correlationId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.jwt, jwt) || other.jwt == jwt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correlationId, transactionId, jwt);

  /// Create a copy of StartIotaFlowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartIotaFlowResponseImplCopyWith<_$StartIotaFlowResponseImpl>
      get copyWith => __$$StartIotaFlowResponseImplCopyWithImpl<
          _$StartIotaFlowResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartIotaFlowResponseImplToJson(
      this,
    );
  }
}

abstract class _StartIotaFlowResponse extends StartIotaFlowResponse {
  const factory _StartIotaFlowResponse(
      {final String? correlationId,
      final String? transactionId,
      final String? jwt}) = _$StartIotaFlowResponseImpl;
  const _StartIotaFlowResponse._() : super._();

  factory _StartIotaFlowResponse.fromJson(Map<String, dynamic> json) =
      _$StartIotaFlowResponseImpl.fromJson;

  @override
  String? get correlationId;
  @override
  String? get transactionId;
  @override
  String? get jwt;

  /// Create a copy of StartIotaFlowResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartIotaFlowResponseImplCopyWith<_$StartIotaFlowResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
