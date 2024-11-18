// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  String? get jobId => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get providerId => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get companyLogo => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  String? get bppId => throw _privateConstructorUsedError;
  String? get bppUri => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  bool? get userSavedItem => throw _privateConstructorUsedError;
  bool? get userAppliedItem => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get responsibilities => throw _privateConstructorUsedError;
  List<JobFulfillmentCategory>? get fulfillmentCategory =>
      throw _privateConstructorUsedError;
  JobCompensation? get compensation => throw _privateConstructorUsedError;

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call(
      {String? jobId,
      String? role,
      String? id,
      String? providerId,
      String? applicationId,
      String? company,
      String? city,
      String? companyLogo,
      String? data,
      String? bppId,
      String? bppUri,
      String? createdAt,
      String? state,
      bool? userSavedItem,
      bool? userAppliedItem,
      String? status,
      String? description,
      List<String>? responsibilities,
      List<JobFulfillmentCategory>? fulfillmentCategory,
      JobCompensation? compensation});

  $JobCompensationCopyWith<$Res>? get compensation;
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = freezed,
    Object? role = freezed,
    Object? id = freezed,
    Object? providerId = freezed,
    Object? applicationId = freezed,
    Object? company = freezed,
    Object? city = freezed,
    Object? companyLogo = freezed,
    Object? data = freezed,
    Object? bppId = freezed,
    Object? bppUri = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? userSavedItem = freezed,
    Object? userAppliedItem = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? responsibilities = freezed,
    Object? fulfillmentCategory = freezed,
    Object? compensation = freezed,
  }) {
    return _then(_value.copyWith(
      jobId: freezed == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      companyLogo: freezed == companyLogo
          ? _value.companyLogo
          : companyLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      bppId: freezed == bppId
          ? _value.bppId
          : bppId // ignore: cast_nullable_to_non_nullable
              as String?,
      bppUri: freezed == bppUri
          ? _value.bppUri
          : bppUri // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      userSavedItem: freezed == userSavedItem
          ? _value.userSavedItem
          : userSavedItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      userAppliedItem: freezed == userAppliedItem
          ? _value.userAppliedItem
          : userAppliedItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      responsibilities: freezed == responsibilities
          ? _value.responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fulfillmentCategory: freezed == fulfillmentCategory
          ? _value.fulfillmentCategory
          : fulfillmentCategory // ignore: cast_nullable_to_non_nullable
              as List<JobFulfillmentCategory>?,
      compensation: freezed == compensation
          ? _value.compensation
          : compensation // ignore: cast_nullable_to_non_nullable
              as JobCompensation?,
    ) as $Val);
  }

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JobCompensationCopyWith<$Res>? get compensation {
    if (_value.compensation == null) {
      return null;
    }

    return $JobCompensationCopyWith<$Res>(_value.compensation!, (value) {
      return _then(_value.copyWith(compensation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? jobId,
      String? role,
      String? id,
      String? providerId,
      String? applicationId,
      String? company,
      String? city,
      String? companyLogo,
      String? data,
      String? bppId,
      String? bppUri,
      String? createdAt,
      String? state,
      bool? userSavedItem,
      bool? userAppliedItem,
      String? status,
      String? description,
      List<String>? responsibilities,
      List<JobFulfillmentCategory>? fulfillmentCategory,
      JobCompensation? compensation});

  @override
  $JobCompensationCopyWith<$Res>? get compensation;
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
      : super(_value, _then);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = freezed,
    Object? role = freezed,
    Object? id = freezed,
    Object? providerId = freezed,
    Object? applicationId = freezed,
    Object? company = freezed,
    Object? city = freezed,
    Object? companyLogo = freezed,
    Object? data = freezed,
    Object? bppId = freezed,
    Object? bppUri = freezed,
    Object? createdAt = freezed,
    Object? state = freezed,
    Object? userSavedItem = freezed,
    Object? userAppliedItem = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? responsibilities = freezed,
    Object? fulfillmentCategory = freezed,
    Object? compensation = freezed,
  }) {
    return _then(_$JobImpl(
      jobId: freezed == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      companyLogo: freezed == companyLogo
          ? _value.companyLogo
          : companyLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      bppId: freezed == bppId
          ? _value.bppId
          : bppId // ignore: cast_nullable_to_non_nullable
              as String?,
      bppUri: freezed == bppUri
          ? _value.bppUri
          : bppUri // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      userSavedItem: freezed == userSavedItem
          ? _value.userSavedItem
          : userSavedItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      userAppliedItem: freezed == userAppliedItem
          ? _value.userAppliedItem
          : userAppliedItem // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      responsibilities: freezed == responsibilities
          ? _value._responsibilities
          : responsibilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fulfillmentCategory: freezed == fulfillmentCategory
          ? _value._fulfillmentCategory
          : fulfillmentCategory // ignore: cast_nullable_to_non_nullable
              as List<JobFulfillmentCategory>?,
      compensation: freezed == compensation
          ? _value.compensation
          : compensation // ignore: cast_nullable_to_non_nullable
              as JobCompensation?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$JobImpl extends _Job {
  const _$JobImpl(
      {this.jobId,
      this.role,
      this.id,
      this.providerId,
      this.applicationId,
      this.company,
      this.city,
      this.companyLogo,
      this.data,
      this.bppId,
      this.bppUri,
      this.createdAt,
      this.state,
      this.userSavedItem,
      this.userAppliedItem,
      this.status,
      this.description,
      final List<String>? responsibilities,
      final List<JobFulfillmentCategory>? fulfillmentCategory,
      this.compensation})
      : _responsibilities = responsibilities,
        _fulfillmentCategory = fulfillmentCategory,
        super._();

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  final String? jobId;
  @override
  final String? role;
  @override
  final String? id;
  @override
  final String? providerId;
  @override
  final String? applicationId;
  @override
  final String? company;
  @override
  final String? city;
  @override
  final String? companyLogo;
  @override
  final String? data;
  @override
  final String? bppId;
  @override
  final String? bppUri;
  @override
  final String? createdAt;
  @override
  final String? state;
  @override
  final bool? userSavedItem;
  @override
  final bool? userAppliedItem;
  @override
  final String? status;
  @override
  final String? description;
  final List<String>? _responsibilities;
  @override
  List<String>? get responsibilities {
    final value = _responsibilities;
    if (value == null) return null;
    if (_responsibilities is EqualUnmodifiableListView)
      return _responsibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<JobFulfillmentCategory>? _fulfillmentCategory;
  @override
  List<JobFulfillmentCategory>? get fulfillmentCategory {
    final value = _fulfillmentCategory;
    if (value == null) return null;
    if (_fulfillmentCategory is EqualUnmodifiableListView)
      return _fulfillmentCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final JobCompensation? compensation;

  @override
  String toString() {
    return 'Job(jobId: $jobId, role: $role, id: $id, providerId: $providerId, applicationId: $applicationId, company: $company, city: $city, companyLogo: $companyLogo, data: $data, bppId: $bppId, bppUri: $bppUri, createdAt: $createdAt, state: $state, userSavedItem: $userSavedItem, userAppliedItem: $userAppliedItem, status: $status, description: $description, responsibilities: $responsibilities, fulfillmentCategory: $fulfillmentCategory, compensation: $compensation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.companyLogo, companyLogo) ||
                other.companyLogo == companyLogo) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.bppId, bppId) || other.bppId == bppId) &&
            (identical(other.bppUri, bppUri) || other.bppUri == bppUri) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.userSavedItem, userSavedItem) ||
                other.userSavedItem == userSavedItem) &&
            (identical(other.userAppliedItem, userAppliedItem) ||
                other.userAppliedItem == userAppliedItem) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._responsibilities, _responsibilities) &&
            const DeepCollectionEquality()
                .equals(other._fulfillmentCategory, _fulfillmentCategory) &&
            (identical(other.compensation, compensation) ||
                other.compensation == compensation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        jobId,
        role,
        id,
        providerId,
        applicationId,
        company,
        city,
        companyLogo,
        data,
        bppId,
        bppUri,
        createdAt,
        state,
        userSavedItem,
        userAppliedItem,
        status,
        description,
        const DeepCollectionEquality().hash(_responsibilities),
        const DeepCollectionEquality().hash(_fulfillmentCategory),
        compensation
      ]);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(
      this,
    );
  }
}

