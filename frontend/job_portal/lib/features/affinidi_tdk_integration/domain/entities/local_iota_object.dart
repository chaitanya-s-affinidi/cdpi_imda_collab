import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_iota_object.freezed.dart';
part 'local_iota_object.g.dart';

@freezed
sealed class LocalIotaObject with _$LocalIotaObject {
  const LocalIotaObject._();
  @JsonSerializable(includeIfNull: false)
  const factory LocalIotaObject({
    String? correlationId,
    String? transactionId,
    String? nounce,
    // String? configurationId,
  }) = _LocalIotaObject;

  factory LocalIotaObject.fromJson(Map<String, Object?> json) =>
      _$LocalIotaObjectFromJson(json);
}
