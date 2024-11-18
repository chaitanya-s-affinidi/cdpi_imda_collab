import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_portal/features/inji_oid4vp/domain/entities/verifiable_presentation.dart';

part 'get_iota_response_output.freezed.dart';
part 'get_iota_response_output.g.dart';

@freezed
sealed class GetIotaResponseOutput with _$GetIotaResponseOutput {
  const GetIotaResponseOutput._();
  @JsonSerializable(includeIfNull: false)
  const factory GetIotaResponseOutput({
    required VerifiablePresentation vp,
    required String nonce,
  }) = _GetIotaResponseOutput;

  factory GetIotaResponseOutput.fromJson(Map<String, Object?> json) =>
      _$GetIotaResponseOutputFromJson(json);
}
