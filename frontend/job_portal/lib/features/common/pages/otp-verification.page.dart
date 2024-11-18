// import 'dart:convert';
// import 'dart:io';
// import 'package:job_portal/animations/slide-right.animation.dart';
// import 'package:job_portal/global_constants.dart';
// import 'package:job_portal/common/pages/dashboard.page.dart';
// import 'package:job_portal/providers/authentication-state.provider.dart';
// import 'package:job_portal/services/auth.service.dart';
// import 'package:job_portal/providers/user-state.provider.dart';
// import 'package:job_portal/swagger_models_apis/cloud_wallet_api.swagger.dart';
// import 'package:job_portal/swagger_models_apis/user_management_api.swagger.dart'
//     as usermanagement;
// import 'package:job_portal/common/widgets/decorated-text.widget.dart';
// import 'package:job_portal/common/widgets/loading-animation.widget.dart';
// import 'package:job_portal/common/pages/user-onboarding.page.dart';
// import 'package:chopper/chopper.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class OtpVerificationPage extends StatefulWidget {
//   final String? validatedEmail;
//   const OtpVerificationPage({
//     super.key,
//     required this.validatedEmail,
//   });

//   @override
//   State<OtpVerificationPage> createState() => _OtpVerificationPageState();
// }

// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   bool _otpVerificationInProgressFlag = false;
//   final FocusNode _otpFocusNode = FocusNode();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? _otp;
//   bool _showErrors = false;
//   @override
//   dispose() {
//     _otpFocusNode.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String hiddenEmail = widget.validatedEmail!
//         .replaceAllMapped(RegExp(r'/(.{2})(.*)(?=@)/'), (match) {
//       String? gp1 = match.group(0);
//       String? gp2 = match.group(1);
//       String? gp3 = match.group(2);

//       for (int i = 0; i < gp3!.length; i++) {
//         gp2 = (gp2 ?? "") + "*";
//       }
//       return gp2 ?? "";
//     });
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 height: 80,
//                 alignment: Alignment.bottomLeft,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 20,
//                     ),
//                     GestureDetector(
//                       child: Icon(Icons.arrow_back),
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       width: 320,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           DecoratedTextWidget(
//                             content: "Verify your email",
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           DecoratedTextWidget(
//                             content: "Have sent an OTP to your email address " +
//                                 hiddenEmail,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Form(
//                             key: _formKey,
//                             child: TextFormField(
//                               focusNode: _otpFocusNode,
//                               keyboardType: TextInputType.number,
//                               autovalidateMode: _showErrors
//                                   ? AutovalidateMode.always
//                                   : AutovalidateMode.disabled,
//                               decoration: InputDecoration(
//                                 isDense: true,
//                                 // filled: true,
//                                 // fillColor: Theme.of(context).colorScheme.onInverseSurface,
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     width: 1.0,
//                                     color:
//                                         Theme.of(context).colorScheme.outline,
//                                   ),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     width: 1.0,
//                                     color:
//                                         Theme.of(context).colorScheme.outline,
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   // borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide(
//                                     width: 1.0,
//                                     color:
//                                         Theme.of(context).colorScheme.outline,
//                                   ),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   // borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide(
//                                     width: 0,
//                                     color: Theme.of(context).colorScheme.error,
//                                   ),
//                                 ),
//                                 contentPadding: const EdgeInsets.only(
//                                   top: 12.0,
//                                   left: 10,
//                                   right: 6,
//                                   bottom: 12.0,
//                                 ),
//                                 labelText: "Enter OTP",
//                               ),
//                               validator: (String? value) {
//                                 if ((value == null) || value.isEmpty) {
//                                   return "Required";
//                                 } else {
//                                   if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                                     return "OTP should be a number";
//                                   }
//                                 }
//                                 return null;
//                               },
//                               onSaved: (String? value) {
//                                 _otp = value;
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           FilledButton(
//                             onPressed: () {
//                               if (!_showErrors) {
//                                 setState(() {
//                                   _showErrors = true;
//                                 });
//                               }
//                               if (_formKey.currentState!.validate()) {
//                                 _formKey.currentState!.save();

//                                 if ((_otp != null) && (_otp!.length == 6)) {
//                                   setState(() {
//                                     _otpVerificationInProgressFlag = true;
//                                   });
//                                   ConfirmSignInInput body = ConfirmSignInInput(
//                                     token:
//                                         AuthService().signUpConfirmationString!,
//                                     confirmationCode: _otp!,
//                                   );
//                                   Provider.of<CloudWalletApi>(context,
//                                           listen: false)
//                                       .usersSignInPasswordlessConfirmPost(
//                                           body: body)
//                                       .then((Response<ConfirmSignInOutput>
//                                           otpResponse) {
//                                     final ConfirmSignInOutput? output =
//                                         otpResponse.body;
//                                     Provider.of<
//                                             usermanagement.UserManagementApi>(
//                                       context,
//                                       listen: false,
//                                     )
//                                         .userProfileEmailGet(
//                                             email: (widget.validatedEmail ?? "")
//                                                 .toLowerCase())
//                                         .then((Response<
//                                                 usermanagement.UserProfile>
//                                             response) {
//                                       setState(() {
//                                         _otpVerificationInProgressFlag = false;
//                                       });
//                                       bool userloginsuccess = false;

//                                       if (response.isSuccessful) {
//                                         if (response.body!.id != null) {
//                                           userloginsuccess = true;
//                                         }
//                                       }
//                                       if (!userloginsuccess) {
//                                         Navigator.of(context)
//                                             .pushAndRemoveUntil(
//                                           SlideRightRoute(
//                                             page: UserOnboardingPage(
//                                               otpOutput: output,
//                                               validatedEmail:
//                                                   widget.validatedEmail,
//                                             ),
//                                           ),
//                                           (Route<dynamic> route) => false,
//                                         );
//                                       } else {
//                                         context
//                                             .read<UserState>()
//                                             .setUserProfile(
//                                               user: response.body,
//                                               context: context,
//                                             );
//                                         context
//                                             .read<AuthenticationState>()
//                                             .setAuthorization(
//                                               signInConfirmationOutput: output!,
//                                               userId: response.body!.id ?? "",
//                                               userEmail:
//                                                   widget.validatedEmail ?? "",
//                                             );

//                                         Navigator.of(context)
//                                             .pushAndRemoveUntil(
//                                           SlideRightRoute(
//                                             page: const DashboardPage(),
//                                           ),
//                                           (Route<dynamic> route) => false,
//                                         );
//                                       }
//                                     });
//                                   });
//                                 }
//                               }
//                             },
//                             style: FilledButton.styleFrom(
//                               backgroundColor: GlobalConstants.backgroundColor,
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(6),
//                                 ),
//                                 side: BorderSide.none,
//                               ),
//                               fixedSize: const Size.fromWidth(320),
//                             ),
//                             child: _otpVerificationInProgressFlag
//                                 ? SpinKitThreeBounce(
//                                     color: Colors.white,
//                                     size: 30,
//                                   )
//                                 : const Text(
//                                     "Login",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
