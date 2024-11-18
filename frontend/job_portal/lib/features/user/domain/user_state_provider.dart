import 'package:job_portal/features/user/domain/user_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_state_provider.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  UserStateModel build() {
    return UserStateModel(userInfo: null);
  }
}
