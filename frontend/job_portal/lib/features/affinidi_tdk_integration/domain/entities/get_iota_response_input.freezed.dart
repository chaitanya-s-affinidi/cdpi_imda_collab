// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_iota_response_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetIotaResponseInput _$GetIotaResponseInputFromJson(Map<String, dynamic> json) {
  return _GetIotaResponseInput.fromJson(json);
}

/// @nodoc
mixin _$GetIotaResponseInput {
  String? get configurationId => throw _privateConstructorUsedError;
  String? get correlationId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;

  /// Serializes this GetIotaResponseInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetIotaResponseInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetIotaResponseInputCopyWith<GetIotaResponseInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetIotaResponseInputCopyWith<$Res> {
  factory $GetIotaResponseInputCopyWith(GetIotaResponseInput value,
          $Res Function(GetIotaResponseInput) then) =
      _$GetIotaResponseInputCopyWithImpl<$Res, GetIotaResponseInput>;
  @useResult
  $Res call(
      {String? configurationId,
      String? correlationId,
      String? transactionId,
      String? responseCode});
}

/// @nodoc
class _$GetIotaResponseInputCopyWithImpl<$Res,
        $Val extends GetIotaResponseInput>
    implements $GetIotaResponseInputCopyWith<$Res> {
  _$GetIotaResponseInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetIotaResponseInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurationId = freezed,
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? responseCode = freezed,
  }) {
    return _then(_value.copyWith(
      configurationId: freezed == configurationId
          ? _value.configurationId
          : configurationId // ignore: cast_nullable_to_non_nullable
              as String?,
      correlationId: freezed == correlationId
          ? _value.correlationId
          : correlationId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetIotaResponseInputImplCopyWith<$Res>
    implements $GetIotaResponseInputCopyWith<$Res> {
  factory _$$GetIotaResponseInputImplCopyWith(_$GetIotaResponseInputImpl value,
          $Res Function(_$GetIotaResponseInputImpl) then) =
      __$$GetIotaResponseInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? configurationId,
      String? correlationId,
      String? transactionId,
      String? responseCode});
}

/// @nodoc
class __$$GetIotaResponseInputImplCopyWithImpl<$Res>
    extends _$GetIotaResponseInputCopyWithImpl<$Res, _$GetIotaResponseInputImpl>
    implements _$$GetIotaResponseInputImplCopyWith<$Res> {
  __$$GetIotaResponseInputImplCopyWithImpl(_$GetIotaResponseInputImpl _value,
      $Res Function(_$GetIotaResponseInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetIotaResponseInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurationId = freezed,
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? responseCode = freezed,
  }) {
    return _then(_$GetIotaResponseInputImpl(
      configurationId: freezed == configurationId
          ? _value.configurationId
          : configurationId // ignore: cast_nullable_to_non_nullable
              as String?,
      correlationId: freezed == correlationId
          ? _value.correlationId
          : correlationId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$GetIotaResponseInputImpl extends _GetIotaResponseInput {
  const _$GetIotaResponseInputImpl(
      {this.configurationId,
      this.correlationId,
      this.transactionId,
      this.responseCode})
      : super._();

  factory _$GetIotaResponseInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetIotaResponseInputImplFromJson(json);

  @override
  final String? configurationId;
  @override
  final String? correlationId;
  @override
  final String? transactionId;
  @override
  final String? responseCode;

  @override
  String toString() {
    return 'GetIotaResponseInput(configurationId: $configurationId, correlationId: $correlationId, transactionId: $transactionId, responseCode: $responseCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetIotaResponseInputImpl &&
            (identical(other.configurationId, configurationId) ||
                other.configurationId == configurationId) &&
            (identical(other.correlationId, correlationId) ||
                other.correlationId == correlationId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, configurationId, correlationId, transactionId, responseCode);

  /// Create a copy of GetIotaResponseInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetIotaResponseInputImplCopyWith<_$GetIotaResponseInputImpl>
      get copyWith =>
          __$$GetIotaResponseInputImplCopyWithImpl<_$GetIotaResponseInputImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetIotaResponseInputImplToJson(
      this,
    );
  }
}

abstract class _GetIotaResponseInput extends GetIotaResponseInput {
  const factory _GetIotaResponseInput(
      {final String? configurationId,
      final String? correlationId,
      final String? transactionId,
      final String? responseCode}) = _$GetIotaResponseInputImpl;
  const _GetIotaResponseInput._() : super._();

  factory _GetIotaResponseInput.fromJson(Map<String, dynamic> json) =
      _$GetIotaResponseInputImpl.fromJson;

  @override
  String? get configurationId;
  @override
  String? get correlationId;
  @override
  String? get transactionId;
  @override
  String? get responseCode;

  /// Create a copy of GetIotaResponseInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetIotaResponseInputImplCopyWith<_$GetIotaResponseInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
