import 'package:equatable/equatable.dart';

abstract class FetchSubjectsEvent extends Equatable {
  const FetchSubjectsEvent();

  @override
  List<Object?> get props => [];
}

class FetchedAllSubjectsApi extends FetchSubjectsEvent {}


class FetchedStudentsForSubjectApi extends FetchSubjectsEvent {
  String subjectid;
  FetchedStudentsForSubjectApi(this.subjectid);
   @override
  List<Object?> get props => [subjectid];
}
