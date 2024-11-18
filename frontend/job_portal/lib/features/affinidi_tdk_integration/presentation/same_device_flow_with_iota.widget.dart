import 'package:job_portal/core/usecases/usecase.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_redirect_flow_repository.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/usecases/get_iota_redirect_response.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/service_registry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SameDeviceFlowWithIotaWidget extends StatelessWidget {
  const SameDeviceFlowWithIotaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          height: 34,
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: ActionChip(
            backgroundColor: GlobalConstants.backgroundColor,
            label: const Text(
              "ATTACH CERTIFICATES",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            onPressed: () async {
              try {
                final authRedirectFlowRepo =
                    ServiceRegistry.get<AffinidiRedirectFlowRepo>();
                final SharedPreferences prefs =
                    ServiceRegistry.get<SharedPreferences>();
                await GetIotaRedirectResponse(
                  authRedirectFlowRepo,
                  prefs,
                )(
                  NoParams(),
                );
              } catch (e) {
                print(
                    'Exception when calling CallbackApi->iotOIDC4VPCallback: $e\n');
              }
            },
          ),
        ),
      ),
    );
  }
}
