import 'package:dio/dio.dart';

import '../storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Get token from storage
    final token = await TokenStorage.getToken();
    
    // Only add Authorization header if token exists and is not empty
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 unauthorized - token might be invalid
    if (err.response?.statusCode == 401) {
      // Clear invalid token
      await TokenStorage.clearToken();
    }
    
    handler.next(err);
  }
}
