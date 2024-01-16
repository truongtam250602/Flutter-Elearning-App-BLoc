import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/common/apis/course_api.dart';
import 'package:uleaning_app_bloc/common/entities/entities.dart';
import 'package:uleaning_app_bloc/global.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_events.dart';

class HomeController{
  late BuildContext context;
  static final HomeController _singleton =  HomeController._internal();
  HomeController._internal();
  // this is a factory constructor
  // makes sure you have the original only one instance
  factory HomeController({required BuildContext context}){
    _singleton.context = context;
    return _singleton;
  }

  UserItem get userProfile => Global.storageService.getUserProfile();

  Future<void> init() async {
    //make sure that user is logged in and then make an api call
    if(Global.storageService.getUserToken().isNotEmpty){
      var result = await CourseAPI.courseList();
      if(result.code==200){
        if(context.mounted){
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      }
      else{
        print(result.code);
      }
    }
    else{
      print("User has already logged out");
    }
  }
}