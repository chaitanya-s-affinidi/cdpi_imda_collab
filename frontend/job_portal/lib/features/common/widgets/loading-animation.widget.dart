import 'package:job_portal/global_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimationWidget extends StatelessWidget {
  final Color? color;
  final double? radius;
  LoadingAnimationWidget({
    this.color,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
      // color: Colors.white,
      size: 30,
      color: GlobalConstants.backgroundColor,
    )
        // CupertinoActivityIndicator(
        //   radius: radius ?? 10,
        //   color: color,
        //   // animating: true,
        //   // radius: _kDefaultIndicatorRadius,
        // ),
        );
    // SpinKitWave(
    //   itemBuilder: (_, int index) {
    //     return DecoratedBox(
    //       decoration: BoxDecoration(
    //         color: index.isEven ? Colors.black : Colors.black,
    //       ),
    //     );
    //   },
    // );
  }
}
