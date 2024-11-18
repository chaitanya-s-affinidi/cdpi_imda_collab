import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerFailedWidget extends ConsumerWidget {
  final String? errString;
  const ServerFailedWidget({
    super.key,
    required this.errString,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(errString ?? ""),
        ),
        Center(
          child: SizedBox(
            width: 350,
            child: Icon(
              Icons.error,
              size: 250,
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.all(6.0),
        //       child: ActionChip(
        //         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 80,
        //         ),
        //         label: Text(
        //           "HOME",
        //           style: TextStyle(
        //             color: Theme.of(context).colorScheme.onPrimaryContainer,
        //           ),
        //         ),
        //         onPressed: () {
        //           NavigationService().replace(
        //             (ref.read(userStateProvider).userInfo != null)
        //                 ? UserRouteNames.dashboard
        //                 : PublicRouteNames.home,
        //           );
        //           // GlobalConstants
        //           //     .navigatorKey
        //           //     .currentState!
        //           //     .pushNamedAndRemoveUntil(
        //           //       ((EnvironmentService().environment!.usermode != null)
        //           //               ? ('/' +
        //           //                   EnvironmentService().environment!.usermode!)
        //           //               : "") +
        //           //           '/dashboard',
        //           //       (Route<dynamic> route) => false,
        //           //     );
        //         },
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
