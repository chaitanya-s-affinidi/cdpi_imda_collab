// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_compensation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobCompensationImpl _$$JobCompensationImplFromJson(
        Map<String, dynamic> json) =>
    _$JobCompensationImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      salaryInfo: (json['salaryInfo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$JobCompensationImplToJson(
    _$JobCompensationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('salaryInfo', instance.salaryInfo);
  return val;
}
