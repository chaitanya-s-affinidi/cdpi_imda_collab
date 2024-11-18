import 'package:dio/dio.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_flow_response.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/start_iota_redirect_flow_input.dart';
import 'package:retrofit/retrofit.dart';

part 'backend_iota_api.g.dart';

@RestApi()
abstract class BackendIotaApi {
  factory BackendIotaApi(Dio dio, {String baseUrl}) = _BackendIotaApi;
  @POST('/api/iota/start-redirect-flow')
  Future<StartIotaFlowResponse> startRedirectFlow(
    @Body() StartIotaRedirectFlowInput input,
  );

  @POST('/api/iota/iota-response')
  Future<GetIotaResponseOutput> getIotaResponse(
    @Body() GetIotaResponseInput input,
  );

  @POST('/api/iota/verify')
  Future<IotaVCVerificationOutput> verifyVCs(
    @Body() IotaVCVerificationInput input,
  );
}
