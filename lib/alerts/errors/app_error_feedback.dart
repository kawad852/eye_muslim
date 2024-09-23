import 'package:eye_muslim/alerts/feedback/app_feedback.dart';
import 'package:eye_muslim/network/api_service.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class AppErrorFeedback {
  static void show(
    BuildContext context,
    Failure failure, {
    Function()? onGeneralError,
    Function()? onInternetError,
    Function()? onServerError,
  }) {
    switch (failure.type) {
      case ApiService.httpException:
      case ApiService.formatException:
        onServerError == null ? context.showSnackBar(context.appLocalization.generalError) : onServerError();
      case ApiService.timeoutException:
      case ApiService.socketException:
        onInternetError == null ? context.showSnackBar(context.appLocalization.networkError) : onInternetError();
      default:
        onGeneralError == null ? context.showSnackBar(context.appLocalization.generalError) : onGeneralError();
    }
  }
}
