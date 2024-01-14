import 'package:flutter/material.dart';
import 'package:uleaning_app_bloc/pages/profile/profile_widgets/profile_widgets.dart';

import '../../common/entities/user.dart';
import '../../global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserItem userProfile = Global.storageService.getUserProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarProfile(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileEditAvatar(userProfile.avatar!),
              settingView(context),
            ],
          ),
        ),
      ),
    );
  }
}
