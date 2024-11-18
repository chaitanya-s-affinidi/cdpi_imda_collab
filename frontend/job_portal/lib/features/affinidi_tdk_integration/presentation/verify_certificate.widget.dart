import 'package:dio/dio.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/entities/iota_vc_verification_output.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_verification_repository.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/design_system/lottie-animation.widget.dart';
import 'package:job_portal/service_registry.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:job_portal/features/common/widgets/handle_future_builder_connection_state.widget.dart';

class VerifyCertificateWidget extends StatelessWidget {
  final Map<String, dynamic> certificate;
  final Function({
    required bool isValid,
  }) onCredentialVerification;

  const VerifyCertificateWidget({
    super.key,
    required this.certificate,
    required this.onCredentialVerification,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceRegistry.get<AffinidiVerificationRepo>()
          .verifyVCs(vcs: [certificate]),
      builder: (context, AsyncSnapshot ss) {
        switch (ss.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            if (ss.hasError) {
              final err = ss.error as DioException;
              if ((err.type != DioExceptionType.receiveTimeout) &&
                  (err.type != DioExceptionType.connectionTimeout) &&
                  (err.type != DioExceptionType.connectionError)) {
                switch (err.response!.statusCode) {
                  case 400:
                    {
                      onCredentialVerification(isValid: false);
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child:
                                    // Icon(
                                    //   Icons.check_circle,
                                    //   color: Colors.green,
                                    // )
                                    LottieAnimationWidget(
                                  file: 'failed',
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 0),
                                child: DecoratedTextWidget(
                                  content: "Verification failed!!",
                                  bold: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            const SizedBox(
                              height: 20,
                            ),
                            // Center(
                            //   child: ActionChip(
                            //     label: const Text(
                            //       "HOME",
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.normal,
                            //         fontSize: 10,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //     shape: const RoundedRectangleBorder(
                            //       side: BorderSide.none,
                            //       borderRadius: BorderRadius.all(
                            //         Radius.circular(
                            //           50,
                            //         ),
                            //       ),
                            //     ),
                            //     onPressed: () {
                            //       // context.go('/dashboard');
                            //       // Navigator.of(context).pushAndRemoveUntil(
                            //       //   SlideBottomRoute(
                            //       //     page: const DashboardPage(),
                            //       //   ),
                            //       //   (Route<dynamic> route) => false,
                            //       // );
                            //     },
                            //   ),
                            // ),
                          ]);
                    }
                  default:
                    {
                      return Container();
                    }
                }
              } else {
                return Container();
              }
            } else {
              final IotaVCVerificationOutput output =
                  ss.data as IotaVCVerificationOutput;
              // if (output.isValid != null) {
              onCredentialVerification(
                isValid: output.isValid!,
              );
              // }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child:
                              // Icon(
                              //   Icons.check_circle,
                              //   color: Colors.green,
                              // )
                              LottieAnimationWidget(
                            file: 'ok',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          child: DecoratedTextWidget(
                            content: "Verification successful",
                            bold: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Center(
                      //   child: ActionChip(
                      //     backgroundColor: GlobalConstants.backgroundColor,
                      //     label: const Text(
                      //       "HOME",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.normal,
                      //         fontSize: 10,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     shape: const RoundedRectangleBorder(
                      //       side: BorderSide.none,
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(
                      //           50,
                      //         ),
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       // context.go('/dashboard');
                      //       // Navigator.of(context).pushAndRemoveUntil(
                      //       //   SlideBottomRoute(
                      //       //     page: const DashboardPage(),
                      //       //   ),
                      //       //   (Route<dynamic> route) => false,
                      //       // );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  // StyledText(
                  //   text: prettyJson(
                  //     ss.data as Map<String, dynamic>,
                  //     indent: 4,
                  //   ),
                  // ),
                ),
              );
            }
          default:
            {
              return Container();
            }
        }
      },
    );
  }
}
