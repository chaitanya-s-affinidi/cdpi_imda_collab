// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseCredentialImpl _$$CourseCredentialImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseCredentialImpl(
      studentName: json['studentName'] as String?,
      courseName: json['courseName'] as String?,
      instituteName: json['instituteName'] as String?,
      instituteLogo: json['instituteLogo'] as String?,
      dateOfCompletion: json['dateOfCompletion'] as String?,
      scoreAchieved: json['scoreAchieved'] as String?,
    );

Map<String, dynamic> _$$CourseCredentialImplToJson(
    _$CourseCredentialImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('studentName', instance.studentName);
  writeNotNull('courseName', instance.courseName);
  writeNotNull('instituteName', instance.instituteName);
  writeNotNull('instituteLogo', instance.instituteLogo);
  writeNotNull('dateOfCompletion', instance.dateOfCompletion);
  writeNotNull('scoreAchieved', instance.scoreAchieved);
  return val;
}
