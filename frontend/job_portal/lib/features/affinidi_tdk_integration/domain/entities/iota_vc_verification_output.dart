import 'package:freezed_annotation/freezed_annotation.dart';

part 'iota_vc_verification_output.freezed.dart';
part 'iota_vc_verification_output.g.dart';

@freezed
sealed class IotaVCVerificationOutput with _$IotaVCVerificationOutput {
  const IotaVCVerificationOutput._();
  @JsonSerializable(includeIfNull: false)
  const factory IotaVCVerificationOutput({
    bool? isValid,
    List<String>? errors,
  }) = _IotaVCVerificationOutput;

  factory IotaVCVerificationOutput.fromJson(Map<String, Object?> json) =>
      _$IotaVCVerificationOutputFromJson(json);
}
