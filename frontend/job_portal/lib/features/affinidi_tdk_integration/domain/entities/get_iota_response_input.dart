import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_iota_response_input.freezed.dart';
part 'get_iota_response_input.g.dart';

@freezed
sealed class GetIotaResponseInput with _$GetIotaResponseInput {
  const GetIotaResponseInput._();
  @JsonSerializable(includeIfNull: false)
  const factory GetIotaResponseInput({
    String? configurationId,
    String? correlationId,
    String? transactionId,
    String? responseCode,
  }) = _GetIotaResponseInput;

  factory GetIotaResponseInput.fromJson(Map<String, Object?> json) =>
      _$GetIotaResponseInputFromJson(json);
}
