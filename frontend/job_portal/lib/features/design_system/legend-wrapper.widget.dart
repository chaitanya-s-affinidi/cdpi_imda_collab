import 'package:flutter/material.dart';

class LegendWrapperWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const LegendWrapperWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 8.0,
            right: 6,
            left: 6,
            bottom: 6,
          ),
          child: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              border: Border.all(
                color: Colors.black26,
                width: 0.5,
              ),
            ),
            child: child,
          ),
        ),
        Positioned(
          left: 20,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
