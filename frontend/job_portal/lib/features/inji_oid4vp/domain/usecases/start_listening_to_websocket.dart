import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_portal/core/usecases/usecase.dart';
import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StartListeningToWebsocket implements UseCase<void, NoParams> {
  final SharedPreferences sharedPrefs;
  final NewCredentials newCredentials;
  StartListeningToWebsocket({
    required this.sharedPrefs,
    required this.newCredentials,
  });

  @override
  Future<void> call(NoParams params) async {
    // final wsUrl = Uri.parse('wss://right-minnow-leading.ngrok-free.app:3001');
    final wsUrl = Uri.parse(dotenv.env["BACKEND_WEBSOCKET_URL"]!);
    final channel = WebSocketChannel.connect(wsUrl);

    await channel.ready;
    channel.stream.listen((event) {
      String eventData = event as String;
      if (eventData == "ping") {
        channel.sink.add("pong");
      } else {
        final oid4vpresp = (jsonDecode(eventData) as Map<String, dynamic>);
        final vp_token_string = oid4vpresp["vp_token"];
        final Map<String, dynamic> vp_token =
            jsonDecode(vp_token_string) as Map<String, dynamic>;
        final List<dynamic> vcStringList = vp_token["verifiableCredential"];

        final List<Map<String, dynamic>> vcs = [];
        for (dynamic vcString in vcStringList) {
          final vc = jsonDecode(vcString as String)["verifiableCredential"]
              ["credential"];
          vcs.add(vc);
        }
        // debugPrint("vc from websocket");
        // debugPrint(jsonEncode(vcs[0]));
        final String requestId =
            sharedPrefs.getString("oid4vp_request_id") ?? '';
        final String? oid4vpstate = oid4vpresp["state"];
        debugPrint(
            "requestId from shared prefs: $requestId, state from oid4vp response: ${oid4vpstate ?? ''}");
        if (requestId == oid4vpstate) {
          for (Map<String, dynamic> vc in vcs) {
            newCredentials.addNewCredential(vc);
          }
        }
      }
    });
  }
}
