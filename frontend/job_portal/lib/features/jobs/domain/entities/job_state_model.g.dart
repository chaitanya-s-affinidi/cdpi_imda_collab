// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobStateModelImpl _$$JobStateModelImplFromJson(Map<String, dynamic> json) =>
    _$JobStateModelImpl(
      job: Job.fromJson(json['job'] as Map<String, dynamic>),
      certificates: (json['certificates'] as List<dynamic>)
          .map((e) => CredentialWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JobStateModelImplToJson(_$JobStateModelImpl instance) =>
    <String, dynamic>{
      'job': instance.job,
      'certificates': instance.certificates,
    };
