// import 'dart:io';
// import 'package:job_portal/animations/slide-right.animation.dart';
// import 'package:job_portal/pages/holder-credentials.page.dart';
// import 'package:job_portal/providers/authentication-state.provider.dart';
// import 'package:job_portal/services/auth.service.dart';
// import 'package:job_portal/swagger_models_apis/cloud_wallet_api.swagger.dart';
// import 'package:job_portal/widgets/decorated-text.widget.dart';
// import 'package:job_portal/widgets/loading-animation.widget.dart';
// import 'package:chopper/chopper.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:provider/provider.dart';

// class OtpVerificationWidget extends StatefulWidget {
//   final String? validatedEmail;
//   final String? role;
//   const OtpVerificationWidget({
//     super.key,
//     required this.validatedEmail,
//     required this.role,
//   });

//   @override
//   State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
// }

// class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
//   bool _otpVerificationInProgressFlag = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.onInverseSurface,
//       height: 800,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 120,
//               ),
//               Container(
//                 child: DecoratedTextWidget(
//                   content: "Verification code has been sent to ",
//                 ),
//               ),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor:
//                       Theme.of(context).colorScheme.secondaryContainer,
//                   side: BorderSide(
//                     color: Colors.black26,
//                     width: 0.2,
//                   ),
//                   maximumSize: const Size.fromWidth(250),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Expanded(
//                       child: DecoratedTextWidget(
//                         content: widget.validatedEmail,
//                         textColor: Colors.black54,
//                         maxLines: 1,
//                         overflowEllipsisFlag: true,
//                       ),
//                     ),
//                     Container(
//                       child: const Icon(
//                         Icons.clear_outlined,
//                         size: 16,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 120,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               vertical: 6,
//             ),
//             width: 360,
//             child: PinCodeTextField(
//               // controller: _textController,
//               appContext: context,
//               length: 6,
//               obscureText: false,
//               // cursorColor: Theme.of(context).colorScheme.secondaryContainer,
//               keyboardType: Platform.isIOS
//                   ? const TextInputType.numberWithOptions(
//                       signed: true,
//                     )
//                   : TextInputType.number,
//               animationType: AnimationType.fade,
//               animationDuration: const Duration(milliseconds: 300),

//               cursorColor: Colors.black,
//               pinTheme: PinTheme.defaults(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(5),
//                 borderWidth: 1.0,
//                 fieldHeight: 50,
//                 fieldWidth: 55,
//                 activeColor: Colors.black,
//                 selectedColor: Colors.black,
//                 inactiveColor: Colors.black26,
//                 disabledColor: Colors.black26,
//                 activeFillColor: Colors.black26,
//                 selectedFillColor: Colors.black26,
//                 inactiveFillColor: Colors.black26,
//                 // disabledFillColor: Theme.of(context).colorScheme.secondaryContainer,
//               ),
//               enabled: !_otpVerificationInProgressFlag,
//               onChanged: (newotp) {
//                 if (newotp.length == 6) {
//                   setState(() {
//                     _otpVerificationInProgressFlag = true;
//                   });
//                   ConfirmSignInInput body = ConfirmSignInInput(
//                     token: AuthService().signUpConfirmationString!,
//                     confirmationCode: newotp,
//                   );
//                   Provider.of<CloudWalletApi>(context, listen: false)
//                       .usersSignInPasswordlessConfirmPost(body: body)
//                       .then((Response<ConfirmSignInOutput> response) {
//                     setState(() {
//                       _otpVerificationInProgressFlag = false;
//                     });

//                     final ConfirmSignInOutput? output = response.body;
//                     context.read<AuthenticationState>().setAuthorization(
//                           signInConfirmationOutput: output!,
//                           userType: widget.role ?? "",
//                         );

//                     Navigator.of(context).pushAndRemoveUntil(
//                       SlideRightRoute(
//                         page: Container(),
//                       ),
//                       (Route<dynamic> route) => false,
//                     );
//                   });
//                 }
//               },
//             ),
//           ),
//           _otpVerificationInProgressFlag
//               ? LoadingAnimationWidget()
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
