import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginEvent.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<SelectRole>(_selectrole);
  }
  void _selectrole(LoginEvent event, Emitter<LoginState> emit) {
    if (event is SelectRole) {
      emit(state.copyWith(selectrole: event.roles));
    }
  }
}
