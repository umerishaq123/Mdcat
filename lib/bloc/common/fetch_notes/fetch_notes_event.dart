import 'package:equatable/equatable.dart';

abstract class FetchNotesEvent extends Equatable {
  const FetchNotesEvent();

  @override
  List<Object?> get props => [];
}

class FetchedNotesForTeacherApi extends FetchNotesEvent {
  final String chapterId;
  const FetchedNotesForTeacherApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}

class FetchedNotesForStudentApi extends FetchNotesEvent {
  final String chapterId;
  const FetchedNotesForStudentApi(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}
