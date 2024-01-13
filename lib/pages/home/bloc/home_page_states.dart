import 'package:uleaning_app_bloc/common/entities/course.dart';

class HomePageStates{
  const HomePageStates({
    this.courseItem = const <CourseItem>[],
    this.index = 0
  });
  final List<CourseItem> courseItem;
  final int index;
  HomePageStates copyWith({int? index, List<CourseItem>? courseItem}){
    return HomePageStates(
      courseItem: courseItem??this.courseItem,
      index: index??this.index
    );
  }
}