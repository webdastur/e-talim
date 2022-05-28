import 'package:bloc/bloc.dart';
import 'package:e_talim/core/models/course/course.dart';
import 'package:e_talim/core/services/http_service.dart';
import 'package:e_talim/core/services/store_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseState()) {
    on<CourseLoaded>(_onCourseLoaded);
  }

  Future<void> _onCourseLoaded(
    CourseLoaded event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    Course? course = await Modular.get<HttpService>().getCourses(
      Modular.get<StoreService>().token ?? "",
    );

    emit(state.copyWith(isLoading: false, course: course));
  }
}
