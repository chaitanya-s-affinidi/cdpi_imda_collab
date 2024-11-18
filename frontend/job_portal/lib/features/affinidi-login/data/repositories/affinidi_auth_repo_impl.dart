import 'dart:convert';

import 'package:job_portal/features/affinidi-login/data/data_sources/affinidi_auth_api.dart';
import 'package:job_portal/features/affinidi-login/data/models/complete_auth_input.dart';
import 'package:job_portal/features/affinidi-login/data/models/init_auth_response.dart';
import 'package:job_portal/features/affinidi-login/domain/repositories/affinidi_auth_repo.dart';
import 'package:flutter/foundation.dart';

class RetrofitAffinidiAuthRepositoryImpl implements AffinidiAuthRepo {
  final AffinidiAuthApi remoteDataSource;

  RetrofitAffinidiAuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Map<String, dynamic>> handleOAuthRedirectWeb(
    Uri authCodeRedirectUri,
  ) async {
    debugPrint("authCodeRedirectUri: ${authCodeRedirectUri.toString()}");
    final input = CompleteAuthInput(
      code: authCodeRedirectUri.queryParameters["code"]!,
      state: authCodeRedirectUri.queryParameters["state"]!,
    );
    final result = await remoteDataSource.complete(input: input);
    final userMap =
        ((result as Map<String, dynamic>)["user"] as Map<String, dynamic>);
    debugPrint("userMap: ${jsonEncode(userMap)}");
    return userMap;
  }

  @override
  Future<InitAuthResponse> init() {
    return remoteDataSource.init();
  }
}
