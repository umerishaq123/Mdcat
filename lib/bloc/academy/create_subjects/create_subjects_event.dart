import 'package:equatable/equatable.dart';

abstract class SubjectCreateEvent extends Equatable {
  const SubjectCreateEvent();

  @override
  List<Object?> get props => [];
}

class CreateSubjects extends SubjectCreateEvent {
  final Map<String, dynamic> data;
  const CreateSubjects(this.data);
  @override
  List<Object?> get props => [data];
}
