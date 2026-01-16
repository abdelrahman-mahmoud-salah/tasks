import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
     'Login',
        textAlign: TextAlign.center,
      ),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          'Welcome',
          textAlign: TextAlign.center,
         
        ),
      ),
    );
  }
}
