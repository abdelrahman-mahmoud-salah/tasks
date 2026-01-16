import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login/presentation/pages/login_boody.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        child: const SafeArea(
          bottom: false,
          child: LoginBoody(),
        ),
      ),
    );
  }
}
