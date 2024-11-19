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

  final channel =
      WebSocketChannel.connect(Uri.parse(dotenv.env["BACKEND_WEBSOCKET_URL"]!));
  bool _isConnected = false;
  @override
  Future<void> call(NoParams params) async {
    connect();
    // final wsUrl = Uri.parse('wss://right-minnow-leading.ngrok-free.app:3001');
  }

  void _reconnect() async {
    if (!_isConnected) {
      await Future.delayed(Duration(seconds: 2)); // Initial delay
      await connect();
      // Increase delay for subsequent attempts (optional)
    }
  }

  connect() async {
    await channel.ready;
    channel.stream.listen((event) {
      String eventData = event as String;
      if (eventData == "ping") {
        channel.sink.add("pong");
      } else {}
    }, onError: (error) {
      _isConnected = false;
      _reconnect();
    }, onDone: () {
      _isConnected = false;
      _reconnect();
    });
  }
}
