import 'package:flutter/material.dart';
import '../animations/slide-bottom.animation.dart';
import 'package:styled_text/styled_text.dart';

class OpenResponsiveSimpleOverlay {
  Future call({
    required BuildContext context,
    required String title,
    required Widget body,
  }) async {
    if (MediaQuery.of(context).size.width < 600) {
      return Navigator.of(context).push(
        SlideBottomRoute(
          page: Scaffold(
            appBar: AppBar(
              title: Text(
                title,
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.clear_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            body: body,
          ),
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ), //this right here
            child: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(),
                      StyledText(
                        text: title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.clear_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: body,
                )
              ],
            ),
          );
        },
      );
    }
  }
}
