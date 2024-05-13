import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  List<String> selectrole;
  String email;
  String password;
  LoginState({this.selectrole = const [], this.email = '', this.password = ''});

  LoginState copyWith(
      {List<String>? selectrole, String? email, String? password}) {
    return LoginState(
        selectrole: selectrole ?? this.selectrole,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectrole,email,password];
}
