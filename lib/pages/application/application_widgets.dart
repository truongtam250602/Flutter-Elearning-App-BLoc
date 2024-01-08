import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/pages/home/home_page.dart';
import 'package:uleaning_app_bloc/pages/profile/profile.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    const HomePage(),
    Center(child: Text("search"),),
    Center(child: Text("course"),),
    Center(child: Text("chatting"),),
    const ProfilePage(),
  ];
  return _widget[index];
}

var buttonTabs = [
  BottomNavigationBarItem(
      label: "",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement,),
      )
  ),
  BottomNavigationBarItem(
      label: "",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/search2.png", color: AppColors.primaryElement,),
      )
  ),
  BottomNavigationBarItem(
      label: "",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/play-circle1.png", color: AppColors.primaryElement,),
      )
  ),
  BottomNavigationBarItem(
      label: "",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/message-circle.png"),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/message-circle.png", color: AppColors.primaryElement,),
      )
  ),
  BottomNavigationBarItem(
      label: "",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/person2.png", color: AppColors.primaryElement,),
      )
  )
];