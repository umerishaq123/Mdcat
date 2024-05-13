import 'package:equatable/equatable.dart';

abstract class loginevent extends Equatable {
  loginevent();
  @override
  List<Object?> get props => [];

 
}

class selectrole extends loginevent {
  final List<String> roles;
  selectrole({required this.roles});

  @override
  List<Object?> get props => [roles];
}
class Emailchange extends loginevent {
  final String email;
  Emailchange({required this.email});

  @override
  List<Object?> get props => [email];
}
class PasswordChange extends loginevent {
  final String password;
  PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}
