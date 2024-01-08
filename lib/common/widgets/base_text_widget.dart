
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaning_app_bloc/common/values/colors.dart';

Widget reusableText(String text,
  {
    Color color = AppColors.primaryText, int fontSize = 16, FontWeight fontWeight = FontWeight.normal
  })
{
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp
    ),
  );
}