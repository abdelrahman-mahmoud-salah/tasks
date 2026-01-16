
import 'package:flutter_application_1/core/services/api_error_handler.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_request_model.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponseModel>> logIn(LoginRequestModel signInRequestModel);
}

