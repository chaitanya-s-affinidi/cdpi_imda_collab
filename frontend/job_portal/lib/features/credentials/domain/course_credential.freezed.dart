// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseCredential _$CourseCredentialFromJson(Map<String, dynamic> json) {
  return _CourseCredential.fromJson(json);
}

/// @nodoc
mixin _$CourseCredential {
  String? get studentName => throw _privateConstructorUsedError;
  String? get courseName => throw _privateConstructorUsedError;
  String? get instituteName => throw _privateConstructorUsedError;
  String? get instituteLogo => throw _privateConstructorUsedError;
  String? get dateOfCompletion => throw _privateConstructorUsedError;
  String? get scoreAchieved => throw _privateConstructorUsedError;

  /// Serializes this CourseCredential to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCredentialCopyWith<CourseCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCredentialCopyWith<$Res> {
  factory $CourseCredentialCopyWith(
          CourseCredential value, $Res Function(CourseCredential) then) =
      _$CourseCredentialCopyWithImpl<$Res, CourseCredential>;
  @useResult
  $Res call(
      {String? studentName,
      String? courseName,
      String? instituteName,
      String? instituteLogo,
      String? dateOfCompletion,
      String? scoreAchieved});
}

/// @nodoc
class _$CourseCredentialCopyWithImpl<$Res, $Val extends CourseCredential>
    implements $CourseCredentialCopyWith<$Res> {
  _$CourseCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentName = freezed,
    Object? courseName = freezed,
    Object? instituteName = freezed,
    Object? instituteLogo = freezed,
    Object? dateOfCompletion = freezed,
    Object? scoreAchieved = freezed,
  }) {
    return _then(_value.copyWith(
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      instituteName: freezed == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String?,
      instituteLogo: freezed == instituteLogo
          ? _value.instituteLogo
          : instituteLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfCompletion: freezed == dateOfCompletion
          ? _value.dateOfCompletion
          : dateOfCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreAchieved: freezed == scoreAchieved
          ? _value.scoreAchieved
          : scoreAchieved // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseCredentialImplCopyWith<$Res>
    implements $CourseCredentialCopyWith<$Res> {
  factory _$$CourseCredentialImplCopyWith(_$CourseCredentialImpl value,
          $Res Function(_$CourseCredentialImpl) then) =
      __$$CourseCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? studentName,
      String? courseName,
      String? instituteName,
      String? instituteLogo,
      String? dateOfCompletion,
      String? scoreAchieved});
}

/// @nodoc
class __$$CourseCredentialImplCopyWithImpl<$Res>
    extends _$CourseCredentialCopyWithImpl<$Res, _$CourseCredentialImpl>
    implements _$$CourseCredentialImplCopyWith<$Res> {
  __$$CourseCredentialImplCopyWithImpl(_$CourseCredentialImpl _value,
      $Res Function(_$CourseCredentialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentName = freezed,
    Object? courseName = freezed,
    Object? instituteName = freezed,
    Object? instituteLogo = freezed,
    Object? dateOfCompletion = freezed,
    Object? scoreAchieved = freezed,
  }) {
    return _then(_$CourseCredentialImpl(
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      instituteName: freezed == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String?,
      instituteLogo: freezed == instituteLogo
          ? _value.instituteLogo
          : instituteLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfCompletion: freezed == dateOfCompletion
          ? _value.dateOfCompletion
          : dateOfCompletion // ignore: cast_nullable_to_non_nullable
              as String?,
      scoreAchieved: freezed == scoreAchieved
          ? _value.scoreAchieved
          : scoreAchieved // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CourseCredentialImpl extends _CourseCredential {
  const _$CourseCredentialImpl(
      {this.studentName,
      this.courseName,
      this.instituteName,
      this.instituteLogo,
      this.dateOfCompletion,
      this.scoreAchieved})
      : super._();

  factory _$CourseCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseCredentialImplFromJson(json);

  @override
  final String? studentName;
  @override
  final String? courseName;
  @override
  final String? instituteName;
  @override
  final String? instituteLogo;
  @override
  final String? dateOfCompletion;
  @override
  final String? scoreAchieved;

  @override
  String toString() {
    return 'CourseCredential(studentName: $studentName, courseName: $courseName, instituteName: $instituteName, instituteLogo: $instituteLogo, dateOfCompletion: $dateOfCompletion, scoreAchieved: $scoreAchieved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseCredentialImpl &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.instituteName, instituteName) ||
                other.instituteName == instituteName) &&
            (identical(other.instituteLogo, instituteLogo) ||
                other.instituteLogo == instituteLogo) &&
            (identical(other.dateOfCompletion, dateOfCompletion) ||
                other.dateOfCompletion == dateOfCompletion) &&
            (identical(other.scoreAchieved, scoreAchieved) ||
                other.scoreAchieved == scoreAchieved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, studentName, courseName,
      instituteName, instituteLogo, dateOfCompletion, scoreAchieved);

  /// Create a copy of CourseCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseCredentialImplCopyWith<_$CourseCredentialImpl> get copyWith =>
      __$$CourseCredentialImplCopyWithImpl<_$CourseCredentialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseCredentialImplToJson(
      this,
    );
  }
}

abstract class _CourseCredential extends CourseCredential {
  const factory _CourseCredential(
      {final String? studentName,
      final String? courseName,
      final String? instituteName,
      final String? instituteLogo,
      final String? dateOfCompletion,
      final String? scoreAchieved}) = _$CourseCredentialImpl;
  const _CourseCredential._() : super._();

  factory _CourseCredential.fromJson(Map<String, dynamic> json) =
      _$CourseCredentialImpl.fromJson;

  @override
  String? get studentName;
  @override
  String? get courseName;
  @override
  String? get instituteName;
  @override
  String? get instituteLogo;
  @override
  String? get dateOfCompletion;
  @override
  String? get scoreAchieved;

  /// Create a copy of CourseCredential
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseCredentialImplCopyWith<_$CourseCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
