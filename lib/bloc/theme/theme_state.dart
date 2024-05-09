import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDarkOrLight;

  const ThemeState({this.isDarkOrLight = true});

  ThemeState copyWith({bool? isDarkOrLight }){  
    return ThemeState(isDarkOrLight: isDarkOrLight??this.isDarkOrLight);
  }

  @override
  List<Object?> get props => [isDarkOrLight];
}
