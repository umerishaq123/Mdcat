
import 'package:equatable/equatable.dart';

abstract class AttemptTestEvent extends Equatable {
  const AttemptTestEvent();

  @override
  List<Object?> get props => [];
}

class AttemptTestApi extends AttemptTestEvent {
  final Map<String, dynamic> data;
  const AttemptTestApi(this.data);
  @override
  List<Object?> get props => [data];
}
