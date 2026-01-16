import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extension/context_extention.dart';
import 'package:flutter_application_1/core/widgets/custom_linear_bottom.dart';
import 'package:flutter_application_1/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/auth/login/presentation/cubit/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.screenStatus == LoginStateValue.error) {
          context.showToastError(state.failures ?? 'An error occurred');
        } else if (state.screenStatus == LoginStateValue.success) {
          context.pushNamedAndRemoveUntil(
            pageName: '/home',
            arg: null,
          );
          context.showToastSuccess('Logged successfully');
        }
      },
      builder: (context, state) {
        if (state.screenStatus == LoginStateValue.Loading) {
          return CustomLinearButton(
            onPressed: () {},
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: const CircularProgressIndicator(color: Colors.white),
          );
        } else {
          return CustomLinearButton(
            onPressed: () {
              _validateThenDoLogin(context);
            },
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: Text(
              textAlign: TextAlign.center,
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
