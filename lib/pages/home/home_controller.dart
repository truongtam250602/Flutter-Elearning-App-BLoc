import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/common/apis/course_api.dart';
import 'package:uleaning_app_bloc/common/entities/entities.dart';
import 'package:uleaning_app_bloc/global.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_events.dart';

class HomeController{
  final BuildContext context;
  HomeController({required this.context});
  UserItem userProfile = Global.storageService.getUserProfile();

  Future<void> init() async {
    var result = await CourseAPI.courseList();
    if(result.code==200){
      context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
    }
    else{
      print(result.code);
    }
  }
}