import 'package:flutter/material.dart';
import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';
import 'package:job_portal/features/inji_oid4vp/domain/repositories/oid4vp_websocket_repo.dart';
import 'package:job_portal/features/inji_oid4vp/domain/usecases/handle_event_data_from_web_socket.dart';
import 'package:job_portal/service_registry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:async';

class Oid4vpWebsocketRepoImpl implements Oid4vpWebsocketRepo {
  final channel =
      WebSocketChannel.connect(Uri.parse(dotenv.env["BACKEND_WEBSOCKET_URL"]!));
  bool _isConnected = false;
  Timer? _pingTimer;
  final int pingInterval = 3; // seconds

  @override
  Future startListening({
    required NewCredentials newCredentials,
  }) {
    return connect(
      newCredentials: newCredentials,
    );
  }

  void _reconnect({
    required NewCredentials newCredentials,
  }) async {
    if (!_isConnected) {
      await Future.delayed(Duration(seconds: 2)); // Initial delay
      await connect(
        newCredentials: newCredentials,
      );
    }
  }

  connect({
    required NewCredentials newCredentials,
  }) async {
    await channel.ready;

    channel.stream.listen((event) {
      _isConnected = true;
      String eventData = event as String;
      debugPrint("received Event data: $eventData");
      if (eventData == "ping") {
        channel.sink.add("pong");
      } else {
        debugPrint("Data sent to HandleEventData");
        HandleEventDataFromWebsocket(
          sharedPrefs: ServiceRegistry.get<SharedPreferences>(),
          newCredentials: newCredentials,
        )(HandleEventDataFromWebsocketParams(eventData: eventData));
      }
    }, onError: (error) {
      _isConnected = false;
      _pingTimer?.cancel();
      _reconnect(
        newCredentials: newCredentials,
      );
    }, onDone: () {
      _isConnected = false;
      _pingTimer?.cancel();
      _reconnect(
        newCredentials: newCredentials,
      );
    });

    _startPingTimer();
  }

  void _startPingTimer() {
    _pingTimer = Timer.periodic(Duration(seconds: pingInterval), (_) {
      // debugPrint("ping message to be if connected");
      if (_isConnected) {
        channel.sink.add("ping");
      }
    });
  }
}
