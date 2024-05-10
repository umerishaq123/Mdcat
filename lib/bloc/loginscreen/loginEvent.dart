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
