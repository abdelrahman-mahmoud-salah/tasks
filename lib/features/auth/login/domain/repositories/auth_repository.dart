import 'package:task/core/services/api_error_handler.dart';
import 'package:task/features/auth/login/data/models/login_response_model.dart';

import 'package:task/features/auth/login/data/models/login_request_model.dart';
abstract class LoginRepository {
  Future<ApiResult<LoginResponseModel>> logIn(LoginRequestModel signInRequestModel);
}

