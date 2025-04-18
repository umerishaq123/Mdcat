import 'package:equatable/equatable.dart';

abstract class FetchAllTeacherForAcademyEvent extends Equatable {
  const FetchAllTeacherForAcademyEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllTeachersForAcademy extends FetchAllTeacherForAcademyEvent {
  const FetchAllTeachersForAcademy();
}

class FetchedAllTeachersForAcademyApi extends FetchAllTeacherForAcademyEvent {}
