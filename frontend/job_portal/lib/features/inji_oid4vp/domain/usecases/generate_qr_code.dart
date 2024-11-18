import 'dart:convert';

import 'package:job_portal/core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class GenerateQRCode implements UseCase<String, NoParams> {
  final SharedPreferences sharedPrefs;
  GenerateQRCode({
    required this.sharedPrefs,
  });

  @override
  Future<String> call(NoParams params) async {
    final String response_uri =
        "https://right-minnow-leading.ngrok-free.app/inji/callback";
    // https://23df-2405-201-c058-b814-b126-8ba3-836a-f16d.ngrok-free.app/verifier/vp-response
    final requestId = Uuid().v4();
    final transactionId = Uuid().v4();
    sharedPrefs.setString("oid4vp_request_id", requestId);
    final String openidurl =
        'openid4vp://authorize?${base64.encode(('client_id=https://injiverify.dev1.mosip.net&transactionId=$transactionId&presentation_definition={"id":"vp token example","purpose":"Relying party is requesting your digital ID for the purpose of Self-Authentication","format":{"ldp_vc":{"proof_type":["RsaSignature2018","EcdsaSecp256k1Signature2019","Ed25519Signature2020"]}},"input_descriptors":[{"id":"id card credential","format":{"ldp_vc":{"proof_type":["Ed25519Signature2020","RsaSignature2018", "EcdsaSecp256k1Signature2019"]}},"constraints":{"fields":[{"path":["\$.credentialSubject.email"],"filter":{"type":"string","pattern":"@gmail.com"}}]}}]}&response_type=vp_token&response_mode=direct_post&nonce=NUfki5MRgXXmMgXHDeX/6Q==&state=$requestId&response_uri=$response_uri&client_metadata={"name":"Requester name"}').codeUnits)}';
    return Future.value(openidurl);
  }
}
