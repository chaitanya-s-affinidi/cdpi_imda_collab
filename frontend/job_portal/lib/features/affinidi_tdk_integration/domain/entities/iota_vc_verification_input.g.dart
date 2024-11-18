// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iota_vc_verification_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IotaVCVerificationInputImpl _$$IotaVCVerificationInputImplFromJson(
        Map<String, dynamic> json) =>
    _$IotaVCVerificationInputImpl(
      vcs: (json['vcs'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$IotaVCVerificationInputImplToJson(
    _$IotaVCVerificationInputImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vcs', instance.vcs);
  return val;
}
