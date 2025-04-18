import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class SelectRole extends LoginEvent {
  final String roles;
  const SelectRole({required this.roles});

  @override
  List<Object?> get props => [roles];
}


class EmailChanged extends LoginEvent {
  const EmailChanged({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginApiForStudent extends LoginEvent {}
class LoginApiForTeacher extends LoginEvent{}
class LoginApiForAcadmy extends LoginEvent{}
class GotError extends LoginEvent{}
