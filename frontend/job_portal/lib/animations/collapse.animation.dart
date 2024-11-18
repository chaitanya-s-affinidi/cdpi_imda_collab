import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class CollapseAnimationWidget extends StatefulWidget {
  final Widget child;
  // final bool? expand;
  final Axis? axis;
  final bool? reverseFlag;
  CollapseAnimationWidget({
    // this.expand = false,
    required this.child,
    this.axis,
    this.reverseFlag,
  });

  @override
  _CollapseAnimationWidgetState createState() =>
      _CollapseAnimationWidgetState();
}

class _CollapseAnimationWidgetState extends State<CollapseAnimationWidget> {
  // late AnimationController _animationController;
  // late Animation<double> animation;
  @override
  void initState() {
    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    // Animation curve = CurvedAnimation(
    //   parent: _animationController,
    //   curve: Curves.fastOutSlowIn,
    // );
    // animation = Tween(begin: 0.0, end: 1.0).animate(curve as Animation<double>);
    // // if (widget.expand!) {
    // _animationController.forward();
    // // } else {
    // // }

    super.initState();
  }

  // @override
  // void didUpdateWidget(CollapseAnimationWidget oldWidget) {
  //   if (widget.expand!) {
  //     _animationController.forward();
  //   } else {
  //     _animationController.reverse();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    // _animationController.reverse();
    // Future.delayed(Duration(milliseconds: 1000)).then((_) {
    // _animationController.dispose();
    // });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 500,
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          axis: (widget.axis != null) ? widget.axis! : Axis.vertical,
          // textDirection: TextDirection.ltr,
          // axisDirection: widget.axisDirection,
          axisAlignment: ((widget.reverseFlag != null) && widget.reverseFlag!)
              ? -1.0
              : 1.0,
          sizeFactor: animation,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
