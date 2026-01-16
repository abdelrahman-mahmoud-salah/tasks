import '../../../../../../core/services/api_error_handler.dart';
import 'package:task/features/auth/login/data/models/login_request_model.dart';
import 'package:task/features/auth/login/data/models/login_response_model.dart';


abstract class RemoteLoginDataSource {
  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel requestData);
 
}