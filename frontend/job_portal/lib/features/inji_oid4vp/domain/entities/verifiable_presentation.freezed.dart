// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verifiable_presentation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifiablePresentation _$VerifiablePresentationFromJson(
    Map<String, dynamic> json) {
  return _VerifiablePresentation.fromJson(json);
}

/// @nodoc
mixin _$VerifiablePresentation {
  List<Map<String, dynamic>> get verifiableCredential =>
      throw _privateConstructorUsedError;

  /// Serializes this VerifiablePresentation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifiablePresentation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifiablePresentationCopyWith<VerifiablePresentation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifiablePresentationCopyWith<$Res> {
  factory $VerifiablePresentationCopyWith(VerifiablePresentation value,
          $Res Function(VerifiablePresentation) then) =
      _$VerifiablePresentationCopyWithImpl<$Res, VerifiablePresentation>;
  @useResult
  $Res call({List<Map<String, dynamic>> verifiableCredential});
}

/// @nodoc
class _$VerifiablePresentationCopyWithImpl<$Res,
        $Val extends VerifiablePresentation>
    implements $VerifiablePresentationCopyWith<$Res> {
  _$VerifiablePresentationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifiablePresentation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifiableCredential = null,
  }) {
    return _then(_value.copyWith(
      verifiableCredential: null == verifiableCredential
          ? _value.verifiableCredential
          : verifiableCredential // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifiablePresentationImplCopyWith<$Res>
    implements $VerifiablePresentationCopyWith<$Res> {
  factory _$$VerifiablePresentationImplCopyWith(
          _$VerifiablePresentationImpl value,
          $Res Function(_$VerifiablePresentationImpl) then) =
      __$$VerifiablePresentationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> verifiableCredential});
}

/// @nodoc
class __$$VerifiablePresentationImplCopyWithImpl<$Res>
    extends _$VerifiablePresentationCopyWithImpl<$Res,
        _$VerifiablePresentationImpl>
    implements _$$VerifiablePresentationImplCopyWith<$Res> {
  __$$VerifiablePresentationImplCopyWithImpl(
      _$VerifiablePresentationImpl _value,
      $Res Function(_$VerifiablePresentationImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifiablePresentation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifiableCredential = null,
  }) {
    return _then(_$VerifiablePresentationImpl(
      verifiableCredential: null == verifiableCredential
          ? _value._verifiableCredential
          : verifiableCredential // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$VerifiablePresentationImpl extends _VerifiablePresentation {
  const _$VerifiablePresentationImpl(
      {required final List<Map<String, dynamic>> verifiableCredential})
      : _verifiableCredential = verifiableCredential,
        super._();

  factory _$VerifiablePresentationImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifiablePresentationImplFromJson(json);

  final List<Map<String, dynamic>> _verifiableCredential;
  @override
  List<Map<String, dynamic>> get verifiableCredential {
    if (_verifiableCredential is EqualUnmodifiableListView)
      return _verifiableCredential;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verifiableCredential);
  }

  @override
  String toString() {
    return 'VerifiablePresentation(verifiableCredential: $verifiableCredential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiablePresentationImpl &&
            const DeepCollectionEquality()
                .equals(other._verifiableCredential, _verifiableCredential));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_verifiableCredential));

  /// Create a copy of VerifiablePresentation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiablePresentationImplCopyWith<_$VerifiablePresentationImpl>
      get copyWith => __$$VerifiablePresentationImplCopyWithImpl<
          _$VerifiablePresentationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifiablePresentationImplToJson(
      this,
    );
  }
}

abstract class _VerifiablePresentation extends VerifiablePresentation {
  const factory _VerifiablePresentation(
          {required final List<Map<String, dynamic>> verifiableCredential}) =
      _$VerifiablePresentationImpl;
  const _VerifiablePresentation._() : super._();

  factory _VerifiablePresentation.fromJson(Map<String, dynamic> json) =
      _$VerifiablePresentationImpl.fromJson;

  @override
  List<Map<String, dynamic>> get verifiableCredential;

  /// Create a copy of VerifiablePresentation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifiablePresentationImplCopyWith<_$VerifiablePresentationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
