import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/pages/application/application_widgets.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_blocs.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_events.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              body: Center(
                child: buildPage(state.index),
              ),
              bottomNavigationBar: Container(
                height: 52.h,
                width: 375.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.h),
                        topLeft: Radius.circular(20.h)
                    ),
                    boxShadow:[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1
                      )
                    ]
                ),
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (value){
                     context.read<AppBlocs>().add(TriggerAppEvent(value));
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                  items: buttonTabs,
                ),
              )
          ),
        ),
      );
    });
  }
}
