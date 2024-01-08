import 'package:flutter/cupertino.dart';
import 'package:uleaning_app_bloc/common/entities/entities.dart';
import 'package:uleaning_app_bloc/global.dart';

class HomeController{
  final BuildContext context;
  HomeController({required this.context});
  UserItem userProfile = Global.storageService.getUserProfile();

  void init(){
    print('...home controller init method...');
  }
}