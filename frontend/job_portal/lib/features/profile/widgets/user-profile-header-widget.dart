// import 'package:job_portal/common/assets.dart';
// import 'package:job_portal/common/extensions.dart';
// import 'package:job_portal/providers/user-state.provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class UserProfileHeader extends StatelessWidget {
//   const UserProfileHeader({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserState>(builder: (context, userState, child) {
//       return Column(
//         children: [
//           SizedBox(
//             height: 100,
//             width: 100,
//             child: Stack(
//               clipBehavior: Clip.none,
//               fit: StackFit.expand,
//               children: [
//                 //TODO: Should be replaced with actual user profile image
//                 Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 0.5,
//                       color: Colors.white70,
//                     ),
//                     shape: BoxShape.circle,
//                     image: const DecorationImage(
//                       fit: BoxFit.contain,
//                       alignment: Alignment.centerLeft,
//                       image: AssetImage(
//                         "assets/profile_pic.jpeg",
//                       ),
//                     ),
//                   ),
//                 ),
//                 // CircleAvatar(
//                 //   child:
//                 //   Image.network(
//                 //     "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
//                 //     fit: BoxFit.contain,
//                 //   ),
//                 // ),
//                 Positioned(
//                     bottom: -12,
//                     right: 30,
//                     child: SizedBox(
//                       height: 36,
//                       width: 36,
//                       child: RawMaterialButton(
//                         onPressed: () {},
//                         elevation: 2.0,
//                         fillColor: const Color(0xFFF5F6F9),
//                         padding: const EdgeInsets.all(2.0),
//                         shape: const CircleBorder(),
//                         child: SvgPicture.asset(
//                           Svgs.icCamera,
//                           width: 16,
//                           height: 16,
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//           Text(
//             userState.userProfile!.fullName ?? "",
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyMedium
//                 ?.copyWith(fontWeight: FontWeight.w500),
//           ).paddingOnly(top: 24),
//           Text(
//             userState.userProfile!.title ?? "",
//             style: Theme.of(context)
//                 .textTheme
//                 .labelSmall
//                 ?.copyWith(fontWeight: FontWeight.w500),
//           ).paddingOnly(top: 4)
//         ],
//       );
//     });
//   }
// }
