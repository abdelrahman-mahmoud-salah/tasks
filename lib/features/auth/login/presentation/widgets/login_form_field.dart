import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/text_from_field_app.dart';
import 'package:flutter_application_1/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LoginFormField extends StatelessWidget {
  const LoginFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: context.read<LoginCubit>().phoneController,
              hintText: 'Your phone',
              keyboardType: TextInputType.emailAddress,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Phone is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().passwordController,
              hintText: 'Password',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.visibility_sharp,
                      color: Colors.black,
                    ),
                  )),
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}
