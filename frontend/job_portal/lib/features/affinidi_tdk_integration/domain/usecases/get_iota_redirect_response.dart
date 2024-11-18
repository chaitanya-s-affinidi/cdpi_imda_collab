import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:job_portal/core/usecases/usecase.dart';
import 'package:job_portal/core/vault_utils.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/local_iota_object.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_flow_response.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_redirect_flow_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_redirect_flow_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetIotaRedirectResponse implements UseCase<void, NoParams> {
  final AffinidiRedirectFlowRepo redirectFlowRepo;
  final SharedPreferences sharedPrefs;

  GetIotaRedirectResponse(
    this.redirectFlowRepo,
    this.sharedPrefs,
  );

  @override
  Future<void> call(NoParams params) async {
    final String uuid = Uuid().v4();
    final String nounce = uuid.substring(0, 10);

    final StartIotaFlowResponse response =
        await redirectFlowRepo.startRedirectFlow(
      input: StartIotaRedirectFlowInput(
        configurationId: dotenv.env['IOTA_CONFIGURATION_ID'],
        queryId: dotenv.env['IOTA_QUERY_ID'],
        redirectUri: dotenv.env['IOTA_REDIRECT_URL'],
        nonce: nounce,
      ),
    );
    final localObject = LocalIotaObject(
      correlationId: response.correlationId,
      transactionId: response.transactionId,
      nounce: nounce,
    );
    debugPrint("iotaRedirect: ${jsonEncode(localObject.toJson())}");
    sharedPrefs.setString("iotaRedirect", jsonEncode(localObject.toJson()));
    final vaultLink =
        VaultUtils.buildShareLink(response.jwt ?? '', "client_id");
    debugPrint("vaultLink: $vaultLink");
    final Uri uri = Uri.parse(vaultLink);
    launchUrl(uri);

    return;
  }
}
