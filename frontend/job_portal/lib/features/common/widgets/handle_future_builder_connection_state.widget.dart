import 'package:flutter/material.dart';
import 'package:job_portal/features/common/widgets/handle_error.widget.dart';
import 'package:job_portal/features/common/widgets/loading-animation.widget.dart';

class HandleFutureBuilderConnectionStateWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Widget Function() onLoaded;
  final ValueNotifier<bool>? isLoadingNotifier;
  const HandleFutureBuilderConnectionStateWidget({
    super.key,
    required this.snapshot,
    required this.onLoaded,
    this.isLoadingNotifier,
  });

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        isLoadingNotifier?.value = true;
        return LoadingAnimationWidget();
      case ConnectionState.active:
      case ConnectionState.done:
        isLoadingNotifier?.value = false;
        if (snapshot.hasError) {
          return HandleErrorWidget(
            exception: snapshot.error as Exception,
          );
        } else {
          return onLoaded();
        }
    }
  }
}
