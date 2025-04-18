import 'package:equatable/equatable.dart';

enum ThemeModeEnum { light, dark, system }

class ThemeState extends Equatable {
  final ThemeModeEnum themeMode;

  const ThemeState({
    this.themeMode = ThemeModeEnum.system,
  });

  ThemeState copyWith({ThemeModeEnum? themeMode}) {
    return ThemeState(
        themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [themeMode];
}
