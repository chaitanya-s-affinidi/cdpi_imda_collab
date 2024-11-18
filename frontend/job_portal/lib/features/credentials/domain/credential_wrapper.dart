import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential_wrapper.freezed.dart';
part 'credential_wrapper.g.dart';

@freezed
sealed class CredentialWrapper with _$CredentialWrapper {
  const CredentialWrapper._();
  @JsonSerializable(includeIfNull: false)
  const factory CredentialWrapper({
    Map<String, dynamic>? vc,
    bool? isValid,
  }) = _CredentialWrapper;

  factory CredentialWrapper.fromJson(Map<String, Object?> json) =>
      _$CredentialWrapperFromJson(json);
}
