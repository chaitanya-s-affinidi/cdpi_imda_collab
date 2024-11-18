import 'package:job_portal/animations/slide-right.animation.dart';
import 'package:flutter/material.dart';

class SavedJobsWidget extends StatefulWidget {
  const SavedJobsWidget({super.key});

  @override
  State<SavedJobsWidget> createState() => _SavedJobsWidgetState();
}

class _SavedJobsWidgetState extends State<SavedJobsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // children: (UserDataService().savedJobs ?? []).map((SerializedJob job) {
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
