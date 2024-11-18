import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
sealed class UserProfile with _$UserProfile {
  const UserProfile._();
  @JsonSerializable(includeIfNull: false)
  const factory UserProfile({
    String? givenName,
    String? familyName,
    String? email,
    String? did,
    String? profilepic,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}
