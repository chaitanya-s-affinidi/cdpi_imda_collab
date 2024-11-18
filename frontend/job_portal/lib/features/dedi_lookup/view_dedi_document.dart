import 'dart:convert';
import 'package:pretty_json/pretty_json.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:http/http.dart' as http;

class ViewDediDocumentWidget extends StatelessWidget {
  final String did;
  const ViewDediDocumentWidget({
    super.key,
    required this.did,
  });

  @override
  Widget build(BuildContext context) {
    final Future<http.Response> future =
        http.get(Uri.parse('https://demo.lookup.dedi.global/dedi/search/$did'));
    // final Future<http.Response> future = http.get(Uri.parse(
    //     'https://lookup.dedi.global/dedi/lookup/issuer/registry:cord:bdmtKNNbyPBKUmpa89XPGCsmt9MXM9G68obB15XSsUiE2hEBo/entry:cord:u31oJQwK5v8rwy2Y39V73VqZxkYG4mxBs6wQWqNVQrRhSPvjE'));
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot ss) {
        if (ss.hasData) {
          final resp = ss.data as http.Response;
          final Map<String, dynamic> dediDoc = jsonDecode(resp.body as String);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StyledText(text: did),
                  SizedBox(height: 8),
                  StyledText(
                    text: prettyJson(
                      dediDoc,
                      indent: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
