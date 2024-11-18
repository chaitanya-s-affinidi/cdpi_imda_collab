import 'package:job_portal/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FilledButtonWithFeedbackAnimationWidget extends StatefulWidget {
  final String text;
  final bool processingFlag;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final Icon? icon;
  FilledButtonWithFeedbackAnimationWidget({
    required this.processingFlag,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.icon,
  });

  @override
  _FilledButtonWithFeedbackAnimationWidgetState createState() =>
      _FilledButtonWithFeedbackAnimationWidgetState();
}

class _FilledButtonWithFeedbackAnimationWidgetState
    extends State<FilledButtonWithFeedbackAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: FilledButton(
        onPressed: widget.processingFlag
            ? () {}
            : widget.onPressed as void Function()?,
        style: FilledButton.styleFrom(
          backgroundColor: (widget.color != null)
              ? widget.color!
              : GlobalConstants.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            side: BorderSide.none,
          ),
          maximumSize: const Size.fromWidth(320),
        ),
        child: widget.processingFlag
            ? const SpinKitThreeBounce(
                color: Colors.white,
                size: 30,
              )
            : Text(
                widget.text,
                style: TextStyle(
                  color: (widget.textColor != null)
                      ? widget.textColor
                      : Colors.white,
                ),
              ),
      ),
    );
  }
}
