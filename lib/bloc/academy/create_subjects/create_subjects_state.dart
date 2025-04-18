import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class CreateSubjectState extends Equatable {
  final String message;
  final LoadingStatus loginStatus;

  const CreateSubjectState(
      {this.message = '', this.loginStatus = LoadingStatus.initial});

  CreateSubjectState copyWith({
    String? message,
    LoadingStatus? loginStatus,
  }) {
    return CreateSubjectState(
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [message, loginStatus];
}
