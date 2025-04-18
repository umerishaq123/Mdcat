
import 'package:equatable/equatable.dart';

abstract class CreateTeacherState extends Equatable {
  const CreateTeacherState();
}

class UserInitial extends CreateTeacherState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends CreateTeacherState {
  @override
  List<Object?> get props => [];
}
class UserSuccess extends CreateTeacherState {
  final String message;

  const UserSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UserFailure extends CreateTeacherState {
  final String error;

  const UserFailure(this.error);

  @override
  List<Object?> get props => [error];
}