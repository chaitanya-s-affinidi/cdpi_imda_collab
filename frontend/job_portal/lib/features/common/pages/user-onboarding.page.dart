// import 'package:chopper/chopper.dart';
// import 'package:job_portal/animations/slide-right.animation.dart';
// import 'package:job_portal/common/custom-validators.dart';
// import 'package:job_portal/common/pages/dashboard.page.dart';
// import 'package:job_portal/common/widgets/af-text-form-field-wrapper.widget.dart';
// import 'package:job_portal/common/widgets/filled-button-with-feedback-animation.widget.dart';
// import 'package:job_portal/global_constants.dart';
// import 'package:job_portal/providers/authentication-state.provider.dart';
// import 'package:job_portal/providers/user-state.provider.dart';
// import 'package:job_portal/swagger_models_apis/cloud_wallet_api.swagger.dart';
// import 'package:job_portal/swagger_models_apis/user_management_api.models.swagger.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:job_portal/swagger_models_apis/user_management_api.swagger.dart'
//     as usermanagement;

// class UserOnboardingPage extends StatefulWidget {
//   final ConfirmSignInOutput? otpOutput;
//   final String? validatedEmail;
//   const UserOnboardingPage({
//     super.key,
//     required this.otpOutput,
//     required this.validatedEmail,
//   });

//   @override
//   State<UserOnboardingPage> createState() => _UserOnboardingPageState();
// }

// class _UserOnboardingPageState extends State<UserOnboardingPage> {
//   bool? _pageInitialized = false;
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   bool? _showErrors;
//   bool? _registrationInProgressFlag;
//   String? _firstName;
//   String? _lastName;
//   String? _phoneNumber;
//   @override
//   void didChangeDependencies() {
//     if (!(_pageInitialized ?? false)) {
//       _pageInitialized = true;
//     }
//     super.didChangeDependencies();
//   }

//   Widget _buildFirstNameTextField() {
//     return AFTextFormFieldWrapperWidget(
//       textInputAction: TextInputAction.done,
//       keyboardType: TextInputType.text,
//       labelText: 'First Name*',
//       autovalidateMode: ((_showErrors != null) && _showErrors!)
//           ? AutovalidateMode.always
//           : AutovalidateMode.disabled,
//       validator: (String? value) {
//         if ((value == null) || (value.isEmpty)) {
//           return "First Name required";
//         } else {
//           if (!RegExp(CustomValidators().patterns.name!).hasMatch(value)) {
//             return "Name should be text";
//           } else if (value.length >
//               CustomValidators().textlengths.name!.maxLength!) {
//             return "Name cannot be greater than " +
//                 CustomValidators().textlengths.name!.maxLength.toString() +
//                 " characters";
//           }
//         }
//         return null;
//       },
//       onSaved: (String? value) {
//         _firstName = value;
//       },
//     );
//   }

//   Widget _buildLastNameTextField() {
//     return AFTextFormFieldWrapperWidget(
//       textInputAction: TextInputAction.done,
//       keyboardType: TextInputType.text,
//       labelText: 'Last Name',
//       autovalidateMode: ((_showErrors != null) && _showErrors!)
//           ? AutovalidateMode.always
//           : AutovalidateMode.disabled,
//       validator: (String? value) {
//         if ((value != null) && (value != "")) {
//           if (!RegExp(CustomValidators().patterns.name!).hasMatch(value)) {
//             return "Name should be text";
//           } else if (value.length >
//               CustomValidators().textlengths.name!.maxLength!) {
//             return "Name cannot be greater than " +
//                 CustomValidators().textlengths.name!.maxLength.toString() +
//                 " characters";
//           }
//         }
//         // if (value == null){
//         //   return "LastName required";
//         // }
//         return null;
//       },
//       onSaved: (String? value) {
//         _lastName = value;
//       },
//     );
//   }

//   Widget _buildPhoneTextField() {
//     return AFTextFormFieldWrapperWidget(
//       textInputAction: TextInputAction.done,
//       keyboardType: TextInputType.phone,
//       labelText: 'Phone (Optional)',
//       prefixText: '+91',
//       autovalidateMode: ((_showErrors != null) && _showErrors!)
//           ? AutovalidateMode.always
//           : AutovalidateMode.disabled,
//       validator: (String? value) {
//         if ((value == null) || (value.isEmpty)) {
//           return null;
//         } else {
//           if (!RegExp(CustomValidators().patterns.phone!).hasMatch(value)) {
//             return "Phone should be number";
//           } else if (value.length <
//               CustomValidators().textlengths.phone!.minLength!) {
//             return "Phone number should be atleast " +
//                 CustomValidators().textlengths.phone!.minLength.toString() +
//                 " characters";
//           } else if (value.length >
//               CustomValidators().textlengths.phone!.maxLength!) {
//             return "Phone number cannot be greater than " +
//                 CustomValidators().textlengths.phone!.maxLength.toString() +
//                 " characters";
//           }
//         }

//         // if ((value == null) || (value.isEmpty)){
//         //   return "Phone required";
//         // }
//         return null;
//       },
//       onSaved: (String? value) {
//         if (value!.length >= 10) {
//           _phoneNumber = '+91' + value;
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Container(
//                 height: 150,
//                 color: GlobalConstants.backgroundColor,
//                 alignment: Alignment.bottomLeft,
//                 child: const Padding(
//                   padding: EdgeInsets.only(
//                     bottom: 20,
//                     left: 10,
//                   ),
//                   child: Text(
//                     "Welcome!",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                             child: _buildFirstNameTextField(),
//                           ),
//                           Expanded(
//                             child: _buildLastNameTextField(),
//                           ),
//                         ],
//                       ),
//                       _buildPhoneTextField(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       FilledButtonWithFeedbackAnimationWidget(
//                           processingFlag: _registrationInProgressFlag ?? false,
//                           text: 'Get Started',
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               UserProfile user = UserProfile(
//                                 email:
//                                     (widget.validatedEmail ?? "").toLowerCase(),
//                                 firstName: _firstName,
//                                 lastName: _lastName,
//                                 fullName: ((_firstName ?? "") +
//                                     " " +
//                                     (_lastName ?? "")),
//                                 mobile: _phoneNumber,
//                                 city: "Bangalore",
//                                 skills: [
//                                   "DevOps",
//                                   "Flutter",
//                                   "UI / UX",
//                                 ],
//                                 title: "Business Analyst",
//                               );
//                               Provider.of<usermanagement.UserManagementApi>(
//                                 context,
//                                 listen: false,
//                               ).userProfilePost(body: user).then(
//                                   (Response<usermanagement.UserProfile>
//                                       response) {
//                                 if ((response.isSuccessful) &&
//                                     (response.body!.id != null)) {
//                                   context.read<UserState>().setUserProfile(
//                                         user: response.body,
//                                         context: context,
//                                       );
//                                   context
//                                       .read<AuthenticationState>()
//                                       .setAuthorization(
//                                         signInConfirmationOutput:
//                                             widget.otpOutput!,
//                                         userId: response.body!.id ?? "",
//                                         userEmail: widget.validatedEmail ?? "",
//                                       );

//                                   Navigator.of(context).pushAndRemoveUntil(
//                                     SlideRightRoute(
//                                       page: const DashboardPage(),
//                                     ),
//                                     (Route<dynamic> route) => false,
//                                   );
//                                 }
//                               });
//                             }
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
