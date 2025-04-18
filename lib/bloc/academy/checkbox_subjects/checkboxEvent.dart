import 'package:equatable/equatable.dart';

abstract class SubjectSelectionEvent extends Equatable {
  const SubjectSelectionEvent();

  @override
  List<Object?> get props => [];
}

class ToggleSubjectEvent extends SubjectSelectionEvent {
  final String subject;

  const ToggleSubjectEvent(this.subject);

  @override
  List<Object?> get props => [subject];
}

class ResetSubjectsEvent extends SubjectSelectionEvent {}
