import 'package:job_portal/features/affinidi_tdk_integration/data/data_sources/backend_iota_api.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_input.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_verification_repository.dart';

class RetrofitAffinidiVerificationRepositoryImpl
    implements AffinidiVerificationRepo {
  final BackendIotaApi remoteDataSource;

  RetrofitAffinidiVerificationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<IotaVCVerificationOutput> verifyVCs({
    required List<Map<String, dynamic>> vcs,
  }) {
    return remoteDataSource.verifyVCs(
      IotaVCVerificationInput(
        vcs: vcs,
      ),
    );
  }
}
