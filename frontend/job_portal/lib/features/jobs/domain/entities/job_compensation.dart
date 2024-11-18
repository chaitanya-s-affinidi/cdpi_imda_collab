import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_compensation.freezed.dart';
part 'job_compensation.g.dart';

@freezed
sealed class JobCompensation with _$JobCompensation {
  const JobCompensation._();
  @JsonSerializable(includeIfNull: false)
  const factory JobCompensation({
    String? code,
    String? name,
    List<String>? salaryInfo,
  }) = _JobCompensation;

  factory JobCompensation.fromJson(Map<String, Object?> json) =>
      _$JobCompensationFromJson(json);
}
