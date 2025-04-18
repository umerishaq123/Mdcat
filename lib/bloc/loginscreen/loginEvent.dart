import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];

 
}

class SelectRole extends LoginEvent {
  final List<String> roles;
  const SelectRole({required this.roles});

  @override
  List<Object?> get props => [roles];
}
class Emailchange extends LoginEvent {
  final String email;
  Emailchange({required this.email});

  @override
  List<Object?> get props => [email];
}
class PasswordChange extends LoginEvent {
  final String password;
  PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}
