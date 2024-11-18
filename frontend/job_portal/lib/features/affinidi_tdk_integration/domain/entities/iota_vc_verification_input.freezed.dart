// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iota_vc_verification_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IotaVCVerificationInput _$IotaVCVerificationInputFromJson(
    Map<String, dynamic> json) {
  return _IotaVCVerificationInput.fromJson(json);
}

/// @nodoc
mixin _$IotaVCVerificationInput {
  List<Map<String, dynamic>>? get vcs => throw _privateConstructorUsedError;

  /// Serializes this IotaVCVerificationInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IotaVCVerificationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IotaVCVerificationInputCopyWith<IotaVCVerificationInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IotaVCVerificationInputCopyWith<$Res> {
  factory $IotaVCVerificationInputCopyWith(IotaVCVerificationInput value,
          $Res Function(IotaVCVerificationInput) then) =
      _$IotaVCVerificationInputCopyWithImpl<$Res, IotaVCVerificationInput>;
  @useResult
  $Res call({List<Map<String, dynamic>>? vcs});
}

/// @nodoc
class _$IotaVCVerificationInputCopyWithImpl<$Res,
        $Val extends IotaVCVerificationInput>
    implements $IotaVCVerificationInputCopyWith<$Res> {
  _$IotaVCVerificationInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IotaVCVerificationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vcs = freezed,
  }) {
    return _then(_value.copyWith(
      vcs: freezed == vcs
          ? _value.vcs
          : vcs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IotaVCVerificationInputImplCopyWith<$Res>
    implements $IotaVCVerificationInputCopyWith<$Res> {
  factory _$$IotaVCVerificationInputImplCopyWith(
          _$IotaVCVerificationInputImpl value,
          $Res Function(_$IotaVCVerificationInputImpl) then) =
      __$$IotaVCVerificationInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>>? vcs});
}

/// @nodoc
class __$$IotaVCVerificationInputImplCopyWithImpl<$Res>
    extends _$IotaVCVerificationInputCopyWithImpl<$Res,
        _$IotaVCVerificationInputImpl>
    implements _$$IotaVCVerificationInputImplCopyWith<$Res> {
  __$$IotaVCVerificationInputImplCopyWithImpl(
      _$IotaVCVerificationInputImpl _value,
      $Res Function(_$IotaVCVerificationInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of IotaVCVerificationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vcs = freezed,
  }) {
    return _then(_$IotaVCVerificationInputImpl(
      vcs: freezed == vcs
          ? _value._vcs
          : vcs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$IotaVCVerificationInputImpl extends _IotaVCVerificationInput {
  const _$IotaVCVerificationInputImpl({final List<Map<String, dynamic>>? vcs})
      : _vcs = vcs,
        super._();

  factory _$IotaVCVerificationInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$IotaVCVerificationInputImplFromJson(json);

  final List<Map<String, dynamic>>? _vcs;
  @override
  List<Map<String, dynamic>>? get vcs {
    final value = _vcs;
    if (value == null) return null;
    if (_vcs is EqualUnmodifiableListView) return _vcs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IotaVCVerificationInput(vcs: $vcs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IotaVCVerificationInputImpl &&
            const DeepCollectionEquality().equals(other._vcs, _vcs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vcs));

  /// Create a copy of IotaVCVerificationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IotaVCVerificationInputImplCopyWith<_$IotaVCVerificationInputImpl>
      get copyWith => __$$IotaVCVerificationInputImplCopyWithImpl<
          _$IotaVCVerificationInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IotaVCVerificationInputImplToJson(
      this,
    );
  }
}

abstract class _IotaVCVerificationInput extends IotaVCVerificationInput {
  const factory _IotaVCVerificationInput(
      {final List<Map<String, dynamic>>? vcs}) = _$IotaVCVerificationInputImpl;
  const _IotaVCVerificationInput._() : super._();

  factory _IotaVCVerificationInput.fromJson(Map<String, dynamic> json) =
      _$IotaVCVerificationInputImpl.fromJson;

  @override
  List<Map<String, dynamic>>? get vcs;

  /// Create a copy of IotaVCVerificationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IotaVCVerificationInputImplCopyWith<_$IotaVCVerificationInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
