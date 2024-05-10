import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginEvent.dart';
import 'package:mdcat_kawiish/bloc/loginscreen/loginState.dart';

class loginBloc extends Bloc<loginevent,LoginState>{
loginBloc():super(LoginState()){
  on<selectrole>(_selectrole);
}
void _selectrole(loginevent event,Emitter<LoginState> emit){
 
  if (event is selectrole) {
       emit(state.copyWith(selectrole: event.roles ));
    }

}

}