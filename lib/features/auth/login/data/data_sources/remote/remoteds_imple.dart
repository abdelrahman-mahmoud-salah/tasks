import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/core/services/auth_api_service.dart';
import 'package:flutter_application_1/features/auth/login/data/data_sources/remote/remote_ds.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_request_model.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_response_model.dart'; 

class LoogInRemotedsImplementation implements RemoteLoginDataSource {
  final AuthApiService _authApiService;

  LoogInRemotedsImplementation(this._authApiService);
  @override
  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel requestData,
  ) async {
    try {
      final result = await _authApiService.login(requestData);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
