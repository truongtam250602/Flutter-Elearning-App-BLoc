import 'package:flutter/material.dart';
import 'package:uleaning_app_bloc/common/routes/names.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.PROFILE_PAGE, (route) => false),
    ),
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    automaticallyImplyLeading: true,
    centerTitle: true,
    title: const Text(
      "Settings",
      style: TextStyle(
        color: AppColors.primaryText
      ),
    ),
  );
}