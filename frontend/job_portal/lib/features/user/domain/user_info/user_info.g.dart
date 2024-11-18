// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userid: json['userid'] as String?,
      logourl: json['logourl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      profilepicurl: json['profilepicurl'] as String?,
      googleprofilepicurl: json['googleprofilepicurl'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      currency: json['currency'] as String?,
      country: json['country'] as String?,
      phoneId: json['phoneId'] as String?,
      isCompany: json['isCompany'] as bool?,
      isOwner: json['isOwner'] as bool?,
      subscriptioncurrency: json['subscriptioncurrency'] as String?,
      bpname: json['bpname'] as String?,
      status: json['status'] as String?,
      businesspartner: json['businesspartner'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      email: json['email'] as String?,
      helpdesk: json['helpdesk'] as bool?,
      phonenotverifiedFlag: json['phonenotverifiedFlag'] as bool?,
      uuid: json['uuid'] as String?,
      authenticatedByThirdPartyFlag:
          json['authenticatedByThirdPartyFlag'] as bool?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userid', instance.userid);
  writeNotNull('logourl', instance.logourl);
  writeNotNull('rating', instance.rating);
  writeNotNull('profilepicurl', instance.profilepicurl);
  writeNotNull('googleprofilepicurl', instance.googleprofilepicurl);
  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('currency', instance.currency);
  writeNotNull('country', instance.country);
  writeNotNull('phoneId', instance.phoneId);
  writeNotNull('isCompany', instance.isCompany);
  writeNotNull('isOwner', instance.isOwner);
  writeNotNull('subscriptioncurrency', instance.subscriptioncurrency);
  writeNotNull('bpname', instance.bpname);
  writeNotNull('status', instance.status);
  writeNotNull('businesspartner', instance.businesspartner);
  writeNotNull('roles', instance.roles);
  writeNotNull('email', instance.email);
  writeNotNull('helpdesk', instance.helpdesk);
  writeNotNull('phonenotverifiedFlag', instance.phonenotverifiedFlag);
  writeNotNull('uuid', instance.uuid);
  writeNotNull(
      'authenticatedByThirdPartyFlag', instance.authenticatedByThirdPartyFlag);
  return val;
}
