import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/entities/entities.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/home_controller.dart';

import 'package:uleaning_app_bloc/pages/home/widgets/home_widgets.dart';

import 'bloc/home_page_states.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // late HomeController _homeController;
  late UserItem userProfile;
  @override
  void initState(){
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(userProfile.avatar.toString()),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state){
          // check if course list is empty then callback homecontroller init()
          if(state.courseItem.isEmpty){
            HomeController(context: context).init();
          }
          return Container(
            margin: EdgeInsets.only(right: 15.w, left: 17.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                      "Hello",
                      color: AppColors.primaryThreeElementText,
                      top: 20,
                      fontSize: 24
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                      userProfile.name!,
                      color: AppColors.primaryText,
                      fontSize: 16,
                      top: 0
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidesView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 1.6
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.courseItem.length,
                      (BuildContext context, int index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(
                              AppRoutes.COURSE_DETAIL_PAGE,
                              arguments: {
                                "item" : state.courseItem[index]
                              }
                            );
                          },
                          child: courseGridView(state.courseItem[index]),
                        );
                      }
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
