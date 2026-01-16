
import 'package:task/features/auth/login/data/models/login_response_model.dart';
import 'package:task/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:task/features/auth/login/data/models/login_request_model.dart';

import '../../../../../core/services/api_error_handler.dart';


class LoginUseCase {
  LoginRepository signUpRepo;
  LoginUseCase( this.signUpRepo);

  Future<ApiResult<LoginResponseModel>> Call(
         
         { required LoginRequestModel SignInRequestModel}) =>
      signUpRepo.logIn(SignInRequestModel);
}