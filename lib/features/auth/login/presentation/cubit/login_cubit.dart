import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/core/services/auth_api_service.dart';
import 'package:task/features/auth/login/data/data_sources/remote/remote_ds.dart';
import 'package:task/features/auth/login/data/data_sources/remote/remoteds_imple.dart';
import 'package:task/features/auth/login/data/models/login_request_model.dart';
import 'package:task/features/auth/login/data/repositories_impl/login_repo_imple.dart';
import 'package:task/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:task/features/auth/login/domain/usecases/login_usecase.dart';


import '../../../../../core/storage/token_storage.dart';
// import '../../../../../core/storage/user_storage.dart'; // Uncomment when user_id is available

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(state.copyWith(screenStatus: LoginStateValue.Loading));
  
      RemoteLoginDataSource loginDataSource = LoogInRemotedsImplementation(
        sl<AuthApiService>(),
      );
      LoginRepository loginRepository = LoginRepoImple(loginDataSource);
      LoginUseCase _loginUseCase = LoginUseCase(loginRepository);
      var repo = await _loginUseCase.Call(
        SignInRequestModel: LoginRequestModel(
          phone: phoneController.text,
          password: passwordController.text,
        ),
      );
      repo.when(
      success: (data) async{
        if (data.data.token!.isNotEmpty) {
        await TokenStorage.saveToken(data.data.token!);
        // TODO: Store user_id if available in login response
        // If user_id is in the response, uncomment and update:
        // if (data.data.userId != null) {
        //   await UserStorage.saveUserId(data.data.userId!);
        // }
        // Or extract from JWT token if it contains user_id
      }
        emit(
            const LoginState().copyWith(screenStatus: LoginStateValue.success));
      },
      failure: (errorHandler) {
        emit(const LoginState().copyWith(
            screenStatus: LoginStateValue.error, failures: errorHandler));
      },
    );
       

      
    
    }
  }

