import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_events.dart';
import 'package:uleaning_app_bloc/pages/home/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates>{
  HomePageBlocs():super(const HomePageStates()){
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit){
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(HomePageCourseItem event, Emitter<HomePageStates> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}

