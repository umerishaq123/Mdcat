import 'package:equatable/equatable.dart';

abstract class FetchChaptersEvent extends Equatable {
  const FetchChaptersEvent();

  @override
  List<Object?> get props => [];
}

class FetchedChaptersForTeacherApi extends FetchChaptersEvent {
  final String subjectId;
  const FetchedChaptersForTeacherApi(this.subjectId);

  @override
  List<Object?> get props => [subjectId];
}

class FetchedChaptersForStudentApi extends FetchChaptersEvent {
  final String subjectId;
  const FetchedChaptersForStudentApi(this.subjectId);

  @override
  List<Object?> get props => [subjectId];
}
