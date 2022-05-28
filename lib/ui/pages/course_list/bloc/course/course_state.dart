part of 'course_bloc.dart';

class CourseState extends Equatable {
  final Course? course;
  final bool isLoading;

  const CourseState({
    this.course,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [course, isLoading];

  CourseState copyWith({
    Course? course,
    bool? isLoading,
  }) {
    return CourseState(
      course: course ?? this.course,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
