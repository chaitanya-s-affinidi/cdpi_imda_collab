// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobStateModel _$JobStateModelFromJson(Map<String, dynamic> json) {
  return _JobStateModel.fromJson(json);
}

/// @nodoc
mixin _$JobStateModel {
  Job get job => throw _privateConstructorUsedError;
  List<CredentialWrapper> get certificates =>
      throw _privateConstructorUsedError;

  /// Serializes this JobStateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobStateModelCopyWith<JobStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStateModelCopyWith<$Res> {
  factory $JobStateModelCopyWith(
          JobStateModel value, $Res Function(JobStateModel) then) =
      _$JobStateModelCopyWithImpl<$Res, JobStateModel>;
  @useResult
  $Res call({Job job, List<CredentialWrapper> certificates});

  $JobCopyWith<$Res> get job;
}

/// @nodoc
class _$JobStateModelCopyWithImpl<$Res, $Val extends JobStateModel>
    implements $JobStateModelCopyWith<$Res> {
  _$JobStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = null,
    Object? certificates = null,
  }) {
    return _then(_value.copyWith(
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
      certificates: null == certificates
          ? _value.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CredentialWrapper>,
    ) as $Val);
  }

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JobCopyWith<$Res> get job {
    return $JobCopyWith<$Res>(_value.job, (value) {
      return _then(_value.copyWith(job: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobStateModelImplCopyWith<$Res>
    implements $JobStateModelCopyWith<$Res> {
  factory _$$JobStateModelImplCopyWith(
          _$JobStateModelImpl value, $Res Function(_$JobStateModelImpl) then) =
      __$$JobStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Job job, List<CredentialWrapper> certificates});

  @override
  $JobCopyWith<$Res> get job;
}

/// @nodoc
class __$$JobStateModelImplCopyWithImpl<$Res>
    extends _$JobStateModelCopyWithImpl<$Res, _$JobStateModelImpl>
    implements _$$JobStateModelImplCopyWith<$Res> {
  __$$JobStateModelImplCopyWithImpl(
      _$JobStateModelImpl _value, $Res Function(_$JobStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = null,
    Object? certificates = null,
  }) {
    return _then(_$JobStateModelImpl(
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as Job,
      certificates: null == certificates
          ? _value._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<CredentialWrapper>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$JobStateModelImpl extends _JobStateModel {
  const _$JobStateModelImpl(
      {required this.job, required final List<CredentialWrapper> certificates})
      : _certificates = certificates,
        super._();

  factory _$JobStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobStateModelImplFromJson(json);

  @override
  final Job job;
  final List<CredentialWrapper> _certificates;
  @override
  List<CredentialWrapper> get certificates {
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certificates);
  }

  @override
  String toString() {
    return 'JobStateModel(job: $job, certificates: $certificates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobStateModelImpl &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, job, const DeepCollectionEquality().hash(_certificates));

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobStateModelImplCopyWith<_$JobStateModelImpl> get copyWith =>
      __$$JobStateModelImplCopyWithImpl<_$JobStateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobStateModelImplToJson(
      this,
    );
  }
}

abstract class _JobStateModel extends JobStateModel {
  const factory _JobStateModel(
          {required final Job job,
          required final List<CredentialWrapper> certificates}) =
      _$JobStateModelImpl;
  const _JobStateModel._() : super._();

  factory _JobStateModel.fromJson(Map<String, dynamic> json) =
      _$JobStateModelImpl.fromJson;

  @override
  Job get job;
  @override
  List<CredentialWrapper> get certificates;

  /// Create a copy of JobStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobStateModelImplCopyWith<_$JobStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
