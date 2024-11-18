import 'package:job_portal/core/custom_hooks/af_value_notifier.dart';
import 'package:job_portal/features/jobs/presentation/widgets/applied-jobs.widget.dart';
import 'package:job_portal/features/jobs/presentation/widgets/job-list.widget.dart';
import 'package:job_portal/features/jobs/presentation/widgets/saved-jobs.widget.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobsDashboardWidget extends HookConsumerWidget {
  final String? filterName;

  JobsDashboardWidget({
    super.key,
    this.filterName,
  });

  // List<JobSummary>? _courses;
  final List<String>? _filterNames = ["ALL JOBS", "WATCHED", "APPLIED"];

  // final _controller = PageController();

  // _loadJobs() {
  //   switch (currentStatusFilterName!) {
  //     case 'ALL JOBS':
  //       {
  //         _controller.animateToPage(
  //           1,
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.ease,
  //         );
  //         break;
  //       }
  //     case 'WATCHED':
  //       {
  //         _controller.animateToPage(
  //           1,
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.ease,
  //         );
  //         break;
  //       }
  //     case 'APPLIED':
  //       {
  //         _controller.animateToPage(
  //           2,
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.ease,
  //         );

  //         break;
  //       }
  //   }
  //   return;
  // }

  _buildJobsListWidget({
    required ValueNotifier<String> currentStatusFilterNameNotifier,
  }) {
    return ValueListenableBuilder(
        valueListenable: currentStatusFilterNameNotifier,
        builder: (context, currentStatusFilterName, _) {
          switch (currentStatusFilterName) {
            case 'ALL JOBS':
              {
                return const JobListWidget();
              }
            case 'WATCHED':
              {
                return const SavedJobsWidget();
              }
            case 'APPLIED':
              {
                return const AppliedJobsWidget();
              }
            default:
              {
                return Container();
              }
          }
        });
  }

  Widget _buildStatusFilters({
    required ValueNotifier<String> currentStatusFilterNameNotifier,
  }) {
    return Container(
      // width: 150,
      // height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ValueListenableBuilder(
          valueListenable: currentStatusFilterNameNotifier,
          builder: (context, currentStatusFilterName, _) {
            return Row(
              children: (_filterNames ?? []).map((String filterName) {
                return Container(
                  height: 34,
                  margin: const EdgeInsets.all(4.0),
                  child: ActionChip(
                    backgroundColor: (currentStatusFilterName == filterName)
                        ? GlobalConstants.backgroundColor
                        : Theme.of(context).colorScheme.onInverseSurface,
                    label: Text(
                      filterName.toUpperCase(),
                      style: TextStyle(
                        color: (currentStatusFilterName == filterName)
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: ((currentStatusFilterName != null) &&
                              (currentStatusFilterName == filterName))
                          ? BorderSide.none
                          : const BorderSide(
                              width: 0.2,
                              color: Colors.black54,
                            ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (currentStatusFilterName != filterName) {
                        currentStatusFilterNameNotifier.value = filterName;
                        // _loadJobs();
                      }
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String> currentStatusFilterNameNotifier =
        useAfValueNotifier(filterName ?? '');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 40,
          color: GlobalConstants.backgroundColor.withOpacity(0.1),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: const Text(
            "Jobs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: GlobalConstants.backgroundColor.withOpacity(0.1),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: _buildStatusFilters(
            currentStatusFilterNameNotifier: currentStatusFilterNameNotifier,
          ),
        ),
        Expanded(
          child: _buildJobsListWidget(
            currentStatusFilterNameNotifier: currentStatusFilterNameNotifier,
          ),
        )
      ],
    );
  }
}
