import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/global.dart';
import 'package:uleaning_app_bloc/pages/application/application_page.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_blocs.dart';
import 'package:uleaning_app_bloc/pages/course/bloc/course_detail_blocs.dart';
import 'package:uleaning_app_bloc/pages/course/course_detail.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/home_page.dart';
import 'package:uleaning_app_bloc/pages/profile/profile.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/settings_page.dart';
import 'package:uleaning_app_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:uleaning_app_bloc/pages/sign_in/sign_in.dart';
import 'package:uleaning_app_bloc/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:uleaning_app_bloc/pages/sign_up/sign_up.dart';
import 'package:uleaning_app_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:uleaning_app_bloc/pages/welcome/welcome.dart';

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}

class AppPages{
  // create list PageEntity => quan ly cac bloc,page 1 cach tap chung
  static List<PageEntity> routes(){
    return[
      PageEntity(
          route: AppRoutes.INITIAL,
          page:  const Welcome(),
          bloc: BlocProvider(create: (_)=>WelcomeBloc())
      ),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignInPage(),
          bloc: BlocProvider(create: (_)=>SignInBloc())
      ),
      PageEntity(
          route: AppRoutes.SIGN_UP,
          page: const SignUpPage(),
          bloc: BlocProvider(create: (_)=>SignUpBloc())
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_)=>AppBlocs())
      ),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_)=>HomePageBlocs())
      ),
      PageEntity(
          route: AppRoutes.PROFILE_PAGE,
          page: const ProfilePage(),
          bloc: BlocProvider(create: (_)=>HomePageBlocs())
      ),
      PageEntity(
          route: AppRoutes.SETTINGS_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(create: (_)=>SettingsBlocs())
      ),
      PageEntity(
          route: AppRoutes.COURSE_DETAIL_PAGE,
          page: const CourseDetail(),
          bloc: BlocProvider(create: (_)=>CourseDetailBlocs())
      )
    ];
  }

  // return all blocproviders => co the lay cac bloc tu cac PageEntity
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];// de dynamic la co y nghia
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.INITIAL && deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_)=>const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_)=>const Welcome(), settings: settings);
  }
}