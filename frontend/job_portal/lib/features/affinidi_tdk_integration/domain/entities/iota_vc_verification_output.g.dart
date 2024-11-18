// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iota_vc_verification_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IotaVCVerificationOutputImpl _$$IotaVCVerificationOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$IotaVCVerificationOutputImpl(
      isValid: json['isValid'] as bool?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$IotaVCVerificationOutputImplToJson(
    _$IotaVCVerificationOutputImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isValid', instance.isValid);
  writeNotNull('errors', instance.errors);
  return val;
}
