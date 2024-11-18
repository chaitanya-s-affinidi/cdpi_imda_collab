// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_iota_flow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartIotaFlowResponseImpl _$$StartIotaFlowResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartIotaFlowResponseImpl(
      correlationId: json['correlationId'] as String?,
      transactionId: json['transactionId'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$$StartIotaFlowResponseImplToJson(
    _$StartIotaFlowResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correlationId', instance.correlationId);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('jwt', instance.jwt);
  return val;
}
