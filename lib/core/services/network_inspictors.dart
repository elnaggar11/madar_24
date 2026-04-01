import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:madar_24/core/routes/app_routes_fun.dart';
import 'package:madar_24/core/routes/routes.dart';
import 'package:madar_24/core/utils/app_const.dart';
import 'package:madar_24/core/utils/loger.dart';
import 'package:madar_24/core/widgets/flash_helper.dart';
import 'package:madar_24/gen/locale_keys.g.dart';
import 'package:madar_24/models/user_model.dart';

class NetworkInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is List) {
      response.data = {"data": response.data};
    }
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final removeToken = [APIconst.profileUpdateAuth, APIconst.verify].any((k) => options.path.contains(k));
    // if (removeToken) options.headers.removeWhere((k, v) => k == 'Authorization');
    // log("object $removeToken");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 && UserModel.i.isAuth) {
      UserModel.i.clear();
      FlashHelper.showToast(LocaleKeys.yourLoginSessionHasEnded.tr());
      pushAndRemoveUntil(NamedRoutes.welcome);
      push(NamedRoutes.login);
    }
    return super.onError(err, handler);
  }
}

class CustomApiInterceptor extends Interceptor {
  final log = LoggerDebug(
    headColor: LogColors.red,
    constTitle: "Server Gate Logger",
  );

  CustomApiInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.red(
      "\x1B[37m------ Current Error Response (status code ${err.response?.statusCode}) -----\x1B[0m",
    );
    log.red(
      jsonEncode(err.response?.data),
      err.response?.requestOptions.path.replaceAll(APIconst.baseUrl, ''),
    );
    log.red(_generateCurlCommand(err.requestOptions));
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log.green(
      "------ Current Response (status code ${response.statusCode}) ------",
    );
    log.green(
      jsonEncode(response.data),
      response.requestOptions.path.replaceAll(APIconst.baseUrl, ''),
    );
    log.white(_generateCurlCommand(response.requestOptions));
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.yellow("------ Current Request Path -----");
    log.yellow(
      "${options.path} ${LogColors.red}API METHOD : (${options.method})${LogColors.reset}",
    );
    if (options.data != null) {
      log.cyan("------ Current Request body Data -----");
      if (options.data is FormData) {
        Map<String, dynamic> body = {};
        for (var element in (options.data as FormData).fields) {
          body[element.key] = element.value;
        }
        for (var element in (options.data as FormData).files) {
          body[element.key] = '${element.value.filename}';
        }

        log.cyan(jsonEncode(body));
      } else {
        log.cyan(jsonEncode(options.data));
      }
    }
    log.white("------ Current Request Parameters Data -----");
    log.white(jsonEncode(options.queryParameters));
    log.yellow("------ Current Request Headers -----");
    log.yellow(jsonEncode(options.headers));
    return super.onRequest(options, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final method = options.method;
    final url = options.uri.toString();
    final headers = options.headers;
    final data = options.data;

    // Start building the cURL command
    final curlCommand = StringBuffer("curl -X $method '$url'");

    // Add headers
    headers.forEach((key, value) {
      curlCommand.write(" -H '$key: $value'");
    });

    // Add body if present
    if (data != null) {
      if (data is FormData) {
        for (var field in data.fields) {
          final escapedValue = field.value.replaceAll("'", r"'\''");
          curlCommand.write(" -F '${field.key}=$escapedValue'");
        }
        for (var file in data.files) {
          final filePath = (file.value.filename ?? 'file');
          curlCommand.write(" -F '${file.key}=@$filePath'");
        }
      } else if (data is Map) {
        curlCommand.write(" --data '${jsonEncode(data)}'");
      } else {
        curlCommand.write(" --data '$data'");
      }
    }

    return curlCommand.toString();
  }
}
