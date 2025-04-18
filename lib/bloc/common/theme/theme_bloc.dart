import 'package:bloc/bloc.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/theme/theme_event.dart';
import 'package:mdcat_kawiish/bloc/common/theme/theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // final PreferencesHelper preferencesHelper;

  ThemeBloc() : super(const ThemeState()) {
    on<ToggleTheme>(_toggleTheme);
    on<SetSystemMode>(_setSystemMode);

    _loadThemeFromPreferences();
  }
  SessionHandling _sessionHandling=SessionHandling();

  void _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    final newTheme = state.themeMode == ThemeModeEnum.light
        ? ThemeModeEnum.dark
        : ThemeModeEnum.light;
    emit(state.copyWith(themeMode: newTheme));
    _sessionHandling.saveThemeMode(newTheme);
  }

  void _setSystemMode(SetSystemMode event, Emitter<ThemeState> emit) {
    emit(state.copyWith(themeMode: ThemeModeEnum.system));
    _sessionHandling.saveThemeMode(ThemeModeEnum.system);
  }

  Future<void> _loadThemeFromPreferences() async {
    final themeMode = await _sessionHandling.loadThemeMode();
    emit(state.copyWith(themeMode: themeMode));
  }
}
