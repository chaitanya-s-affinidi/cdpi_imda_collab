import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_iota_flow_response.freezed.dart';
part 'start_iota_flow_response.g.dart';

@freezed
sealed class StartIotaFlowResponse with _$StartIotaFlowResponse {
  const StartIotaFlowResponse._();
  @JsonSerializable(includeIfNull: false)
  const factory StartIotaFlowResponse({
    String? correlationId,
    String? transactionId,
    String? jwt,
  }) = _StartIotaFlowResponse;

  factory StartIotaFlowResponse.fromJson(Map<String, Object?> json) =>
      _$StartIotaFlowResponseFromJson(json);
}
