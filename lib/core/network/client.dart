import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_gst/core/resourses/constants_manager.dart';

extension DioExtension on Dio {
  Dio initClient(String baseUrl) {
    options.baseUrl = baseUrl;
    options.connectTimeout =
        const Duration(seconds: AppConstants.connectTimeout);
    options.receiveTimeout =
        const Duration(seconds: AppConstants.receiveTimeout);
    options.sendTimeout = const Duration(seconds: AppConstants.sendTimeout);

    if (kDebugMode) interceptors.add(LogInterceptor(responseBody: true));
    return this;
  }
}
