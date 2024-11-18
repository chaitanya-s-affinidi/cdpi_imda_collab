// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthenticationState with ChangeNotifier {
//   String? _accessToken;

//   String? _did;
//   String? _idToken;
//   String? _userID;
//   String? _userEmail;
//   String? get accessToken => _accessToken;

//   String? get did => _did;

//   String? get idToken => _idToken;
//   String? get userID => _userID;

//   String? get userEmail => _userEmail;

//   setAuthorization({
//     required ConfirmSignInOutput signInConfirmationOutput,
//     required String userId,
//     required String userEmail,
//   }) {
//     SharedPreferences.getInstance().then((SharedPreferences prefs) {
//       prefs.setString('af_access_token', signInConfirmationOutput.accessToken);
//       prefs.setString('af_did', signInConfirmationOutput.did);
//       prefs.setString('af_id_token', signInConfirmationOutput.idToken);
//       prefs.setString('af_user_id', userId);
//       prefs.setString('af_user_email', userEmail);
//     });
//     _accessToken = signInConfirmationOutput.accessToken;
//     _did = signInConfirmationOutput.did;
//     _idToken = signInConfirmationOutput.idToken;
//     _userID = userId;
//     _userEmail = userEmail;
//     notifyListeners();
//   }

//   Future loadPrefs() {
//     final Completer _completer = new Completer();

//     SharedPreferences.getInstance().then((SharedPreferences prefs) {
//       _accessToken = prefs.getString('af_access_token');
//       _did = prefs.getString('af_did');
//       _idToken = prefs.getString('af_id_token');
//       _userID = prefs.getString('af_user_id');
//       _userEmail = prefs.getString('af_user_email');
//       _completer.complete();
//     });
//     return _completer.future;
//   }

//   void clear() {
//     SharedPreferences.getInstance().then((SharedPreferences prefs) {
//       prefs.clear();
//     });

//     _accessToken = null;
//     _did = null;
//     _idToken = null;
//     _userID = null;
//     _userEmail = null;
//     notifyListeners();
//   }
// }
