import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationWidget extends StatefulWidget {
  final String file;
  final bool? repeatFlag;
  LottieAnimationWidget({
    required this.file,
    this.repeatFlag,
  });
  @override
  _LottieAnimationWidgetState createState() => _LottieAnimationWidgetState();
}

class _LottieAnimationWidgetState extends State<LottieAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/' + widget.file + '.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller!.duration = composition.duration;

        if ((widget.repeatFlag != null) && widget.repeatFlag!) {
          _controller!.repeat();
        } else {
          _controller!.forward();
        }
      },
    );
  }
}
