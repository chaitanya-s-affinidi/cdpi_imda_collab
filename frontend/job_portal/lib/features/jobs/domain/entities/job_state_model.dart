import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_portal/features/credentials/domain/credential_wrapper.dart';
import 'package:job_portal/features/jobs/domain/entities/job.dart';

part 'job_state_model.freezed.dart';
part 'job_state_model.g.dart';

@freezed
sealed class JobStateModel with _$JobStateModel {
  const JobStateModel._();
  @JsonSerializable(includeIfNull: false)
  const factory JobStateModel({
    required Job job,
    required List<CredentialWrapper> certificates,
  }) = _JobStateModel;

  factory JobStateModel.fromJson(Map<String, Object?> json) =>
      _$JobStateModelFromJson(json);
}
