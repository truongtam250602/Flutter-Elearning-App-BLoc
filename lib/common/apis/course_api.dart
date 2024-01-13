import 'package:uleaning_app_bloc/common/entities/course.dart';
import 'package:uleaning_app_bloc/common/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    return CourseListResponseEntity.fromJson(response);
  }
}