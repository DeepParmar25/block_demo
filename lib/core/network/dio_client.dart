import 'package:dio/dio.dart';

import '../../config/constants/api_constants.dart';
import 'common_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.kAPIBaseURL,
        connectTimeout: APIConstants.kConnectionTimeOut,
        receiveTimeout: APIConstants.kReceiveTimeOut,
      ),
    );
    dio.interceptors.add(CommonInterceptor());
  }
}
