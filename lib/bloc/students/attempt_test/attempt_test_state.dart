import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class AttemptTestState extends Equatable {
  final String message;
  final LoadingStatus loginStatus;

  const AttemptTestState(
      {this.message = '', this.loginStatus = LoadingStatus.initial});

  AttemptTestState copyWith({
    String? message,
    LoadingStatus? loginStatus,
  }) {
    return AttemptTestState(
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [message, loginStatus];
}
