import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/entities/course.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/pages/course/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;
  late var thumbnail;
  @override
  void initState(){
    super.initState();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    thumbnail = ModalRoute.of(context)!.settings.arguments as Map;
    print(thumbnail.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageCourse(),
                      SizedBox(height: 20.h,),
                      listButtons(),
                      SizedBox(height: 20.h),
                      textCourseDescription("Visual Identity The user interface (UI) is the point of human"
                          "computer interaction and communicate in a device. This"
                          "can include display screens, keyboards, a mouse and the appearance"
                          "of a desktop. It is also the way through which a user interacts with an"
                          "application or a website"),
                      SizedBox(height: 20.h,),
                      buttonGoBuy(),
                      SizedBox(height: 20.h),
                      courseSummary(),
                      SizedBox(height: 20.h),
                      courseIncludes(context),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}



