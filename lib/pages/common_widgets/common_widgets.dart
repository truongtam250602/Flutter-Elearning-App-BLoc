import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';

AppBar buildAppBar(String titleName) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    automaticallyImplyLeading: false,
    shadowColor: Colors.transparent,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    title: Text(
      titleName,
      style: TextStyle(
          color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 10.w),
        width: 160.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reusableIcons("google"),
            _reusableIcons("apple"),
            _reusableIcons("facebook")
          ],
        )),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 30.w,
      width: 30.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget reusableText2(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.normal,
          fontSize: 12.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func
    ) {
  return Container(
    height: 50.h,
    width: 325.w,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: Colors.grey)),
    child: Row(
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          margin: EdgeInsets.only(left: 15.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextField(
            onChanged: (value)=>func!(value),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8))),
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 12.sp,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal),
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return GestureDetector(
    onTap: () {},
    child: Text(
      "Forgot password",
      style: TextStyle(decoration: TextDecoration.underline, fontSize: 10.sp),
    ),
  );
}

Widget buildLogInAdnRegButton(String buttonName,String buttonType,void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          border: Border.all(
              color: buttonType == "login"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          borderRadius: BorderRadius.circular(30.w),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonType == "login"
                  ? Colors.white
                  : AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}
