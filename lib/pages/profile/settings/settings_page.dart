import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/global.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_blocs.dart';
import 'package:uleaning_app_bloc/pages/application/bloc/app_events.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_blocs.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_events.dart';
import 'package:uleaning_app_bloc/pages/profile/settings/bloc/settings_states.dart';

import 'bloc/settings_blocs.dart';
import '../settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsSates>(
          builder: (context, state){
            return Column(
              children: [
                settingsButton(context),
              ],
            );
          }
        ),
      )
    );
  }
}

Widget settingsButton(BuildContext context){
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Confirm logout"),
          content: const Text("Do you want to confirm logout?"),
          actions: [
            TextButton(onPressed: (){Navigator.of(context).pop();},
                child: const Text("Cancel")),
            TextButton(onPressed: (){
              // đoạn này trên youtube họ tách ra hẳn 1 hàm riêng
              context.read<AppBlocs>().add(const TriggerAppEvent(0));
              context.read<HomePageBlocs>().add(const HomePageDots(0));
              // set lai man hinh sau khi dang xuat
              Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
              Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
            },
                child: const Text("Confirm"))
          ],
        );
      });
    },
    child: Container(
      height: 60.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icons/Logout.png"),
              fit: BoxFit.fitHeight
          )
      ),
    ),
  );
}
