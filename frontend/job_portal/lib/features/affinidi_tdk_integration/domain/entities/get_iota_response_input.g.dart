// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_iota_response_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetIotaResponseInputImpl _$$GetIotaResponseInputImplFromJson(
        Map<String, dynamic> json) =>
    _$GetIotaResponseInputImpl(
      configurationId: json['configurationId'] as String?,
      correlationId: json['correlationId'] as String?,
      transactionId: json['transactionId'] as String?,
      responseCode: json['responseCode'] as String?,
    );

Map<String, dynamic> _$$GetIotaResponseInputImplToJson(
    _$GetIotaResponseInputImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationId', instance.configurationId);
  writeNotNull('correlationId', instance.correlationId);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('responseCode', instance.responseCode);
  return val;
}
