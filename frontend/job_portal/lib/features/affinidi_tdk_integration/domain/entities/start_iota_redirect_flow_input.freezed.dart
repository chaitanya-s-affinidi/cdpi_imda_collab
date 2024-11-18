// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_iota_redirect_flow_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartIotaRedirectFlowInput _$StartIotaRedirectFlowInputFromJson(
    Map<String, dynamic> json) {
  return _StartIotaRedirectFlowInput.fromJson(json);
}

/// @nodoc
mixin _$StartIotaRedirectFlowInput {
  String? get configurationId => throw _privateConstructorUsedError;
  String? get queryId => throw _privateConstructorUsedError;
  String? get redirectUri => throw _privateConstructorUsedError;
  String? get nonce => throw _privateConstructorUsedError;

  /// Serializes this StartIotaRedirectFlowInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartIotaRedirectFlowInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartIotaRedirectFlowInputCopyWith<StartIotaRedirectFlowInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartIotaRedirectFlowInputCopyWith<$Res> {
  factory $StartIotaRedirectFlowInputCopyWith(StartIotaRedirectFlowInput value,
          $Res Function(StartIotaRedirectFlowInput) then) =
      _$StartIotaRedirectFlowInputCopyWithImpl<$Res,
          StartIotaRedirectFlowInput>;
  @useResult
  $Res call(
      {String? configurationId,
      String? queryId,
      String? redirectUri,
      String? nonce});
}

/// @nodoc
class _$StartIotaRedirectFlowInputCopyWithImpl<$Res,
        $Val extends StartIotaRedirectFlowInput>
    implements $StartIotaRedirectFlowInputCopyWith<$Res> {
  _$StartIotaRedirectFlowInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartIotaRedirectFlowInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurationId = freezed,
    Object? queryId = freezed,
    Object? redirectUri = freezed,
    Object? nonce = freezed,
  }) {
    return _then(_value.copyWith(
      configurationId: freezed == configurationId
          ? _value.configurationId
          : configurationId // ignore: cast_nullable_to_non_nullable
              as String?,
      queryId: freezed == queryId
          ? _value.queryId
          : queryId // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUri: freezed == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: freezed == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartIotaRedirectFlowInputImplCopyWith<$Res>
    implements $StartIotaRedirectFlowInputCopyWith<$Res> {
  factory _$$StartIotaRedirectFlowInputImplCopyWith(
          _$StartIotaRedirectFlowInputImpl value,
          $Res Function(_$StartIotaRedirectFlowInputImpl) then) =
      __$$StartIotaRedirectFlowInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? configurationId,
      String? queryId,
      String? redirectUri,
      String? nonce});
}

/// @nodoc
class __$$StartIotaRedirectFlowInputImplCopyWithImpl<$Res>
    extends _$StartIotaRedirectFlowInputCopyWithImpl<$Res,
        _$StartIotaRedirectFlowInputImpl>
    implements _$$StartIotaRedirectFlowInputImplCopyWith<$Res> {
  __$$StartIotaRedirectFlowInputImplCopyWithImpl(
      _$StartIotaRedirectFlowInputImpl _value,
      $Res Function(_$StartIotaRedirectFlowInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartIotaRedirectFlowInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configurationId = freezed,
    Object? queryId = freezed,
    Object? redirectUri = freezed,
    Object? nonce = freezed,
  }) {
    return _then(_$StartIotaRedirectFlowInputImpl(
      configurationId: freezed == configurationId
          ? _value.configurationId
          : configurationId // ignore: cast_nullable_to_non_nullable
              as String?,
      queryId: freezed == queryId
          ? _value.queryId
          : queryId // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUri: freezed == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: freezed == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$StartIotaRedirectFlowInputImpl extends _StartIotaRedirectFlowInput {
  const _$StartIotaRedirectFlowInputImpl(
      {this.configurationId, this.queryId, this.redirectUri, this.nonce})
      : super._();

  factory _$StartIotaRedirectFlowInputImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StartIotaRedirectFlowInputImplFromJson(json);

  @override
  final String? configurationId;
  @override
  final String? queryId;
  @override
  final String? redirectUri;
  @override
  final String? nonce;

  @override
  String toString() {
    return 'StartIotaRedirectFlowInput(configurationId: $configurationId, queryId: $queryId, redirectUri: $redirectUri, nonce: $nonce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartIotaRedirectFlowInputImpl &&
            (identical(other.configurationId, configurationId) ||
                other.configurationId == configurationId) &&
            (identical(other.queryId, queryId) || other.queryId == queryId) &&
            (identical(other.redirectUri, redirectUri) ||
                other.redirectUri == redirectUri) &&
            (identical(other.nonce, nonce) || other.nonce == nonce));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, configurationId, queryId, redirectUri, nonce);

  /// Create a copy of StartIotaRedirectFlowInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartIotaRedirectFlowInputImplCopyWith<_$StartIotaRedirectFlowInputImpl>
      get copyWith => __$$StartIotaRedirectFlowInputImplCopyWithImpl<
          _$StartIotaRedirectFlowInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartIotaRedirectFlowInputImplToJson(
      this,
    );
  }
}

abstract class _StartIotaRedirectFlowInput extends StartIotaRedirectFlowInput {
  const factory _StartIotaRedirectFlowInput(
      {final String? configurationId,
      final String? queryId,
      final String? redirectUri,
      final String? nonce}) = _$StartIotaRedirectFlowInputImpl;
  const _StartIotaRedirectFlowInput._() : super._();

  factory _StartIotaRedirectFlowInput.fromJson(Map<String, dynamic> json) =
      _$StartIotaRedirectFlowInputImpl.fromJson;

  @override
  String? get configurationId;
  @override
  String? get queryId;
  @override
  String? get redirectUri;
  @override
  String? get nonce;

  /// Create a copy of StartIotaRedirectFlowInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartIotaRedirectFlowInputImplCopyWith<_$StartIotaRedirectFlowInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
