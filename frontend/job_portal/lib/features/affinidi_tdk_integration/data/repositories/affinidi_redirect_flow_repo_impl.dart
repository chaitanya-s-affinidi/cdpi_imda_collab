import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:job_portal/features/affinidi_tdk_integration/data/data_sources/backend_iota_api.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/local_iota_object.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_flow_response.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_redirect_flow_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_redirect_flow_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetrofitAffinidiRedirectFlowRepositoryImpl
    implements AffinidiRedirectFlowRepo {
  final BackendIotaApi remoteDataSource;
  final SharedPreferences prefs;

  RetrofitAffinidiRedirectFlowRepositoryImpl({
    required this.remoteDataSource,
    required this.prefs,
  });

  @override
  Future<GetIotaResponseOutput?> handleOAuthRedirectWeb({
    required Uri callbackUri,
  }) {
    if (callbackUri.queryParameters["response_code"] != null) {
      final localIotaObjectString = prefs.getString("iotaRedirect");
      final localObject =
          LocalIotaObject.fromJson(jsonDecode(localIotaObjectString!));
      debugPrint("iotaRedirect: ${jsonEncode(localObject.toJson())}");

      final input = GetIotaResponseInput(
        responseCode: callbackUri.queryParameters["response_code"]!,
        configurationId: dotenv.env['IOTA_CONFIGURATION_ID'],
        correlationId: localObject.correlationId,
        transactionId: localObject.transactionId,
      );

      return remoteDataSource.getIotaResponse(
        input,
      );
    } else {
      return Future.value(null);
    }
  }

  @override
  Future<StartIotaFlowResponse> startRedirectFlow({
    required StartIotaRedirectFlowInput input,
  }) {
    return remoteDataSource.startRedirectFlow(
      input,
    );
  }
}
