import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_credential.freezed.dart';
part 'course_credential.g.dart';

@freezed
sealed class CourseCredential with _$CourseCredential {
  const CourseCredential._();
  @JsonSerializable(includeIfNull: false)
  const factory CourseCredential({
    String? studentName,
    String? courseName,
    String? instituteName,
    String? instituteLogo,
    String? dateOfCompletion,
    String? scoreAchieved,
  }) = _CourseCredential;

  factory CourseCredential.fromJson(Map<String, Object?> json) =>
      _$CourseCredentialFromJson(json);
}
