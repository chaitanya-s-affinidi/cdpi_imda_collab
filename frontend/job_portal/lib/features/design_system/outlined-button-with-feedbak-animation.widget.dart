import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OutlinedButtonWithFeedbackAnimationWidget extends StatefulWidget {
  final String text;
  final bool processingFlag;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final Icon? icon;
  OutlinedButtonWithFeedbackAnimationWidget({
    required this.processingFlag,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.icon,
  });

  @override
  _OutlinedButtonWithFeedbackAnimationWidgetState createState() =>
      _OutlinedButtonWithFeedbackAnimationWidgetState();
}

class _OutlinedButtonWithFeedbackAnimationWidgetState
    extends State<OutlinedButtonWithFeedbackAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: OutlinedButton(
        onPressed: widget.processingFlag
            ? () {}
            : widget.onPressed as void Function()?,
        style: OutlinedButton.styleFrom(
          // backgroundColor: (widget.color != null)
          //     ? widget.color!
          //     : GlobalConstants.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          maximumSize: const Size.fromWidth(320),
        ),
        child: widget.processingFlag
            ? const SpinKitThreeBounce(
                color: GlobalConstants.backgroundColor,
                size: 30,
              )
            : Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                ),
              ),
      ),
    );
  }
}
