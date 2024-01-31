import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/entities/course.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/common/widgets/base_text_widget.dart';

import '../../../common/values/constant.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    shadowColor: Colors.transparent,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(fontSize: 14.sp, color: AppColors.primaryElement),
    title: const Text(
      "Course detail",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    ),
    leading: const BackButton(color: Colors.black),
  );
}

Widget imageCourse() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/icons/Image(1).png"))),
  );
}

Widget listButtons() {
  return Row(
    children: [
      Container(
        width: 80.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Text(
              "Author Page",
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 20.w,
      ),
      _iconItemMenu("assets/icons/people.png", 0),
      SizedBox(
        width: 20.w,
      ),
      _iconItemMenu("assets/icons/star.png", 5),
    ],
  );
}

Widget _iconItemMenu(String image, int num) {
  return Row(
    children: [
      Container(
        height: 30.h,
        width: 30.w,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        child: GestureDetector(
          onTap: () {},
        ),
      ),
      Text(
        "$num",
        style: const TextStyle(color: AppColors.primarySecondaryElementText),
      )
    ],
  );
}

Widget textCourseDescription(String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Course Description",
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 15.h,
      ),
      Text(
        description,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: AppColors.primaryThreeElementText,
        ),
      )
    ],
  );
}

Widget buttonGoBuy() {
  return Container(
    width: 325.w,
    height: 40.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(8.w)),
    child: GestureDetector(
      onTap: () {},
      child: Center(
        child: Text(
          "Go Buy",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryElementText),
        ),
      ),
    ),
  );
}

Widget courseSummary() {
  return reusableText("The Course Includes", fontSize: 12);
}

var imagesInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Download Resources": "download_detail.png"
};
// setting section view
Widget courseIncludes(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 15.w),
    child: Column(
      children: [
        ...List.generate(
            imagesInfo.length,
            (index) => GestureDetector(
                  onTap: () {
                    print(imagesInfo.keys.elementAt(index));
                  },
                  child: Container(
                    width: 350.w,
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.h,
                          child: Image.asset(
                              "assets/icons/${imagesInfo.values.elementAt(index)}"),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          imagesInfo.keys.elementAt(index),
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primarySecondaryElementText),
                        )
                      ],
                    ),
                  ),
                ))
      ],
    ),
  );
}
