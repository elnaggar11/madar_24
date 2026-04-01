import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:madar_24/main.dart';

import '../../gen/locale_keys.g.dart';
import '../../models/user_model.dart';
import '../routes/app_routes_fun.dart';
import '../services/local_notifications_service.dart';
import '../utils/app_const.dart';
import '../utils/enums.dart';
import '../utils/phoneix.dart';
import 'network_inspictors.dart';

class ServerGate {
  String? _baseUrl;
  String? _cachedDeviceKey;

  Future<Map<String, dynamic>> get constHeader async => {
    if (UserModel.i.isAuth)
      "Authorization": "Bearer ${UserModel.i.token}"
    else
      "Authorization": "Bearer ${prefs.getString('guest_token')}",
    "Accept": "application/json",
    "Accept-Language": LocaleKeys.lang.tr(),
    "user-type": "client",
    "agent-token": await _deviceKey(),
    // if (kDebugMode)
    //   "Authorization":
    //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3phZGEuc2hhcnFhd2kuYWFpdC1kLmNvbS9hcGkvY2xpZW50L2F1dGgvdmVyaWZ5IiwiaWF0IjoxNzY3NzA5NjkwLCJleHAiOjE3NzI4OTM2OTAsIm5iZiI6MTc2NzcwOTY5MCwianRpIjoiZ3JoYjc1ZFZ2STJnbHN5aSIsInN1YiI6IjE3IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfdHlwZSI6ImNsaWVudCJ9.uOokU1-6ERtTOpYsXVrzN3tKCeyHuo5Qscw9gue1GEo",
  };

  final _dio = Dio();

  ServerGate._() {
    _dio.interceptors.add(CustomApiInterceptor());
    _dio.interceptors.add(NetworkInterceptor());
  }

  static final ServerGate i = ServerGate._();

