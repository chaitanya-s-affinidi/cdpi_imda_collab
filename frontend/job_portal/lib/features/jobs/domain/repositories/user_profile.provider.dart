import 'dart:convert';

import 'package:job_portal/features/jobs/domain/entities/user_profile.dart';
import 'package:job_portal/service_registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_profile.provider.g.dart';

@Riverpod(keepAlive: true)
class UserModel extends _$UserModel {
  @override
  UserProfile build() {
    final prefs = ServiceRegistry.get<SharedPreferences>();
    final String? userProfileString = prefs.getString('userprofile');
    if (userProfileString != null) {
      return UserProfile.fromJson(jsonDecode(userProfileString));
    }
    return UserProfile();
  }

  setUserProfile({required UserProfile profile}) {
    final prefs = ServiceRegistry.get<SharedPreferences>();
    prefs.setString('userprofile', jsonEncode(profile.toJson()));

    state = profile;
  }
}
