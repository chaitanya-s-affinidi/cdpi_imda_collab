// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
      jobId: json['jobId'] as String?,
      role: json['role'] as String?,
      id: json['id'] as String?,
      providerId: json['providerId'] as String?,
      applicationId: json['applicationId'] as String?,
      company: json['company'] as String?,
      city: json['city'] as String?,
      companyLogo: json['companyLogo'] as String?,
      data: json['data'] as String?,
      bppId: json['bppId'] as String?,
      bppUri: json['bppUri'] as String?,
      createdAt: json['createdAt'] as String?,
      state: json['state'] as String?,
      userSavedItem: json['userSavedItem'] as bool?,
      userAppliedItem: json['userAppliedItem'] as bool?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      responsibilities: (json['responsibilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fulfillmentCategory: (json['fulfillmentCategory'] as List<dynamic>?)
          ?.map(
              (e) => JobFulfillmentCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      compensation: json['compensation'] == null
          ? null
          : JobCompensation.fromJson(
              json['compensation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jobId', instance.jobId);
  writeNotNull('role', instance.role);
  writeNotNull('id', instance.id);
  writeNotNull('providerId', instance.providerId);
  writeNotNull('applicationId', instance.applicationId);
  writeNotNull('company', instance.company);
  writeNotNull('city', instance.city);
  writeNotNull('companyLogo', instance.companyLogo);
  writeNotNull('data', instance.data);
  writeNotNull('bppId', instance.bppId);
  writeNotNull('bppUri', instance.bppUri);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('state', instance.state);
  writeNotNull('userSavedItem', instance.userSavedItem);
  writeNotNull('userAppliedItem', instance.userAppliedItem);
  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  writeNotNull('responsibilities', instance.responsibilities);
  writeNotNull('fulfillmentCategory', instance.fulfillmentCategory);
  writeNotNull('compensation', instance.compensation);
  return val;
}
