// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_iota_redirect_flow_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartIotaRedirectFlowInputImpl _$$StartIotaRedirectFlowInputImplFromJson(
        Map<String, dynamic> json) =>
    _$StartIotaRedirectFlowInputImpl(
      configurationId: json['configurationId'] as String?,
      queryId: json['queryId'] as String?,
      redirectUri: json['redirectUri'] as String?,
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$$StartIotaRedirectFlowInputImplToJson(
    _$StartIotaRedirectFlowInputImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationId', instance.configurationId);
  writeNotNull('queryId', instance.queryId);
  writeNotNull('redirectUri', instance.redirectUri);
  writeNotNull('nonce', instance.nonce);
  return val;
}
