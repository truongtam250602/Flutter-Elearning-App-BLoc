import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/routes/routes.dart';
import 'package:uleaning_app_bloc/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        //designSize: const Size(375, 812),
        // sử dụng để cài lại kích thước màn hình thiết kế nhưng ko cần sử dụng vì màn hình của Yuho TC đã đủ để tiếp tục thiết kế
        builder: (context, child)=> MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.GenerateRouteSettings,
        )
      )
    );
  }
}
