// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oid4vp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Oid4vpResponseImpl _$$Oid4vpResponseImplFromJson(Map<String, dynamic> json) =>
    _$Oid4vpResponseImpl(
      vp_token: json['vp_token'] == null
          ? null
          : VerifiablePresentation.fromJson(
              json['vp_token'] as Map<String, dynamic>),
      presentation_submission: json['presentation_submission'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$Oid4vpResponseImplToJson(
    _$Oid4vpResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vp_token', instance.vp_token);
  writeNotNull('presentation_submission', instance.presentation_submission);
  writeNotNull('state', instance.state);
  return val;
}
