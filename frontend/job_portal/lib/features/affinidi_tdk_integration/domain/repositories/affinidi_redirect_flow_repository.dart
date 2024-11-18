import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_flow_response.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_redirect_flow_input.dart';

abstract class AffinidiRedirectFlowRepo {
  Future<StartIotaFlowResponse> startRedirectFlow({
    required StartIotaRedirectFlowInput input,
  });

  Future<GetIotaResponseOutput?> handleOAuthRedirectWeb({
    required Uri callbackUri,
  });
}
