import 'package:job_portal/core/custom_hooks/af_value_notifier.dart';
import 'package:job_portal/features/common/widgets/opener.widget.dart';
import 'package:job_portal/features/jobs/presentation/widgets/jobs-dashboard.widget.dart';
import 'package:job_portal/features/profile/pages/profile-dashboard.page.dart';
import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  // @override
  // void didChangeDependencies() {
  //   if (!_pageInitiaized) {
  //     if (context.read<UserState>().userProfile == null) {
  //       Provider.of<usermanagement.UserManagementApi>(
  //         context,
  //         listen: false,
  //       )
  //           .userProfileEmailGet(
  //               email: (context.read<AuthenticationState>().userEmail ?? "")
  //                   .toLowerCase())
  //           .then((Response<usermanagement.UserProfile> response) {
  //         if (response.isSuccessful) {
  //           context.read<UserState>().setUserProfile(
  //                 user: response.body,
  //                 context: context,
  //               );
  //         }
  //       });
  //     }
  //     _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  //     _pageInitiaized = true;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final ValueNotifier<int?> selectedIndexNotifier = useAfValueNotifier(null);
    final ValueNotifier<int> currentTabIndexNotifier = useAfValueNotifier(0);
    final TabController tabController = useTabController(
      initialLength: 3,
    );
    useMemoized(() {
      tabController.addListener(() {
        currentTabIndexNotifier.value = tabController.index;
      });
    });
    return ValueListenableBuilder(
      valueListenable: currentTabIndexNotifier,
      builder: (context, currentTabIndex, _) {
        final List<Widget> tabs = [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              // padding: Platform.isIOS
              //     ? EdgeInsets.only(
              //         bottom: 20,
              //       )
              //     : null,
              color: GlobalConstants.backgroundColor,
              child: Tab(
                icon: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: (currentTabIndex == 0)
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(
                      30,
                    )),
                  ),
                  child: Icon(
                    Icons.home,
                    size: 20,
                    color: (currentTabIndex == 0)
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Colors.white70,
                  ),
                ),
                child: Text("HOME",
                    style: TextStyle(
                      color: (currentTabIndex == 0)
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Colors.white70,
                    )),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              // padding: Platform.isIOS
              //     ? EdgeInsets.only(
              //         bottom: 20,
              //       )
              //     : null,
              color: GlobalConstants.backgroundColor,
              child: Tab(
                icon: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: (currentTabIndex == 1)
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(
                      30,
                    )),
                  ),
                  child: Icon(
                    Icons.business_center,
                    size: 20,
                    color: (currentTabIndex == 1)
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Colors.white70,
                  ),
                ),
                child: Text("JOBS",
                    style: TextStyle(
                      color: (currentTabIndex == 1)
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Colors.white70,
                    )),
              ),
            ),
          ),
          // FractionallySizedBox(
          //   widthFactor: 1.0,
          //   child: Container(
          //     // padding: Platform.isIOS
          //     //     ? EdgeInsets.only(
          //     //         bottom: 20,
          //     //       )
          //     //     : null,
          //     color: GlobalConstants.backgroundColor,
          //     child: Tab(
          //       icon: Container(
          //         width: 50,
          //         height: 30,
          //         decoration: BoxDecoration(
          //           color: (currentTabIndex == 2)
          //               ? Theme.of(context).colorScheme.primaryContainer
          //               : null,
          //           borderRadius: BorderRadius.all(Radius.circular(
          //             30,
          //           )),
          //         ),
          //         child: Icon(
          //           Icons.menu_book_outlined,
          //           size: 20,
          //           color: (currentTabIndex == 2)
          //               ? Theme.of(context).colorScheme.onPrimaryContainer
          //               : Colors.white70,
          //         ),
          //       ),
          //       child: Text(
          //         "COURSES",
          //         style: TextStyle(
          //           color: (currentTabIndex == 2)
          //               ? Theme.of(context).colorScheme.primaryContainer
          //               : Colors.white70,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              // padding: Platform.isIOS
              //     ? EdgeInsets.only(
              //         bottom: 20,
              //       )
              //     : null,
              color: GlobalConstants.backgroundColor,
              child: Tab(
                icon: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: (currentTabIndex == 3)
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(
                      30,
                    )),
                  ),
                  child: Icon(
                    Icons.account_circle,
                    size: 20,
                    color: (currentTabIndex == 3)
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Colors.white70,
                  ),
                ),
                child: Text(
                  "MY STUFF",
                  style: TextStyle(
                    color: (currentTabIndex == 3)
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ];

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0.95),
            body: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        OpenerWidget(
                          onTabChangeRequest: ({required int tabIndex}) {
                            tabController.animateTo(tabIndex);
                          },
                        ),
                        JobsDashboardWidget(
                          filterName: "ALL JOBS",
                        ),
                        // CoursesDashboardWidget(),
                        // UserProfileWidget(),
                        ProfileDashboard(),
                      ],
                    ),
                  ),
                  Container(
                    color: GlobalConstants.backgroundColor,
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      controller: tabController,
                      indicatorColor: GlobalConstants.backgroundColor,
                      tabs: tabs,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ),
        );
      },
    );
  }
}
