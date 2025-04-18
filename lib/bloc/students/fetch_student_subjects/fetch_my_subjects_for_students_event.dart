import 'package:equatable/equatable.dart';

abstract class FetchMySubjectsForStudentEvent extends Equatable {
  const FetchMySubjectsForStudentEvent();

  @override
  List<Object?> get props => [];
}

class FetchedMySubjectsForStudentApi extends FetchMySubjectsForStudentEvent {}


