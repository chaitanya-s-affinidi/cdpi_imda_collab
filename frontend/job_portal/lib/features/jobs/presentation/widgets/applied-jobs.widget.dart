import 'package:job_portal/animations/slide-right.animation.dart';
import 'package:flutter/material.dart';

class AppliedJobsWidget extends StatefulWidget {
  const AppliedJobsWidget({super.key});

  @override
  State<AppliedJobsWidget> createState() => _AppliedJobsWidgetState();
}

class _AppliedJobsWidgetState extends State<AppliedJobsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // children: (UserDataService().appliedJobs ?? []).map((job) {
        //   return GestureDetector(
        //       child: Container(
        //         height: 150,
        //         decoration: const BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(10),
        //           ),
        //         ),
        //         margin: const EdgeInsets.all(8.0),
        //         padding: const EdgeInsets.all(8.0),
        //         child: JobListItemWidget(
        //           job: job,
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).push(SlideRightRoute(
        //             page: ViewJobPage(
        //           job: job,
        //         )));
        //       });
        // }).toList(),
      ),
    );
  }
}
