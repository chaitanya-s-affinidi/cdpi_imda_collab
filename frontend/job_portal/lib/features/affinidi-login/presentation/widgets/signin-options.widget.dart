// import 'package:flutter/material.dart';
// import 'package:job_portal/features/design_system/decorated-text.widget.dart';

// class SignInOptionsWidget extends StatefulWidget {
//   final Function({
//     required String? email,
//   }) onSuccessfulEmailVerification;
//   const SignInOptionsWidget({
//     super.key,
//     required this.onSuccessfulEmailVerification,
//   });

//   @override
//   State<SignInOptionsWidget> createState() => _SignInOptionsWidgetState();
// }

// class _SignInOptionsWidgetState extends State<SignInOptionsWidget> {
//   bool _showErrors = false;
//   bool _sendOtpInProgressFlag = false;
//   final TextEditingController _emailController = TextEditingController();
//   final FocusNode _emailFocusNode = FocusNode();

//   @override
//   dispose() {
//     _emailFocusNode.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.onInverseSurface,
//       height: 800,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           SizedBox(
//             height: 60,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               DecoratedTextWidget(
//                 content: "Login",
//                 fontSize: 21,
//                 bold: true,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor:
//                       Theme.of(context).colorScheme.tertiaryContainer,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   side: const BorderSide(style: BorderStyle.none),
//                 ),
//                 child: Container(
//                   width: 250,
//                   color: Theme.of(context).colorScheme.tertiaryContainer,
//                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Image(
//                         image: AssetImage("assets/google_logo.png"),
//                         height: 20.0,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: DecoratedTextWidget(
//                           content: 'Continue with Google',
//                           bold: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor:
//                       Theme.of(context).colorScheme.tertiaryContainer,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   side: const BorderSide(style: BorderStyle.none),
//                 ),
//                 child: Container(
//                   width: 250,
//                   color: Theme.of(context).colorScheme.tertiaryContainer,
//                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Image(
//                         image: AssetImage("assets/apple_logo.png"),
//                         height: 20.0,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: DecoratedTextWidget(
//                           content: 'Continue with Apple',
//                           bold: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 width: 250,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Expanded(child: Divider()),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: DecoratedTextWidget(
//                         content: "OR",
//                         textColor: Colors.black54,
//                         fontSize: 14,
//                         bold: true,
//                       ),
//                     ),
//                     Expanded(child: Divider()),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 width: 290,
//                 child: TextFormField(
//                   focusNode: _emailFocusNode,
//                   controller: _emailController,
//                   textInputAction: TextInputAction.done,
//                   keyboardType: TextInputType.emailAddress,
//                   autovalidateMode: _showErrors
//                       ? AutovalidateMode.always
//                       : AutovalidateMode.disabled,
//                   decoration: InputDecoration(
//                     isDense: true,
//                     filled: true,
//                     fillColor: Colors.white70,
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Colors.black12,
//                       ),
//                     ),
//                     // enabledBorder: InputBorder.none,
//                     suffixIcon: (_emailController.text == "")
//                         ? const Icon(Icons.email)
//                         : GestureDetector(
//                             child: const Icon(
//                               Icons.clear_outlined,
//                               size: 15,
//                               color: Colors.black26,
//                             ),
//                             onTap: () {
//                               _emailController.text = "";
//                             },
//                           ),
//                     contentPadding: const EdgeInsets.only(
//                       left: 12,
//                       top: 0,
//                       bottom: 0,
//                       right: 6,
//                     ),
//                     labelText: "Email*",
//                     hintText: "Enter Email",
//                   ),
//                   validator: (String? value) {
//                     if ((value == null) || (value.isEmpty)) {
//                       return "Required*";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 8),
//               FilledButtonWithFeedbackAnimationWidget(
//                 text: "SEND VERIFICATION CODE",
//                 processingFlag: _sendOtpInProgressFlag,
//                 color: Theme.of(context).colorScheme.primaryContainer,
//                 onPressed: () {
//                   SignInInput body =
//                       SignInInput(username: _emailController.text);
//                   setState(() {
//                     _sendOtpInProgressFlag = true;
//                   });
//                   Provider.of<CloudWalletApi>(context, listen: false)
//                       .usersSignInPasswordlessPost(body: body)
//                       .then((Response<String> response) {
//                     AuthService().setSignUpConfirmationString(
//                       signUpConfirmationString: response.body,
//                     );
//                     widget.onSuccessfulEmailVerification(
//                       email: _emailController.text,
//                     );
//                     setState(() {
//                       _sendOtpInProgressFlag = false;
//                     });
//                   });
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
