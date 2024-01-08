import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:uleaning_app_bloc/pages/sign_in/bloc/sign_in_events.dart';
import 'package:uleaning_app_bloc/pages/sign_in/bloc/sign_in_states.dart';
import 'package:uleaning_app_bloc/pages/sign_in/sign_in_controller.dart';
import 'package:uleaning_app_bloc/pages/common_widgets/common_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar("Sign In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText("Or use your email account log in")),
                  Container(
                    margin: EdgeInsets.only(top: 65.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        buildTextField(
                            "Enter your email address", "email", "user",
                                (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                        SizedBox(height: 20.h),
                        reusableText('Password'),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        forgotPassword(),
                        SizedBox(
                          height: 30.h,
                        ),
                        buildLogInAdnRegButton("Sign In","login", () {
                          SignInController(context: context).handleSignIn("email");
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        buildLogInAdnRegButton("Sign Up","signup", () {
                          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_UP, (route) => false);
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
