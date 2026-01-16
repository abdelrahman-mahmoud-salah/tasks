import 'package:flutter_application_1/features/auth/login/data/models/login_request_model.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_response_model.dart';

import '../../../../../../core/services/api_error_handler.dart';



abstract class RemoteLoginDataSource {
  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel requestData);
 
}