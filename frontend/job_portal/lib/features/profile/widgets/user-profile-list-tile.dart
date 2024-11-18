// import 'package:job_portal/common/extensions.dart';
// import 'package:job_portal/global_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class UserProfileListTile extends StatelessWidget {
//   final String leadingIcon;
//   final String title;
//   final VoidCallback onPressed;
//   final bool? showTrailingIcon;

//   const UserProfileListTile({
//     super.key,
//     required this.leadingIcon,
//     required this.title,
//     required this.onPressed,
//     this.showTrailingIcon = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPressed,
//       leading: DecoratedBox(
//         decoration: BoxDecoration(
//             color: GlobalConstants.seaShell,
//             borderRadius: BorderRadius.circular(16)),
//         child: SvgPicture.asset(leadingIcon).paddingAll(12),
//       ),
//       title: Text(title),
//       trailing: showTrailingIcon!
//           ? const Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: GlobalConstants.black,
//               size: 24,
//             )
//           : const SizedBox.shrink(),
//     ).paddingOnly(bottom: 16).paddingSymmetric(horizontal: 6);
//   }
// }
