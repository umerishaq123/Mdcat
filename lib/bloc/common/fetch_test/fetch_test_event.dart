import 'package:equatable/equatable.dart';

abstract class FetchTestEvent extends Equatable {
  const FetchTestEvent();

  @override
  List<Object?> get props => [];
}

class FetchedTestForTeacherApi extends FetchTestEvent {
  final String chapterId;
  const FetchedTestForTeacherApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}

class FetchedTestForStudentApi extends FetchTestEvent {
  final String chapterId;
  const FetchedTestForStudentApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}
