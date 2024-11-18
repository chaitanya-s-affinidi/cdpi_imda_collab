import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  LoadingWidget({this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.primary,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Text(message ?? "Loading.."),
        ],
      ),
    );
  }
}
