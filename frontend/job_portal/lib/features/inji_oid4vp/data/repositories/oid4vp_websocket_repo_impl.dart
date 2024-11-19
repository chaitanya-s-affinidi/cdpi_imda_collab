import 'package:job_portal/features/inji_oid4vp/domain/providers/new_credentials.provider.dart';
import 'package:job_portal/features/inji_oid4vp/domain/repositories/oid4vp_websocket_repo.dart';
import 'package:job_portal/features/inji_oid4vp/domain/usecases/handle_event_data_from_web_socket.dart';
import 'package:job_portal/service_registry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Oid4vpWebsocketRepoImpl implements Oid4vpWebsocketRepo {
  final channel =
      WebSocketChannel.connect(Uri.parse(dotenv.env["BACKEND_WEBSOCKET_URL"]!));
  bool _isConnected = false;

  @override
  Future startListening({
    required NewCredentials newCredentials,
  }) {
    return connect(
      newCredentials: newCredentials,
    );
    // final wsUrl = Uri.parse('wss://right-minnow-leading.ngrok-free.app:3001');
  }

  void _reconnect({
    required NewCredentials newCredentials,
  }) async {
    if (!_isConnected) {
      await Future.delayed(Duration(seconds: 2)); // Initial delay
      await connect(
        newCredentials: newCredentials,
      );
      // Increase delay for subsequent attempts (optional)
    }
  }

  connect({
    required NewCredentials newCredentials,
  }) async {
    await channel.ready;
    channel.stream.listen((event) {
      String eventData = event as String;
      if (eventData == "ping") {
        channel.sink.add("pong");
      } else {
        HandleEventDataFromWebsocket(
          sharedPrefs: ServiceRegistry.get<SharedPreferences>(),
          newCredentials: newCredentials,
        );
      }
    }, onError: (error) {
      _isConnected = false;
      _reconnect(
        newCredentials: newCredentials,
      );
    }, onDone: () {
      _isConnected = false;
      _reconnect(
        newCredentials: newCredentials,
      );
    });
  }
}
