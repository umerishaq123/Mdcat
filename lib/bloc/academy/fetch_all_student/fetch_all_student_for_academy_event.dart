import 'package:equatable/equatable.dart';

abstract class FetchAllStudentForAcademyEvent extends Equatable {
  const FetchAllStudentForAcademyEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllStudentsForAcademy extends FetchAllStudentForAcademyEvent {
  const FetchAllStudentsForAcademy();
}

class FetchedAllStudentsForAcademyApi extends FetchAllStudentForAcademyEvent {}
