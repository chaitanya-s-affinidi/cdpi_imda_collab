// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_iota_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalIotaObject _$LocalIotaObjectFromJson(Map<String, dynamic> json) {
  return _LocalIotaObject.fromJson(json);
}

/// @nodoc
mixin _$LocalIotaObject {
  String? get correlationId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get nounce => throw _privateConstructorUsedError;

  /// Serializes this LocalIotaObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalIotaObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalIotaObjectCopyWith<LocalIotaObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalIotaObjectCopyWith<$Res> {
  factory $LocalIotaObjectCopyWith(
          LocalIotaObject value, $Res Function(LocalIotaObject) then) =
      _$LocalIotaObjectCopyWithImpl<$Res, LocalIotaObject>;
  @useResult
  $Res call({String? correlationId, String? transactionId, String? nounce});
}

/// @nodoc
class _$LocalIotaObjectCopyWithImpl<$Res, $Val extends LocalIotaObject>
    implements $LocalIotaObjectCopyWith<$Res> {
  _$LocalIotaObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalIotaObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? nounce = freezed,
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
      nounce: freezed == nounce
          ? _value.nounce
          : nounce // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalIotaObjectImplCopyWith<$Res>
    implements $LocalIotaObjectCopyWith<$Res> {
  factory _$$LocalIotaObjectImplCopyWith(_$LocalIotaObjectImpl value,
          $Res Function(_$LocalIotaObjectImpl) then) =
      __$$LocalIotaObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? correlationId, String? transactionId, String? nounce});
}

/// @nodoc
class __$$LocalIotaObjectImplCopyWithImpl<$Res>
    extends _$LocalIotaObjectCopyWithImpl<$Res, _$LocalIotaObjectImpl>
    implements _$$LocalIotaObjectImplCopyWith<$Res> {
  __$$LocalIotaObjectImplCopyWithImpl(
      _$LocalIotaObjectImpl _value, $Res Function(_$LocalIotaObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalIotaObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correlationId = freezed,
    Object? transactionId = freezed,
    Object? nounce = freezed,
  }) {
    return _then(_$LocalIotaObjectImpl(
      correlationId: freezed == correlationId
          ? _value.correlationId
          : correlationId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      nounce: freezed == nounce
          ? _value.nounce
          : nounce // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$LocalIotaObjectImpl extends _LocalIotaObject {
  const _$LocalIotaObjectImpl(
      {this.correlationId, this.transactionId, this.nounce})
      : super._();

  factory _$LocalIotaObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalIotaObjectImplFromJson(json);

  @override
  final String? correlationId;
  @override
  final String? transactionId;
  @override
  final String? nounce;

  @override
  String toString() {
    return 'LocalIotaObject(correlationId: $correlationId, transactionId: $transactionId, nounce: $nounce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalIotaObjectImpl &&
            (identical(other.correlationId, correlationId) ||
                other.correlationId == correlationId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.nounce, nounce) || other.nounce == nounce));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correlationId, transactionId, nounce);

  /// Create a copy of LocalIotaObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalIotaObjectImplCopyWith<_$LocalIotaObjectImpl> get copyWith =>
      __$$LocalIotaObjectImplCopyWithImpl<_$LocalIotaObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalIotaObjectImplToJson(
      this,
    );
  }
}

abstract class _LocalIotaObject extends LocalIotaObject {
  const factory _LocalIotaObject(
      {final String? correlationId,
      final String? transactionId,
      final String? nounce}) = _$LocalIotaObjectImpl;
  const _LocalIotaObject._() : super._();

  factory _LocalIotaObject.fromJson(Map<String, dynamic> json) =
      _$LocalIotaObjectImpl.fromJson;

  @override
  String? get correlationId;
  @override
  String? get transactionId;
  @override
  String? get nounce;

  /// Create a copy of LocalIotaObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalIotaObjectImplCopyWith<_$LocalIotaObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
