import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_output.dart';

abstract class AffinidiVerificationRepo {
  Future<IotaVCVerificationOutput> verifyVCs({
    required List<Map<String, dynamic>> vcs,
  });
}
