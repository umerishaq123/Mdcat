import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class IsDarkOrLightMode extends ThemeEvent{}
