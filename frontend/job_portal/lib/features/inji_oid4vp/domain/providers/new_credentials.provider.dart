import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'new_credentials.provider.g.dart';

@Riverpod(keepAlive: true)
class NewCredentials extends _$NewCredentials {
  final StreamController<Map<String, dynamic>> streamController =
      StreamController<Map<String, dynamic>>.broadcast();

  @override
  StreamController<Map<String, dynamic>> build() {
    ref.onDispose(() {
      streamController.close();
    });
    return streamController;
  }

  addNewCredential(Map<String, dynamic> newCredential) {
    streamController.sink.add(newCredential);
  }
}
