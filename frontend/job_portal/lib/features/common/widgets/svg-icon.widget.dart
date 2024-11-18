import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String? icon;
  final int? size;
  final double? opacity;
  final Color? color;
  SvgIconWidget({required this.icon, this.size, this.opacity, this.color});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1.0,
      child: SvgPicture.asset(
        icon!,
        width: (size != null) ? (size! * 1.0) : 24.0,
        height: (size != null) ? (size! * 1.0) : 24.0,
        color: color,
        // color: Colors.black,
      ),
    );
  }
}
