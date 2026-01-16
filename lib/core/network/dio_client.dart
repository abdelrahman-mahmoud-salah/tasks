import 'package:dio/dio.dart';

import '../services/app_error.dart';
import 'auth_interceptor.dart';

class DioClient {
  DioClient(this._dio);

  final Dio _dio;

  Dio get dio => _dio;

  static Dio createDefault(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
      ),
    );

    // Add auth interceptor first to attach token
    dio.interceptors.add(AuthInterceptor());

    // Add logging interceptor
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}

AppError mapDioError(Object error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const AppError.network('No internet connection');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          return const AppError.unauthorized('Unauthorized');
        }
        return AppError.server('Server error (${statusCode ?? 'unknown'})');
      case DioExceptionType.cancel:
        return const AppError.unknown('Request cancelled');
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const AppError.unknown('Unexpected error occurred');
    }
  }
  return const AppError.unknown('Unexpected error occurred');
}
