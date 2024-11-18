import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_iota_redirect_flow_input.freezed.dart';
part 'start_iota_redirect_flow_input.g.dart';

@freezed
sealed class StartIotaRedirectFlowInput with _$StartIotaRedirectFlowInput {
  const StartIotaRedirectFlowInput._();
  @JsonSerializable(includeIfNull: false)
  const factory StartIotaRedirectFlowInput({
    String? configurationId,
    String? queryId,
    String? redirectUri,
    String? nonce,
  }) = _StartIotaRedirectFlowInput;

  factory StartIotaRedirectFlowInput.fromJson(Map<String, Object?> json) =>
      _$StartIotaRedirectFlowInputFromJson(json);
}
