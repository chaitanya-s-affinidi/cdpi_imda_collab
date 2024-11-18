import 'package:freezed_annotation/freezed_annotation.dart';

part 'verifiable_presentation.freezed.dart';
part 'verifiable_presentation.g.dart';

@freezed
sealed class VerifiablePresentation with _$VerifiablePresentation {
  const VerifiablePresentation._();
  @JsonSerializable(includeIfNull: false)
  const factory VerifiablePresentation({
    required List<Map<String, dynamic>> verifiableCredential,
  }) = _VerifiablePresentation;

  factory VerifiablePresentation.fromJson(Map<String, Object?> json) =>
      _$VerifiablePresentationFromJson(json);
}
