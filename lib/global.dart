import 'package:flutter/cupertino.dart';
import 'package:uleaning_app_bloc/common/service/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform
    );
    storageService = await StorageService().init();
  }
}