// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialWrapperImpl _$$CredentialWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$CredentialWrapperImpl(
      vc: json['vc'] as Map<String, dynamic>?,
      isValid: json['isValid'] as bool?,
    );

Map<String, dynamic> _$$CredentialWrapperImplToJson(
    _$CredentialWrapperImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vc', instance.vc);
  writeNotNull('isValid', instance.isValid);
  return val;
}
