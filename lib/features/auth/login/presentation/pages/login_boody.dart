import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login/presentation/widgets/login_button.dart';
import 'package:flutter_application_1/features/auth/login/presentation/widgets/login_form_field.dart';
import 'package:flutter_application_1/features/auth/login/presentation/widgets/login_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class LoginBoody extends StatelessWidget {
  const LoginBoody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       child: Column(
        children: [
         
          SizedBox(
            height: 50.h,
          ),
          const LoginTitle(),
          SizedBox(
            height: 50.h,
          ),
          const LoginFormField(),
          SizedBox(
            height: 20.h,
          ),
          const LoginButton(),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Text(
                 
                  
                   'Do you have an account?',
                  textAlign: TextAlign.center,),
              InkWell(
                onTap: () {
                 
                },
                splashColor: Colors.blue,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
