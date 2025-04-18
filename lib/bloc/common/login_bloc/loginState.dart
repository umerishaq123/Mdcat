
import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class LoginState extends Equatable {
final String selectrole; // Teacher, Student , Academy
  final String email;
  final String password;
  final String message;
  final LoadingStatus loginStatus;
  final bool success;

  LoginState(
      {this.selectrole = '',
      this.email = '',
      this.password = '',
      this.message = '',
      this.loginStatus = LoadingStatus.initial,
      this.success=false});

  LoginState copyWith({
 String? selectrole,
    String? email,
    String? password,
    String? message,
    LoadingStatus? loginStatus,
     bool? success,
  }) {
    return LoginState(
      selectrole: selectrole ?? this.selectrole,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
      success: success?? this.success
    );
  }

  @override
  List<Object> get props => [selectrole, email, password, message, loginStatus,success];
}
