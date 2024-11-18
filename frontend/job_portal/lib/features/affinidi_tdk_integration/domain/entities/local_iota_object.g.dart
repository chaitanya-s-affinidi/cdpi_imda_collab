// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_iota_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalIotaObjectImpl _$$LocalIotaObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalIotaObjectImpl(
      correlationId: json['correlationId'] as String?,
      transactionId: json['transactionId'] as String?,
      nounce: json['nounce'] as String?,
    );

Map<String, dynamic> _$$LocalIotaObjectImplToJson(
    _$LocalIotaObjectImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correlationId', instance.correlationId);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('nounce', instance.nounce);
  return val;
}
