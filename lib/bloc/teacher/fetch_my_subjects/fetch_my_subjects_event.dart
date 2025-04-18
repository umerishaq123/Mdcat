import 'package:equatable/equatable.dart';

abstract class FetchMySubjectsForTeacherEvent extends Equatable {
  const FetchMySubjectsForTeacherEvent();

  @override
  List<Object?> get props => [];
}

class FetchedMySubjectsForTeacherApi extends FetchMySubjectsForTeacherEvent {}


