import 'package:equatable/equatable.dart';

abstract class FetchTopicsEvent extends Equatable {
  const FetchTopicsEvent();

  @override
  List<Object?> get props => [];
}

class FetchedTopicsForTeacherApi extends FetchTopicsEvent {
  final String chapterId;
  const FetchedTopicsForTeacherApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}

class FetchedTopicsForStudentApi extends FetchTopicsEvent {
  final String chapterId;
  const FetchedTopicsForStudentApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}
