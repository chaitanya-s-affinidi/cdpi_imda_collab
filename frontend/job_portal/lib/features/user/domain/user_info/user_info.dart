import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(includeIfNull: false)
  const factory UserInfo({
    String? userid,
    String? logourl,
    double? rating,
    // bool? newbie,
    String? profilepicurl,
    String? googleprofilepicurl,
    String? firstname,
    String? lastname,
    String? currency,
    String? country,
    String? phoneId,
    bool? isCompany,
    // bool? isCarrier,
    // bool? isBusinessShipper,
    bool? isOwner,
    String? subscriptioncurrency,
    // bool? forcepasswordchange,
    String? bpname,
    // String? usermode,
    String? status,
    String? businesspartner,
    List<String>? roles,
    String? email,
    bool? helpdesk,
    // bool? temp,
    // bool? newFlag,
    bool? phonenotverifiedFlag,
    String? uuid,
    bool? authenticatedByThirdPartyFlag,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, Object?> json) =>
      _$UserInfoFromJson(json);
}
