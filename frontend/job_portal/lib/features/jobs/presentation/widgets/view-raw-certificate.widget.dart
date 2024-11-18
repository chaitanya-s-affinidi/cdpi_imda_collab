import 'dart:convert';
import 'package:pretty_json/pretty_json.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class ViewRawCertificateWidget extends StatelessWidget {
  final Map<String, dynamic> certificate;
  const ViewRawCertificateWidget({
    super.key,
    required this.certificate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: StyledText(
          text: prettyJson(
            certificate,
            indent: 4,
          ),
        ),
      ),
    );
  }
}
