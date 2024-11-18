import 'package:job_portal/core/usecases/usecase.dart';
import 'package:job_portal/features/inji_oid4vp/domain/usecases/generate_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/service_registry.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_text/styled_text.dart';

class QRCodeWithInjiWidget extends StatelessWidget {
  const QRCodeWithInjiWidget({
    super.key,
    // required this.credentialsselected,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    // final ValueNotifier<List<Map<String, dynamic>>> certificatesNotifier =
    //     useAfValueNotifier(initialCertificates);
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

    return Card.outlined(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          children: <Widget>[
            StyledText(text: "Scan to share"),
            SizedBox(
              height: 4,
            ),
            FutureBuilder(
              future: GenerateQRCode(
                sharedPrefs: ServiceRegistry.get<SharedPreferences>(),
              )(NoParams()),
              builder: (BuildContext context, AsyncSnapshot ss) {
                if (ss.hasData) {
                  final openidurl = ss.data as String;
                  return QrImageView(
                    data: openidurl,
                    version: QrVersions.auto,
                    size: 300.0,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
