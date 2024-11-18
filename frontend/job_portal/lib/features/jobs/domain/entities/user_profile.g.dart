// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      email: json['email'] as String?,
      did: json['did'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('givenName', instance.givenName);
  writeNotNull('familyName', instance.familyName);
  writeNotNull('email', instance.email);
  writeNotNull('did', instance.did);
  writeNotNull('profilepic', instance.profilepic);
  return val;
}
