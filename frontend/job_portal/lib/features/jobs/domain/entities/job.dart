import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_portal/features/jobs/domain/entities/job_compensation.dart';
import 'package:job_portal/features/jobs/domain/entities/job_fulfillment_category.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
sealed class Job with _$Job {
  const Job._();
  @JsonSerializable(includeIfNull: false)
  const factory Job({
    String? jobId,
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
    JobCompensation? compensation,
    // List<EducationalQualification>? educationalQualifications,
    // Job$EmploymentInformation? employmentInformation,
    // Job$WorkExperience? workExperience,
  }) = _Job;

  factory Job.fromJson(Map<String, Object?> json) => _$JobFromJson(json);
}
