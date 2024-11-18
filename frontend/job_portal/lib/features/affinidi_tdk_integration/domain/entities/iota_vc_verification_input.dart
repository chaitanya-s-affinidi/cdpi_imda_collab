import 'package:freezed_annotation/freezed_annotation.dart';

part 'iota_vc_verification_input.freezed.dart';
part 'iota_vc_verification_input.g.dart';

@freezed
sealed class IotaVCVerificationInput with _$IotaVCVerificationInput {
  const IotaVCVerificationInput._();
  @JsonSerializable(includeIfNull: false)
  const factory IotaVCVerificationInput({
    List<Map<String, dynamic>>? vcs,
  }) = _IotaVCVerificationInput;

  factory IotaVCVerificationInput.fromJson(Map<String, Object?> json) =>
      _$IotaVCVerificationInputFromJson(json);
}
