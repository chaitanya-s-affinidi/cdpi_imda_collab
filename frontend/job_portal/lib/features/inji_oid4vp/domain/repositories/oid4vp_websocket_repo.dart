import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';

abstract class Oid4vpWebsocketRepo {
  Future startListening({
    required NewCredentials newCredentials,
  });
}
