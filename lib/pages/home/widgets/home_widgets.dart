import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/entities/course.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_events.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar(String avatarUrl){
  return  AppBar(
    backgroundColor: AppColors.primaryBackground,
    shadowColor: Colors.transparent,
    title: Container(
      margin: EdgeInsets.only(left: 9.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 32.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.w),
                image: DecorationImage(
                  image: NetworkImage("${AppConstants.SERVER_API_URL}$avatarUrl"),
                  fit: BoxFit.fill
                )
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color? color=AppColors.primaryText, int? top, int? fontSize}){
  return Container(
    margin: EdgeInsets.only(top: top!.h),
    child: Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize?.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(20.h),
          border: Border.all(color: AppColors.primaryFourElementText)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: (value)=>func!(value),
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "Search your course",
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
      ),
      GestureDetector(
        child: Container(
          width: 32.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

//slides view
Widget slidesView(BuildContext context, HomePageStates state){
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 200.h,
        child: PageView(
          onPageChanged: (value){
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            // nếu mà vừa sửa tên file ảnh mà lỗi ko tìm được path thì dùng
            // flutter clean sau do flutter pub get
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/Image(1).png"),
            _slidersContainer(path: "assets/icons/Image(2).png")
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThreeElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(8.0),
          activeSize: const Size(17.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          )
        ),
      )
    ],
  );
}

// sliders widget
Widget _slidersContainer({String path = "assets/icons/art.png"}){
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(path)
        )
    ),
  );
}
// menu view
Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Choice your course",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText
              ),
            ),
            GestureDetector(
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.primaryThreeElementText
                  ),
                ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",textColor: AppColors.primaryThreeElementText,bgColor: Colors.transparent),
            _reusableMenuText("Newest",textColor: AppColors.primaryThreeElementText,bgColor: Colors.transparent),
          ],
        ),
      ),

    ],
  );
}

// reusableMenuText
Widget _reusableMenuText(String text,{Color textColor = Colors.white, Color bgColor = AppColors.primaryElement}){
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 10.sp,
            color: textColor
        ),
      ),
    ),
  );
}

// course grid view
Widget courseGridView(CourseItem item){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: DecorationImage(
          fit:  BoxFit.fill,
          // image: AssetImage("assets/icons/Image(1).png"),
        image: NetworkImage(AppConstants.SERVER_UPLOADS+item.thumbnail!),
      ),
    ),
    padding: EdgeInsets.only(bottom: 8.h, left: 8.w, right: 8.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name??"",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: Colors.black,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5.h,),
        Text(
          item.description??"",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: Colors.black,
              fontSize: 8.sp,
              fontWeight: FontWeight.normal
          ),
        )
      ],
    ),
  );
}