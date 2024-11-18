import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkWidget extends StatelessWidget {
  final String? url;
  final Widget? bodyWidget;
  final String? body;
  final PersistentBottomSheetController? persistentBottomSheetController;
  const ExternalLinkWidget({
    super.key,
    this.body,
    this.bodyWidget,
    this.persistentBottomSheetController,
    required this.url,
  });
  launchWithErrorHandling({
    required BuildContext context,
    required String url,
  }) {
    if (persistentBottomSheetController != null) {
      persistentBottomSheetController!.close();
    }
    // canLaunchUrl(uri).then((canLaunchSuccess) {
    //   if (canLaunchSuccess) {
    //     // MessageBoard.newmessage(
    //     //     scaffoldKey: scaffoldKey, body: "Processing your request...");
    // launchUrl(uri);
    //   } else {
    //     MessageBoard.newmessage(
    //       body: "Could not launch " + url,
    //       context: context,
    //     );
    //   }
    // });
    Uri uri = Uri.parse(url);
    try {
      launchUrl(uri);
    } catch (e) {
      // MessageBoard.newmessage(
      //   body: "Could not launch " + url,
      //   context: context,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: (bodyWidget != null)
              ? bodyWidget
              : ((body != null)
                  ? RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.deepPurple.shade600,
                          fontFamily: "DM Sans Medium",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: body,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()),
          onTap: () {
            debugPrint("external link onTap called with url: " + url!);
            launchWithErrorHandling(
              context: context,
              url: url!,
            );
          },
        ),
      ],
    );
  }
}
