import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_portal/features/inji_oid4vp/domain/entities/verifiable_presentation.dart';

part 'oid4vp_response.freezed.dart';
part 'oid4vp_response.g.dart';

@freezed
sealed class Oid4vpResponse with _$Oid4vpResponse {
  const Oid4vpResponse._();
  @JsonSerializable(includeIfNull: false)
  const factory Oid4vpResponse({
    VerifiablePresentation? vp_token,
    String? presentation_submission,
    String? state,
  }) = _Oid4vpResponse;

  factory Oid4vpResponse.fromJson(Map<String, Object?> json) =>
      _$Oid4vpResponseFromJson(json);
}
