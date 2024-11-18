import 'package:job_portal/animations/slide-bottom.animation.dart';
import 'package:job_portal/animations/slide-right.animation.dart';
import 'package:job_portal/global_constants.dart';
import 'package:job_portal/home.page.dart';
import 'package:flutter/material.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const Center(
        //   child: UserProfileHeader(),
        // ).paddingOnly(top: 16),
        // const SizedBox(
        //   height: 20,
        // ),
        // const Divider(
        //   color: GlobalConstants.lavenderPinocchio,
        // ).paddingSymmetric(horizontal: 20).paddingOnly(bottom: 16),
        // UserProfileListTile(
        //   leadingIcon: Svgs.icPersonalInfo,
        //   title: AppStrings.personalInfo,
        //   onPressed: () {},
        // ),
        // UserProfileListTile(
        //   leadingIcon: Svgs.icResume,
        //   title: AppStrings.certificatesInfo,
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       SlideRightRoute(
        //         page: const HolderCredentialsPage(),
        //       ),
        //     );
        //   },
        // ),
        // UserProfileListTile(
        //   leadingIcon: Svgs.icSettings,
        //   title: AppStrings.settings,
        //   onPressed: () {
        //     Navigator.of(context)
        //         .push(SlideRightRoute(page: const SettingsPage()));
        //   },
        // ),
        // const Divider(
        //   color: GlobalConstants.lavenderPinocchio,
        // ).paddingSymmetric(horizontal: 20).paddingOnly(bottom: 16),
        // UserProfileListTile(
        //   leadingIcon: Svgs.icLogout,
        //   title: AppStrings.logout,
        //   showTrailingIcon: false,
        //   onPressed: () {
        //     context.read<AuthenticationState>().clear();
        //     Navigator.of(context).pushAndRemoveUntil(
        //       SlideBottomRoute(
        //         page: const HomePage(),
        //       ),
        //       (Route<dynamic> route) => false,
        //     );
        //   },
        // ),
      ],
    );
  }
}
