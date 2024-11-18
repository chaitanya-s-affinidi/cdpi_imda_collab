// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_fulfillment_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobFulfillmentCategoryImpl _$$JobFulfillmentCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$JobFulfillmentCategoryImpl(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$JobFulfillmentCategoryImplToJson(
    _$JobFulfillmentCategoryImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  return val;
}
