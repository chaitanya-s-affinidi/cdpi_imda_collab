import 'package:job_portal/animations/slide-bottom.animation.dart';
import 'package:job_portal/animations/slide-right.animation.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';
import 'package:job_portal/features/jobs/data/jobs_data.dart';
import 'package:job_portal/features/jobs/presentation/pages/view-job.page.dart';
import 'package:job_portal/features/jobs/presentation/widgets/job-filters.widget.dart';
import 'package:job_portal/features/jobs/presentation/widgets/job-list-tem.widget.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobListWidget extends HookConsumerWidget {
  const JobListWidget({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: 40,
              color: GlobalConstants.backgroundColor.withOpacity(0.1),
            ),
            Container(
              height: 80,
              width: (MediaQuery.of(context).size.width - 30),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        20,
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
                          Icons.search,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: DecoratedTextWidget(
                            content:
                                "Search by skills, location, experience, etc...",
                            textColor: Colors.black45,
                            maxLines: 1,
                            overflowEllipsisFlag: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    SlideBottomRoute(
                      page: const JobFiltersWidget(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ("${JobsData.length} jobs found"),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset('assets/svgs/ic_filter.svg'),
                      onTap: () {
                        Navigator.of(context).push(
                          SlideBottomRoute(
                            page: const JobFiltersWidget(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: JobsData.map((job) {
                      return GestureDetector(
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          child: JobListItemWidget(
                            job: job,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(SlideRightRoute(
                              page: ViewJobPage(
                            job: job,
                          )));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
