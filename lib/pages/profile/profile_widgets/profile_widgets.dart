import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBarProfile() {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    shadowColor: Colors.transparent,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(fontSize: 12.sp, color: AppColors.primaryText),
          ),
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          )
        ],
      ),
    ),
  );
}

// avatar, edit avatar view
Widget profileEditAvatar() {
  return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 65.w,
      height: 80.h,
      child: Container(
        padding: EdgeInsets.only(right: 2.w),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            image: const DecorationImage(
                image: AssetImage("assets/icons/user.png"),
                fit: BoxFit.fitWidth)),
        child: Image(
          width: 20.w,
          height: 20.h,
          image: AssetImage("assets/icons/edit_3.png"),
        ),
      ));
}

var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love":"heart(1).png",
  "Learning Reminders":"cube.png"
};
// setting section view
Widget settingView(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 15.w),
    child: Column(
      children: [
        ...List.generate(
          imagesInfo.length,
          (index)=>GestureDetector(
            onTap: (){
              if(index == 0){
                Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SETTINGS_PAGE, (route) => false);
              }
            },
            child: Container(
              width: 350.w,
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Container(
                    width: 32.w,
                    height: 40.h,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText),
                  )
                ],
              ),
            ),
          )
        )
      ],
    ),
  );
}