  Future<CustomResponse> sendToServer<T>({
    required String url,
    bool removeConstHeaders = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      params?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      headers?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      body?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      formData?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      final res = await _dio.post(
        url.startsWith('http') ? url : "${await _getBaseUrl()}/$url",
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {
            if (headers != null) ...headers,
            if (!removeConstHeaders) ...(await constHeader),
          },
          responseType: ResponseType.json,
        ),
        cancelToken: cancelToken,
        queryParameters: params,
      );
      if (res.data is Map && res.data["status"] != false) {
        return CustomResponse<T>(
          success: true,
          data: res.data,
          msg: res.data?["message"] ?? "",
          statusCode: 200,
        );
      } else {
        throw DioException.badResponse(
          statusCode: res.statusCode ?? 422,
          requestOptions: res.requestOptions,
          response: res,
        );
      }
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
      );
    }
  }

  /// Returns a stable device-specific key to attach with requests.
  /// Uses device info first, then falls back to FCM token.
  Future<String> _deviceKey() async {
    if (_cachedDeviceKey?.isNotEmpty == true) return _cachedDeviceKey!;

    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        _cachedDeviceKey = info.id;
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        _cachedDeviceKey = info.identifierForVendor;
      }
    } catch (_) {
      // Ignore and fallback below.
    }

    _cachedDeviceKey ??= await GlobalNotification.getFcmToken();
    _cachedDeviceKey ??= "";
    return _cachedDeviceKey!;
  }

  Future<CustomResponse> deleteFromServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      params?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      headers?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      body?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      formData?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      final res = await _dio.delete(
        url.startsWith('http') ? url : "${await _getBaseUrl()}/$url",
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {if (headers != null) ...headers, ...(await constHeader)},
          responseType: ResponseType.json,
        ),
        queryParameters: params,
      );
      if (res.data is Map) {
        return CustomResponse<T>(
          success: true,
          data: res.data,
          msg: res.data?["message"] ?? "",
          statusCode: 200,
        );
      } else {
        throw DioException.badResponse(
          statusCode: res.statusCode ?? 422,
          requestOptions: res.requestOptions,
          response: res,
        );
      }
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
      );
    }
  }

  Future<CustomResponse> getFromServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool constantHeaders = true,
    CancelToken? cancelToken,
  }) async {
    try {
      params?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      headers?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      final res = await _dio.get(
        url.startsWith('http') ? url : "${await _getBaseUrl()}/$url",
        cancelToken: cancelToken,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            if (constantHeaders) ...(await constHeader),
          },
          responseType: ResponseType.json,
        ),
        queryParameters: params,
      );

      if (res.data is Map) {
        return CustomResponse<T>(
          success: true,
          data: res.data,
          msg: res.data?["message"] ?? "",
          statusCode: 200,
        );
      } else {
        throw DioException.badResponse(
          statusCode: res.statusCode ?? 422,
          requestOptions: res.requestOptions,
          response: res,
        );
      }
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? e.toString()
            : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
      );
    }
  }

  Future<CustomResponse> putToServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      params?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      headers?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      body?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      formData?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      final res = await _dio.put(
        url.startsWith('http') ? url : "${await _getBaseUrl()}/$url",
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {if (headers != null) ...headers, ...(await constHeader)},
          responseType: ResponseType.json,
        ),
        queryParameters: params,
      );
      if (res.data is Map) {
        return CustomResponse<T>(
          success: true,
          data: res.data,
          msg: res.data?["message"] ?? "",
          statusCode: 200,
        );
      } else {
        throw DioException.badResponse(
          statusCode: res.statusCode ?? 422,
          requestOptions: res.requestOptions,
          response: res,
        );
      }
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
      );
    }
  }

  Future<CustomResponse> patchToServer<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? formData,
  }) async {
    try {
      params?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      headers?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      body?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      formData?.removeWhere((key, value) => value == null || '$value'.isEmpty);
      final res = await _dio.patch(
        url.startsWith('http') ? url : "${await _getBaseUrl()}/$url",
        data: formData == null ? (body ?? {}) : FormData.fromMap(formData),
        options: Options(
          headers: {if (headers != null) ...headers, ...(await constHeader)},
          responseType: ResponseType.json,
        ),
        queryParameters: params,
      );
      if (res.data is Map) {
        return CustomResponse<T>(
          success: true,
          data: res.data,
          msg: res.data?["message"] ?? "",
          statusCode: 200,
        );
      } else {
        throw DioException.badResponse(
          statusCode: res.statusCode ?? 422,
          requestOptions: res.requestOptions,
          response: res,
        );
      }
    } on DioException catch (e) {
      return handleServerError(e);
    } catch (e) {
      return CustomResponse(
        success: false,
        statusCode: 422,
        errType: ErrorType.unknown,
        msg: kDebugMode
            ? '$e'
            : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
      );
    }
  }

  CustomResponse<T> handleServerError<T>(DioException err) {
    if (err.type == DioExceptionType.cancel) {
      return CustomResponse(
        success: false,
        errType: ErrorType.cancel,
        msg: 'userCancelled'.tr(),
      );
    } else if (err.type == DioExceptionType.badResponse) {
      if ("${err.response?.data}".isEmpty) {
        return CustomResponse(
          success: false,
          statusCode: 402,
          errType: ErrorType.unknown,
          msg: LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
          data: err.response?.data,
        );
      } else if (err.response!.data.toString().contains("DOCTYPE") ||
          err.response!.data.toString().contains("<script>") ||
          err.response!.data["exception"] != null) {
        return CustomResponse(
          success: false,
          errType: ErrorType.server,
          data: err.response?.data,
          statusCode: err.response!.statusCode ?? 500,
          msg: kDebugMode
              ? "${err.response!.data}"
              : LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
        );
      } else if (err.response?.statusCode == 401) {
        if (UserModel.i.isAuth) {
          UserModel.i.clear();

          Phoenix.rebirth(navigator.currentContext!);
        }
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 401,
          errType: ErrorType.unAuth,
          msg: LocaleKeys.yourLoginSessionHasEnded.tr(),
          data: err.response?.data,
        );
      } else {
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 500,
          errType: ErrorType.backEndValidation,
          msg: err.response?.data["message"]?.toString() ?? "",
          data: err.response?.data,
        );
      }
    } else if (err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 500,
        errType: ErrorType.network,
        msg: LocaleKeys.poorConnectionCheckYourInternetQuality.tr(),
        data: err.response?.data,
      );
    } else if (err.response == null) {
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: ErrorType.network,
        msg: LocaleKeys.pleaseCheckYourInternetConnection.tr(),
        data: err.response?.data,
      );
    } else {
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: ErrorType.unknown,
        msg: LocaleKeys.somethingWentWrongPleaseTryAgain.tr(),
        data: err.response?.data,
      );
    }
  }

  Completer<String>? _baseUrlCompleter;
  Future<String> _getBaseUrl() async {
    if (_baseUrl == null) {
      _baseUrlCompleter = Completer<String>();
    } else {
      return _baseUrlCompleter!.future;
    }
    _baseUrlCompleter?.complete(APIconst.baseUrl);
    return APIconst.baseUrl;
    // final res = await _dio.get('https://api.sharqia.ae/base_url.json');
    // if (res.statusCode == 200) {
    //   _baseUrl = res.data;
    //   _baseUrlCompleter?.complete(_baseUrl);
    //   return _baseUrl!;
    // } else {
    //   _baseUrlCompleter = null;
    //   throw DioException.badResponse(
    //     statusCode: 422,
    //     requestOptions: RequestOptions(),
    //     response: Response(requestOptions: RequestOptions(), data: {'message': 'حدث مشكله بالاتصال بالسيرفر'}),
    //   );
    // }
  }
}

class CustomResponse<T> {
  bool success;
  ErrorType errType;
  String msg;
  int statusCode;
  T? data;

  CustomResponse({
    this.success = false,
    this.errType = ErrorType.none,
    this.msg = "",
    this.statusCode = 0,
    this.data,
  });
}
