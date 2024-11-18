import 'package:job_portal/animations/slide-bottom.animation.dart';
import 'package:job_portal/features/common/widgets/location-auto-complete.widget.dart';
import 'package:job_portal/features/jobs/domain/entities/job.dart';
import 'package:job_portal/features/jobs/domain/entities/user_profile.dart';
import 'package:job_portal/features/jobs/domain/repositories/user_profile.provider.dart';
import 'package:job_portal/features/jobs/presentation/widgets/job-list-tem.widget.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OpenerWidget extends HookConsumerWidget {
  final Function({required int tabIndex}) onTabChangeRequest;
  OpenerWidget({
    super.key,
    required this.onTabChangeRequest,
  });

  final List<Job> _topJobs = [
    Job(
      jobId: '',
      role: 'Senior',
      description: 'UI / UX Designer',
      city: "Benguluru",
      state: "Karnataka",
      company: 'Facebook',
      bppId: '',
      bppUri: '',
    ),
    Job(
      jobId: '',
      bppId: '',
      bppUri: '',
      role: 'Executive',
      description: 'Mobile Architect',
      city: "Pune",
      state: "Maharashtra",
      company: 'Amazon',
    ),
  ];
  // List<usermanagementapi.Course>? _recommendedCourses = [
  //   usermanagementapi.Course(
  //     courseId: '',
  //     title: 'Google Certified UX Designer',
  //     // description: '',
  //     duration: '20 hours',
  //     providerId: '',
  //     providerName: 'Coursera',
  //     bppId: '',
  //     bppUri: '',
  //     categoryName: 'Free',
  //   ),
  //   usermanagementapi.Course(
  //     courseId: '',
  //     title: 'Material Design',
  //     // description: '',
  //     duration: '4 hours',
  //     providerName: 'Udemy',
  //     providerId: '',
  //     bppId: '',
  //     bppUri: '',
  //     categoryName: 'Paid',
  //     // imageLocations: [],
  //   )
  // ];

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // return Consumer<UserState>(builder: (context, userState, child) {
    final UserProfile userprofile = ref.read(userModelProvider);
    final Object imageProvider = (userprofile.profilepic != null)
        ? NetworkImage(
            userprofile.profilepic!,
          )
        : AssetImage(
            "assets/profile_pic.jpeg",
          );
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 60,
            color: GlobalConstants.backgroundColor.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  // ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        // (userState.userProfile != null)
                        //     ? (userState.userProfile!.city ?? "")
                        //     : "",
                        "Benguluru",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                debugPrint("calling city autocomplete");
                Navigator.of(context)
                    .push(
                  SlideBottomRoute(
                    page: LocationAutoCompletePage(),
                  ),
                )
                    .then((dynamic city) {
                  if (city != null) {}
                });
              },
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 10,
          //   ),
          //   color: GlobalConstants.backgroundColor.withOpacity(0.1),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: <Widget>[
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: const <Widget>[
          //           Text("Hello"),
          //           Text(
          //             "George Alexander",
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //       const Icon(
          //         Icons.notifications,
          //         color: GlobalConstants.backgroundColor,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          height: 60,
                          color:
                              GlobalConstants.backgroundColor.withOpacity(0.1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   height: 80,
                            //   child:
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.white70,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.centerLeft,
                                  image: imageProvider as ImageProvider,
                                ),
                              ),
                            ),

                            //   CircleAvatar(
                            //     child: Image.network(
                            //       "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                            //       fit: BoxFit.contain,
                            //       height: 80,
                            //       width: 80,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 6,
                            ),
                            // Text(userState.userProfile!.fullName ??
                            //     ""),
                            Text(
                                "${userprofile.givenName ?? ''} ${userprofile.familyName ?? ''}"),

                            // Text(userState.userProfile!.title ?? ""),
                            Text("UI / UX Designer"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // decoration: BoxDecoration(
                    //   color: GlobalConstants.backgroundColor.withOpacity(0.05),
                    //   borderRadius: const BorderRadius.all(
                    //     Radius.circular(
                    //       10,
                    //     ),
                    //   ),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: const Text(
                                  "Top Jobs",
                                ),
                              ),
                              Container(
                                child: ActionChip(
                                  backgroundColor: GlobalConstants
                                      .backgroundColor
                                      .withOpacity(0.1),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 6,
                                  ),
                                  side: BorderSide.none,
                                  label: const Text(
                                    "See All",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    onTabChangeRequest(tabIndex: 1);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 150,
                          width: (MediaQuery.of(context).size.width - 52),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: (_topJobs ?? []).map((Job topJob) {
                                return Container(
                                  width: 350,
                                  height: 150,
                                  padding: EdgeInsets.all(
                                    8.0,
                                  ),
                                  margin: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: JobListItemWidget(job: topJob),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 10,
                        //     vertical: 0,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: <Widget>[
                        //       Container(
                        //         child: const Text(
                        //           "Scale up your skills",
                        //         ),
                        //       ),
                        //       Container(
                        //         child: ActionChip(
                        //           backgroundColor: GlobalConstants
                        //               .backgroundColor
                        //               .withOpacity(0.1),
                        //           padding: const EdgeInsets.symmetric(
                        //             vertical: 0,
                        //             horizontal: 6,
                        //           ),
                        //           side: BorderSide.none,
                        //           label: const Text(
                        //             "See All",
                        //             style: TextStyle(
                        //               fontSize: 10,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           onPressed: () {
                        //             onTabChangeRequest(
                        //               tabIndex: 2,
                        //             );
                        //           },
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // Container(
                        //   height: 150,
                        //   width: (MediaQuery.of(context).size.width - 52),
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: (_recommendedCourses ?? []).map(
                        //           (usermanagementapi.Course recommendedCourse) {
                        //         return Container(
                        //           width: 350,
                        //           height: 150,
                        //           padding: EdgeInsets.all(
                        //             8.0,
                        //           ),
                        //           margin: EdgeInsets.all(8.0),
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(10),
                        //             ),
                        //           ),
                        //           child: CourseListItemWidget(
                        //             course: recommendedCourse,
                        //           ),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
    // });
  }
}
