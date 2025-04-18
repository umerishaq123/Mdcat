import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class CreateChapState extends Equatable {
  final String message;
  final LoadingStatus loginStatus;

  const CreateChapState(
      {this.message = '', this.loginStatus = LoadingStatus.initial});

  CreateChapState copyWith({
    String? message,
    LoadingStatus? loginStatus,
  }) {
    return CreateChapState(
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [message, loginStatus];
}
