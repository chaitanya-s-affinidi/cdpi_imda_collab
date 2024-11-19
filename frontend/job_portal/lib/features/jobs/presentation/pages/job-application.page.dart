import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal/core/custom_hooks/af_value_notifier.dart';
import 'package:job_portal/core/open_responsive_overlay.widget.dart';
import 'package:job_portal/features/credentials/domain/credential_wrapper.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/design_system/filled-button-with-feedback-animation.widget.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/get_iota_response_output.dart';
import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';
import 'package:job_portal/features/jobs/domain/entities/job_state_model.dart';
import 'package:job_portal/features/jobs/domain/entities/user_profile.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_redirect_flow_repository.dart';
import 'package:job_portal/features/jobs/domain/repositories/user_profile.provider.dart';
import 'package:job_portal/features/jobs/presentation/pages/application-success.page.dart';
import 'package:job_portal/features/jobs/presentation/widgets/select-multiple-certificates.widget.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/features/jobs/presentation/providers/job.provider.dart';
import 'package:job_portal/global_constants.dart';
import 'package:job_portal/service_registry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobApplicationPage extends HookConsumerWidget {
  const JobApplicationPage({
    super.key,
  });

  _apply({
    required BuildContext context,
  }) {
    OpenResponsiveSimpleOverlay()(
      title: "Application Successful",
      context: context,
      body: ApplicationSuccessPage(),
    );
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final ValueNotifier<JobStateModel> jobModelNotifier =
        useAfValueNotifier(ref.read(jobStateProvider));
    debugPrint(
        "GoRouterState.of(context).uri: ${GoRouterState.of(context).uri.toString()}");
    debugPrint(
        "responseCode: ${GoRouterState.of(context).uri.queryParameters["response_code"] ?? ''}");
    final UserProfile userprofile = ref.read(userModelProvider);
    final Object imageProvider = (userprofile.profilepic != null)
        ? NetworkImage(
            userprofile.profilepic!,
          )
        : AssetImage(
            "assets/profile_pic.jpeg",
          );
    final ValueNotifier<String?> errStringNotifier = useAfValueNotifier(null);
    useMemoized(() async {
      final callbackUri = GoRouterState.of(context).uri;
      if (callbackUri.queryParameters["response_code"] != null) {
        try {
          final GetIotaResponseOutput? response =
              await ServiceRegistry.get<AffinidiRedirectFlowRepo>()
                  .handleOAuthRedirectWeb(
            callbackUri: callbackUri,
          );
          debugPrint(
              "jobApplication Response: ${jsonEncode(response?.toJson())}");
          final List<Map<String, dynamic>> vcs =
              response!.vp.verifiableCredential;
          List<CredentialWrapper> credWrappers = [];
          for (Map<String, dynamic> credMap in vcs) {
            credWrappers.add(
              CredentialWrapper(
                vc: credMap,
              ),
            );
          }
          ref.read(jobStateProvider.notifier).addCertificates(
                certificates: credWrappers,
              );
          jobModelNotifier.value = jobModelNotifier.value.copyWith(
            certificates: [
              ...jobModelNotifier.value.certificates,
              ...credWrappers
            ],
          );
        } on Exception catch (err) {
          errStringNotifier.value = err.toString();
        }
      }
    }, []);
    useEffect(() {
      final subscription = ref.read(newCredentialsProvider).stream;
      subscription.listen(
        (data) {
          final newcredential = data as Map<String, dynamic>;
          final newcredentialWrapper = CredentialWrapper(
            vc: newcredential,
          );
          ref.read(jobStateProvider.notifier).addCertificates(
            certificates: [newcredentialWrapper],
          );
          jobModelNotifier.value = jobModelNotifier.value.copyWith(
            certificates: [
              ...jobModelNotifier.value.certificates,
              newcredentialWrapper,
            ],
          );
        },
      );
      return;
// (){
//   subscription.;
// };
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConstants.backgroundColor,
        title: const Text(
          "Job Application",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: errStringNotifier,
          builder: (context, errString, _) {
            return (errString != null)
                ? Text(errString)
                : ValueListenableBuilder(
                    valueListenable: jobModelNotifier,
                    builder: (context, jobModel, _) {
                      return Column(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Expanded(
                            // child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  isThreeLine: true,
                                  dense: true,
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.5,
                                        color: Colors.white70,
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.centerLeft,
                                        image: imageProvider as ImageProvider,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                      "${userprofile.givenName ?? ''} ${userprofile.familyName ?? ''}"),
                                  subtitle: Text(
                                    userprofile.email ?? '',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                //   ;
                                // }),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Title",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            "Sr. Engineering Manager",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            "36 yrs",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                DecoratedTextWidget(
                                  content: "Skills",
                                  fontSize: 12,
                                  textColor: Colors.black54,
                                  textAlign: TextAlign.start,
                                ),
                                DecoratedTextWidget(
                                  content:
                                      "Data Analytics, Project Management, Software Architecture, C, C++, Mobile Development, Typescript",
                                  fontSize: 12,
                                  textColor: Colors.black87,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SelectMultipleCertificatesWithOverlayWidget(
                                  initialCertificates: jobModel.certificates,
                                ),
                              ],
                            ),
                          ),
                          // : Container(),
                          // ),
                          Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 20,
                            ),
                            child: FilledButtonWithFeedbackAnimationWidget(
                              color: Colors.amber,
                              textColor: Colors.black87,
                              processingFlag: false,
                              text: "APPLY",
                              onPressed: () {
                                _apply(context: context);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