abstract class _Job extends Job {
  const factory _Job(
      {final String? jobId,
      final String? role,
      final String? id,
      final String? providerId,
      final String? applicationId,
      final String? company,
      final String? city,
      final String? companyLogo,
      final String? data,
      final String? bppId,
      final String? bppUri,
      final String? createdAt,
      final String? state,
      final bool? userSavedItem,
      final bool? userAppliedItem,
      final String? status,
      final String? description,
      final List<String>? responsibilities,
      final List<JobFulfillmentCategory>? fulfillmentCategory,
      final JobCompensation? compensation}) = _$JobImpl;
  const _Job._() : super._();

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  String? get jobId;
  @override
  String? get role;
  @override
  String? get id;
  @override
  String? get providerId;
  @override
  String? get applicationId;
  @override
  String? get company;
  @override
  String? get city;
  @override
  String? get companyLogo;
  @override
  String? get data;
  @override
  String? get bppId;
  @override
  String? get bppUri;
  @override
  String? get createdAt;
  @override
  String? get state;
  @override
  bool? get userSavedItem;
  @override
  bool? get userAppliedItem;
  @override
  String? get status;
  @override
  String? get description;
  @override
  List<String>? get responsibilities;
  @override
  List<JobFulfillmentCategory>? get fulfillmentCategory;
  @override
  JobCompensation? get compensation;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
