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
