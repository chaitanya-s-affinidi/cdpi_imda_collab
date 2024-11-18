import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'server_failed.widget.dart';

class HandleErrorWidget extends StatelessWidget {
  final Exception exception;
  final Widget? notFoundWidget;
  final Widget? badRequestWidget;
  final Widget? preconditionFailedWidget;
  final Widget? serverFailedWidget;
  final Widget? unauthorizedWidget;
  final Widget? forbiddenWidget;
  const HandleErrorWidget({
    super.key,
    required this.exception,
    this.notFoundWidget,
    this.badRequestWidget,
    this.preconditionFailedWidget,
    this.serverFailedWidget,
    this.unauthorizedWidget,
    this.forbiddenWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (exception is DioException) {
      final err = exception as DioException;
      debugPrint("err.type: ${err.type.toString()}");
      if ((err.type != DioExceptionType.receiveTimeout) &&
          (err.type != DioExceptionType.connectionTimeout) &&
          (err.type != DioExceptionType.connectionError)) {
        return ServerFailedWidget(
          errString: exception.toString(),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
