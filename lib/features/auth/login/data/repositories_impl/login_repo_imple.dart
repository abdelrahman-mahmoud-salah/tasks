

import 'package:flutter_application_1/features/auth/login/data/models/login_request_model.dart';
import 'package:flutter_application_1/features/auth/login/data/models/login_response_model.dart';
import 'package:flutter_application_1/features/auth/login/domain/repositories/auth_repository.dart';

import '../../../../../core/services/api_error_handler.dart';
import '../data_sources/remote/remote_ds.dart';


class LoginRepoImple implements LoginRepository {
  final RemoteLoginDataSource _loginDataSource;
  LoginRepoImple(this._loginDataSource);
  @override
  Future<ApiResult<LoginResponseModel>> logIn(
          LoginRequestModel signInRequestModel) =>
      _loginDataSource.login(signInRequestModel);
}
