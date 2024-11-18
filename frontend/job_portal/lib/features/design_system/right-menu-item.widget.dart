import 'package:flutter/material.dart';
import 'package:job_portal/features/design_system/decorated-text.widget.dart';

class RightMenuItemWidget extends StatefulWidget {
  final IconData icon;
  final String description;
  final String? namedroute;
  final Function? onTapFn;
  final Widget? badge;
  final bool? isSubMenuItem;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Widget>? submenuitems;

  const RightMenuItemWidget({
    super.key,
    required this.icon,
    required this.description,
    required this.scaffoldKey,
    this.isSubMenuItem,
    this.namedroute,
    this.onTapFn,
    this.badge,
    this.submenuitems,
  });
  @override
  _RightMenuItemWidgetState createState() => _RightMenuItemWidgetState();
}

class _RightMenuItemWidgetState extends State<RightMenuItemWidget> {
  bool _openSubMenuItemsFlag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    // const SizedBox(width: 10),
                    Container(
                      width: 60,
                      height: 60,
                      // padding: const EdgeInsets.all(6),
                      color: (widget.isSubMenuItem != null)
                          ? null
                          : Theme.of(context).colorScheme.secondaryContainer,
                      child: Center(
                        child: Icon(
                          widget.icon,
                          size: 24,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 10),
                                      DecoratedTextWidget(
                                        content:
                                            widget.description.toUpperCase(),
                                        fontSize: 14,
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                ),
                                (widget.submenuitems != null)
                                    ? Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Icon(
                                          _openSubMenuItemsFlag
                                              ? Icons.expand_less_outlined
                                              : Icons.expand_more_outlined,
                                        ),
                                      )
                                    : (widget.badge != null)
                                        ? Container(
                                            child: widget.badge,
                                          )
                                        : Container(),
                              ],
                            ),
                            const Divider(height: 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            if (widget.submenuitems != null) {
              setState(() {
                _openSubMenuItemsFlag = !_openSubMenuItemsFlag;
              });
            } else {
              if (widget.scaffoldKey.currentState!.isDrawerOpen) {
                Navigator.of(context).pop();
              }
              if (widget.onTapFn != null) {
                widget.onTapFn!();
              } else {
                Navigator.of(context).pushNamed(
                  widget.namedroute!,
                );
              }
            }
          },
        ),
        (widget.submenuitems != null)
            ? (_openSubMenuItemsFlag
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(width: 35),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.submenuitems!.map((submenuitem) {
                            return submenuitem;
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                : Container())
            : Container(),
      ],
    );
  }
}
