import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/global.dart';
import 'package:uleaning_app_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:uleaning_app_bloc/pages/welcome/bloc/welcome_events.dart';

import '../welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        color: Colors.white,
        child: Scaffold(body:
        BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Next",
                        "First See Leaning",
                        "Forget about of paper all knowledge in one learning",
                        "assets/images/reading.png",
                        _controller),
                    _page(
                        2,
                        context,
                        "Next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor and friends. Let's get connected",
                        "assets/images/man.png",
                        _controller),
                    _page(
                        3,
                        context,
                        "Get started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                        "assets/images/boy.png",
                        _controller),
                  ],
                ),
                Positioned(
                  bottom: 130.h,
                  child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: WormEffect(
                        activeDotColor: AppColors.primaryElement,
                        dotColor: Colors.black.withOpacity(0.15),
                        dotHeight: 9.h,
                        dotWidth: 9.h,
                        spacing: 10.w,
                        //verticalOffset: 50,
                        // jumpScale: 3,
                      )),
                )
              ],
            ),
          );
        })),
      ),
    );
  }
}


Widget _page(int index, BuildContext context, String btnName, String title,
    String subTitle, String imagePath, PageController controller) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(imagePath),
      ),
      Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      SizedBox(height: 30.h),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate);
          }
          else{
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
            // Navigator.pushNamed(context, "signIn");
            Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
            print("the value is ${Global.storageService.getDeviceFirstOpen()}");
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
          }
        },
        child: Container(
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(30.w),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ]),
          child: Center(
            child: Text(
              btnName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    ],
  );
}
