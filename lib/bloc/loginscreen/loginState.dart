import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  List<String> selectrole;
  LoginState( {this.selectrole=const []});
  
  LoginState copyWith({List<String>? selectrole}){
    return LoginState(selectrole: selectrole ?? this.selectrole);
  }
  
  @override
  List<Object?> get props => [selectrole];
}