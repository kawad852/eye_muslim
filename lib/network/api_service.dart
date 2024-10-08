import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:eye_muslim/alerts/errors/app_error_feedback.dart';
import 'package:eye_muslim/alerts/loading/app_over_loader.dart';
import 'package:eye_muslim/network/api_url.dart';
import 'package:eye_muslim/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ApiType { get, post }

class ApiService<T> {
  static const String formatException = 'format-exception';
  static const String httpException = 'http-exception';
  static const String socketException = 'socket-exception';
  static const String timeoutException = 'timeout-exception';
  static const String generalException = 'general-exception';

  Future<T> uploadFiles({
    required String url,
    required Function(Map<String, dynamic> value) builder,
    Function(T model)? onSuccess,
    required Function(http.MultipartRequest value) onRequest,
  }) async {
    final futureCallback = await _handleCall(() async {
      final uri = Uri.parse('${ApiUrl.mainUrl}$url');

      var request = http.MultipartRequest('POST', uri);

      onRequest(request);

      var response = await request.send();

      var responseBody = await http.Response.fromStream(response).then((response) => response.body);
      log("ApiRequest::URL:: $url\nSTATUSCODE:: ${response.statusCode}\nBODY:: $responseBody");

      Map<String, dynamic> json = jsonDecode(responseBody);
      if (onSuccess != null) {
        final model = builder(json) as T;
        onSuccess(model);
      }
      return builder(json);
    });
    return futureCallback;
  }

  static Future<T> build<T>({
    required String url,
    Map<String, String>? additionalHeaders,
    Map<String, dynamic>? queryParams,
    Function(T model)? onEnd,
    required ApiType apiType,
    required T Function(Map<String, dynamic> value) builder,
    String? link,
  }) async {
    final T futureCallback = await _handleCall(() async {
      late http.Response response;
      final uri = Uri.parse(link ?? '${ApiUrl.mainUrl}$url');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept-Language': MySharedPreferences.language,
      };
      if (MySharedPreferences.accessToken.isNotEmpty) {
        headers["Authorization"] = MySharedPreferences.accessToken;
      }
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
        log("ApiHeaders:: $headers");
      }
      if (apiType == ApiType.get) {
        response = await http.get(
          uri,
          headers: headers,
        );
      }
      if (apiType == ApiType.post) {
        var body = queryParams != null ? jsonEncode(queryParams) : null;
        response = await http.post(
          uri,
          headers: headers,
          body: body,
        );
      }
      // log("ApiRequest::\nURL:: ${link ?? url}\nQueryParameters:: $queryParams\nSTATUSCODE:: ${response.statusCode}\nBODY:: ${response.body}");
      if (onEnd != null) {
        Map<String, dynamic> json = jsonDecode(response.body);
        await onEnd(builder(json));
      }
      Map<String, dynamic> json = jsonDecode(response.body);
      return builder(json);
    }).timeout(
      const Duration(seconds: 20),
      onTimeout: () => throw TimeoutException(timeoutException),
    );

    return futureCallback;
  }

  static _handleCall<T>(Future<T> Function() call) async {
    try {
      // throw HttpException('');
      // throw FormatException('');
      // throw TimeoutException('');
      // throw SocketException('');
      // throw Exception();

      return await call();
    } on HttpException catch (e) {
      log("Exception::\nType:: HttpException\nmsg:: ${e.message}");
      throw Failure(type: httpException, code: e.message);
    } on FormatException catch (e) {
      log("Exception::\nType:: FormatException\nmsg:: $e");
      throw Failure(type: formatException, code: e.message);
    } on SocketException catch (e) {
      log("Exception::\nType:: SocketException\nmsg:: $e");
      throw Failure(type: socketException, code: e.message);
    } on TimeoutException catch (e) {
      log("Exception::\nType:: TimeoutException\nmsg:: $e");
      throw Failure(type: timeoutException, code: e.message ?? '');
    } catch (e) {
      log("Exception::\nType:: GeneralException\nmsg:: $e");
      throw Failure(type: generalException, code: e.toString());
    }
  }
}

class ApiFutureBuilder {
  static Future fetch<T>(
    BuildContext context, {
    Function(Failure failure)? onError,
    required Future<T> Function() future,
    Function(T snapshot)? onComplete,
    bool withOverlayLoader = true,
    Widget? indicator,
  }) async {
    if (withOverlayLoader) {
      AppOverlayLoader.show(indicator: indicator);
    }

    await future().whenComplete(() {
      if (withOverlayLoader) {
        AppOverlayLoader.hide();
      }
    }).then((value) {
      if (onComplete != null) {
        onComplete(value);
      }
    }, onError: (error) {
      if (error is Failure) {
        if (onError != null) {
          onError(error);
        } else {
          if (context.mounted) {
            AppErrorFeedback.show(context, error);
          }
        }
      }
    });
  }
}

class BearFetcher<T> extends ApiFutureBuilder {
  void execute(
    BuildContext context, {
    required Future Function() futures,
  }) async {
    await futures();
  }
}

class Failure {
  final String type, code;

  Failure({
    required this.type,
    required this.code,
  });
}
