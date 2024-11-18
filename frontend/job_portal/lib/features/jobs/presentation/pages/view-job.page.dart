import 'package:go_router/go_router.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/design_system/filled-button-with-feedback-animation.widget.dart';
import 'package:job_portal/features/jobs/domain/entities/job.dart';
import 'package:job_portal/features/jobs/presentation/providers/job.provider.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewJobPage extends HookConsumerWidget {
  final Job job;
  ViewJobPage({
    super.key,
    required this.job,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _apply({
    required BuildContext context,
    required JobState jobState,
  }) {
    jobState.setJob(job: job);
    context.go(
      '/jobapplication',
    );
    // Navigator.of(context).push(
    //   SlideBottomRoute(
    //     page: JobApplicationPage(
    //       job: job,
    //       // transactionId: _transactionId,
    //       // messageId: _messageId,
    //     ),
    //   ),
    // );
  }

  _buildJobImage() {
    if (job.companyLogo != null) {
      return Container(
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
            image: NetworkImage(
              job.companyLogo!,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: GlobalConstants.backgroundColor,
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.outline,
          // ),
          borderRadius: const BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        child: const Icon(
          Icons.business_center,
          size: 36,
          color: Colors.white70,
        ),
      );
    }
  }

  _buildJobDescriptionWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedTextWidget(
              content: "Job Description",
              textAlign: TextAlign.start,
            ),
            DecoratedTextWidget(
              content: job.description,
              textAlign: TextAlign.start,
              fontSize: 12,
              textColor: Colors.black54,
            ),
            SizedBox(
              height: 20,
            ),
            DecoratedTextWidget(
              content: "Requirements",
              textAlign: TextAlign.start,
            ),
            Column(
              children:
                  (job.responsibilities ?? []).map((String responsibility) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DecoratedTextWidget(
                        content: responsibility,
                        textAlign: TextAlign.start,
                        fontSize: 12,
                        textColor: Colors.black54,
                      ),
                    )
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body:
            // (_loadingInProgressFlag ?? false)
            //     ? LoadingAnimationWidget()
            //     :
            Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 110,
                    color: GlobalConstants.backgroundColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: GestureDetector(
                              child: const Icon(Icons.arrow_back_ios_new),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              DecoratedTextWidget(
                                content: job.role,
                                maxLines: 1,
                                overflowEllipsisFlag: true,
                              ),
                              // (job.fulfillmentCategory != null)
                              //     ? Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: (job
                              //                     .fulfillmentCategory ??
                              //                 [])
                              //             .asMap()
                              //             .map((int index,
                              //                 Object fulfillmentObject) {
                              //               jobseekermodels
                              //                   .JobFulfillmentCategory
                              //                   fulfillmentCategory =
                              //                   fulfillmentObject
                              //                       as jobseekermodels
                              //                       .JobFulfillmentCategory;
                              //               return MapEntry(
                              //                 index,
                              //                 Row(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.start,
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.center,
                              //                   children: <Widget>[
                              //                     Text(
                              //                       (fulfillmentObject.type ??
                              //                               '')
                              //                           .toLowerCase(),
                              //                       style: const TextStyle(
                              //                         fontSize: 12,
                              //                         color: Colors.black54,
                              //                       ),
                              //                     ),
                              //                     (index !=
                              //                             (job
                              //                                     .fulfillmentCategory!
                              //                                     .length -
                              //                                 1))
                              //                         ? Container(
                              //                             margin:
                              //                                 const EdgeInsets
                              //                                     .symmetric(
                              //                               horizontal: 6,
                              //                             ),
                              //                             child: Container(
                              //                               height: 4,
                              //                               width: 4,
                              //                               decoration:
                              //                                   const BoxDecoration(
                              //                                 borderRadius:
                              //                                     BorderRadius
                              //                                         .all(
                              //                                   Radius.circular(
                              //                                       4),
                              //                                 ),
                              //                                 color: Colors
                              //                                     .black54,
                              //                               ),
                              //                             ),
                              //                           )
                              //                         : Container(),
                              //                   ],
                              //                 ),
                              //               );
                              //             })
                              //             .values
                              //             .toList())
                              //     : Container(),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: GestureDetector(
                              child: Icon((job.userSavedItem ?? false)
                                  ? Icons.bookmark
                                  : Icons.bookmark_add_outlined),
                              onTap: () {
                                // debugPrint(
                                //     "watchlist input, fulfillmentCategory: ");
                                // debugPrint(jsonEncode(
                                //     job.fulfillmentCategory));
                                // if (!(job.userSavedItem ?? false)) {
                                //   job.userSavedItem = true;
                                //   Provider.of<usermanagement.UserManagementApi>(
                                //     context,
                                //     listen: false,
                                //   )
                                //       .userItemCategoryEmailActionPost(
                                //     category: 'job',
                                //     email: context
                                //             .read<AuthenticationState>()
                                //             .userEmail ??
                                //         "",
                                //     action: 'save',
                                //     body: _currentJob,
                                //   )
                                //       .then((Response<Object> response) {
                                //     if (response.isSuccessful) {
                                //       setState(() {
                                //         job.userSavedItem = true;
                                //       });
                                //       UserDataService()
                                //           .addNewSavedJob(job: job);
                                //     }
                                //   });
                                // } else {
                                //   Provider.of<usermanagement.UserManagementApi>(
                                //     context,
                                //     listen: false,
                                //   )
                                //       .userItemCategoryEmailActionPost(
                                //     category: 'job',
                                //     email: context
                                //             .read<AuthenticationState>()
                                //             .userEmail ??
                                //         "",
                                //     action: 'unsave',
                                //     body: _currentJob,
                                //   )
                                //       .then((Response<Object> response) {
                                //     if (response.isSuccessful) {
                                //       setState(() {
                                //         job.userSavedItem = false;
                                //       });
                                //       UserDataService()
                                //           .removeSavedJob(job: job);
                                //     }
                                //   });
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buildJobImage(),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            job.company ?? '',
                          ),
                          Text(
                            job.city ?? "",
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    const TabBar(
                      indicatorColor: GlobalConstants.backgroundColor,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "About Company",
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          _buildJobDescriptionWidget(),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 20,
              ),
              child: FilledButtonWithFeedbackAnimationWidget(
                color: Colors.amber,
                textColor: Colors.black87,
                processingFlag: false,
                text: "APPLY NOW",
                onPressed: () {
                  _apply(
                    context: context,
                    jobState: ref.read(jobStateProvider.notifier),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
