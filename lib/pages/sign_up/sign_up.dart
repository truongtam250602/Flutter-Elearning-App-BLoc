import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/pages/common_widgets/common_widgets.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_events.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_states.dart';
import 'package:uleaning_app_bloc/pages/sign_up/sign_up_controller.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpStates>(builder: (context, state){
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText("Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('User name'),
                        buildTextField(
                            "Enter your user name", "name", "user",
                                (value) {
                              context.read<SignUpBloc>().add(UserNameEvent(value));
                            }),
                        SizedBox(height: 10.h),
                        reusableText('Email'),
                        buildTextField(
                            "Enter your email address", "email", "user",
                                (value) {
                              context.read<SignUpBloc>().add(EmailEvent(value));
                            }),
                        SizedBox(height: 10.h),
                        reusableText('Password'),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignUpBloc>().add(PasswordEvent(value));
                        }),
                        SizedBox(height: 10.h),
                        reusableText('Confirm password'),
                        buildTextField(
                            "Enter your confirm password", "password", "lock", (value) {
                          context.read<SignUpBloc>().add(RePasswordEvent(value));
                        }),
                        SizedBox(
                          height: 10.h,
                        ),
                        reusableText2("By creating an account you have to agree with our them & condication."),
                        SizedBox(
                          height: 25.h,
                        ),
                        buildLogInAdnRegButton("Sign Up","login", () {
                          SignUpController(context: context).handleEmailRegister();
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

