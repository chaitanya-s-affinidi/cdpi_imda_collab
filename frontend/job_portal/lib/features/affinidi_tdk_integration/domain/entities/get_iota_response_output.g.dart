// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_iota_response_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetIotaResponseOutputImpl _$$GetIotaResponseOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$GetIotaResponseOutputImpl(
      vp: VerifiablePresentation.fromJson(json['vp'] as Map<String, dynamic>),
      nonce: json['nonce'] as String,
    );

Map<String, dynamic> _$$GetIotaResponseOutputImplToJson(
        _$GetIotaResponseOutputImpl instance) =>
    <String, dynamic>{
      'vp': instance.vp,
      'nonce': instance.nonce,
    };
