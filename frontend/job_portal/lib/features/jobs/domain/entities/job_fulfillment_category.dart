import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_fulfillment_category.freezed.dart';
part 'job_fulfillment_category.g.dart';

@freezed
sealed class JobFulfillmentCategory with _$JobFulfillmentCategory {
  const JobFulfillmentCategory._();
  @JsonSerializable(includeIfNull: false)
  const factory JobFulfillmentCategory({
    String? id,
    String? type,
  }) = _JobFulfillmentCategory;

  factory JobFulfillmentCategory.fromJson(Map<String, Object?> json) =>
      _$JobFulfillmentCategoryFromJson(json);
}
