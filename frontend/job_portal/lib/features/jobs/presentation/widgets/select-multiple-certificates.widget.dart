import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/core/custom_hooks/af_value_notifier.dart';
import 'package:job_portal/core/open_responsive_overlay.widget.dart';
import 'package:job_portal/features/affinidi_tdk_integration/presentation/same_device_flow_with_iota.widget.dart';
import 'package:job_portal/features/affinidi_tdk_integration/presentation/verify_certificate.widget.dart';
import 'package:job_portal/features/credentials/domain/course_credential.dart';
import 'package:job_portal/features/credentials/domain/credential_wrapper.dart';
import 'package:job_portal/features/dedi_lookup/view_dedi_document.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/design_system/legend-wrapper.widget.dart';
import 'package:job_portal/features/inji_oid4vp/presentation/qr_code_with_inji.dart';
import 'package:job_portal/features/jobs/presentation/widgets/view-raw-certificate.widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:job_portal/global_constants.dart';
import 'package:styled_text/styled_text.dart';

class SelectMultipleCertificatesWithOverlayWidget extends HookConsumerWidget {
  final List<CredentialWrapper> initialCertificates;

  const SelectMultipleCertificatesWithOverlayWidget({
    super.key,
    required this.initialCertificates,
    // required this.credentialsselected,
  });

  _buildInstituteLogo({
    required String? instituteLogo,
  }) {
    if ((instituteLogo != null) && (instituteLogo != "")) {
      return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.white70,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
            image: NetworkImage(
              instituteLogo,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          // color: GlobalConstants.backgroundColor,
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.outline,
          // ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Icon(
          Icons.document_scanner,
          size: 36,
          color: Colors.black87,
        ),
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final ValueNotifier<List<CredentialWrapper>> certificatesNotifier =
        useAfValueNotifier(List.unmodifiable(initialCertificates));
    // final ValueNotifier<List<CredentialWrapper>> certificatesNotifier =
    //     useAfValueNotifier(List.unmodifiable(currentList));

// "credentialSubject": {
//      "course": {
//          "name": "IT Automation with Python",
//          "type": "Professional Certificate",
//          "url": "",
//          "courseDuration": "45 Days"
//     }
//      "courseMode": "online",
//      "completionDate": "05/08/2024",
//      "courseID": "EMP-IT-AUTOMATION-2939302",
//      "achievement": {
//          "score": "100",
//          "grade": "A"
//     }
//      "learner": {
//          "name": "Chaitanya S",
//          "phone": "",
//          "email": "chaitanya.s+demo2@affinidi.com"
//     }
// }
    //
    useEffect(() {
      certificatesNotifier.value = initialCertificates;
      return;
    }, [initialCertificates]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 6,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            QRCodeWithInjiWidget(),
            SizedBox(
              height: 6,
            ),
            // SameDeviceFlowWithIotaWidget(),
          ],
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: certificatesNotifier,
            builder: (context, value, _) {
              final certificates = (value as List<CredentialWrapper>).toList();
              return certificates.isNotEmpty
                  ? LegendWrapperWidget(
                      title: 'Attachments',
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                          minWidth: 450,
                          minHeight: 100,
                        ),
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: certificates.asMap().entries.map(
                                  (MapEntry<int, CredentialWrapper> entry) {
                                final int index = entry.key;
                                final CredentialWrapper cred = entry.value;
                                final CourseCredential courseCred =
                                    CourseCredential.fromJson(
                                        cred.vc!["credentialSubject"]
                                            as Map<String, dynamic>);
                                debugPrint("credential Subject received: ");
                                debugPrint(jsonEncode(courseCred.toJson()));
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100,
                                        child: _buildInstituteLogo(
                                          instituteLogo:
                                              courseCred.instituteLogo,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            StyledText(
                                                text: courseCred.courseName ??
                                                    ''),
                                            StyledText(
                                              text: courseCred.instituteName ??
                                                  '',
                                            ),
                                            StyledText(
                                              text:
                                                  courseCred.dateOfCompletion ??
                                                      '',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            MenuAnchor(
                                              builder: (BuildContext context,
                                                  MenuController controller,
                                                  Widget? child) {
                                                return IconButton(
                                                  onPressed: () {
                                                    if (controller.isOpen) {
                                                      controller.close();
                                                    } else {
                                                      controller.open();
                                                    }
                                                  },
                                                  icon: const Icon(
                                                      Icons.more_vert),
                                                  tooltip: 'Show menu',
                                                );
                                              },
                                              menuChildren: <MenuItemButton>[
                                                MenuItemButton(
                                                  onPressed: () {
                                                    OpenResponsiveSimpleOverlay()(
                                                      title: "View Certificate",
                                                      body:
                                                          ViewRawCertificateWidget(
                                                        certificate: cred.vc!,
                                                      ),
                                                      context: context,
                                                    );
                                                  },
                                                  child: Text(
                                                      'View Raw Credential'),
                                                ),
                                                MenuItemButton(
                                                  onPressed: () {
                                                    OpenResponsiveSimpleOverlay()(
                                                      title:
                                                          "Credential Verification",
                                                      body:
                                                          VerifyCertificateWidget(
                                                        certificate: cred.vc!,
                                                        onCredentialVerification:
                                                            ({
                                                          required bool isValid,
                                                        }) {
                                                          List<CredentialWrapper>
                                                              mutableCreds =
                                                              certificates
                                                                  .toList();
                                                          mutableCreds[index] =
                                                              mutableCreds[
                                                                      index]
                                                                  .copyWith(
                                                            isValid: isValid,
                                                          );
                                                          certificatesNotifier
                                                                  .value =
                                                              List.unmodifiable(
                                                            mutableCreds,
                                                          );
                                                        },
                                                      ),
                                                      context: context,
                                                    );
                                                  },
                                                  child: Text('Verify'),
                                                ),
                                                MenuItemButton(
                                                  onPressed: () {
                                                    OpenResponsiveSimpleOverlay()(
                                                      title: "View Issuer DeDi",
                                                      body:
                                                          ViewDediDocumentWidget(
                                                        // did:
                                                        // 'did:cord:3uoLnwheniRv7jwDMC5Uq7GmVT3LxWzC3rdHuYhYdVNj9c98',
                                                        did: cred.vc!["issuer"],
                                                      ),
                                                      context: context,
                                                    );
                                                  },
                                                  child: Text('DeDi Lookup'),
                                                ),
                                              ],
                                            ),
                                            (cred.isValid != null)
                                                ? SizedBox(
                                                    width: 60,
                                                    child: Icon(
                                                      (cred.isValid!
                                                          ? Icons
                                                              .verified_outlined
                                                          : Icons.cancel),
                                                      color: cred.isValid!
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ],
                                    // ),
                                  ),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ActionChip(
                                    label: Text("Add Tampered VC"),
                                    onPressed: () {
                                      Map<String, dynamic> tamperedVC =
                                          jsonDecode(
                                              jsonEncode(certificates[0].vc!));

                                      tamperedVC["credentialSubject"]["email"] =
                                          "fraudster@gmail.com";
                                      // final credWrapper = certificates[0];
                                      final tamperedCredWrapper =
                                          CredentialWrapper(vc: tamperedVC);
                                      // credWrapper.copyWith(vc: tamperedVC);
                                      List<CredentialWrapper> oldcertificates =
                                          certificatesNotifier.value.toList();
                                      oldcertificates.add(tamperedCredWrapper);
                                      debugPrint(
                                          "added new credential, number of credentials now: ${oldcertificates.length}");
                                      certificatesNotifier.value =
                                          List.unmodifiable(oldcertificates);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }
}
