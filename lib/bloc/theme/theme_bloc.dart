import 'package:bloc/bloc.dart';
import 'package:mdcat_kawiish/bloc/theme/theme_event.dart';
import 'package:mdcat_kawiish/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<IsDarkOrLightMode>(_turnOnOFf);
  }
  void _turnOnOFf(IsDarkOrLightMode event, Emitter<ThemeState> emit) {
    emit(state.copyWith(isDarkOrLight: !state.isDarkOrLight));
  }
}
                // BlocProvider.of<ThemeBloc>(context).add(IsDarkOrLightMode());
