import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/topics_for_teacher_model.dart';

class FetchTopicsState extends Equatable {
  final String message;

  final LoadingStatus loaingStatus;

  final TopicsModel topicsForTeacherModel;

  FetchTopicsState({
    this.message = '',
    this.loaingStatus = LoadingStatus.initial,
    final TopicsModel? topicsForTeacherModel,
  })  : 
        topicsForTeacherModel =
            topicsForTeacherModel ?? TopicsModel();

  FetchTopicsState copyWith({
    String? message,
    LoadingStatus? loaingStatus,
    TopicsModel? topicsForTeacherModel,
  }) {
    return FetchTopicsState(
      message: message ?? this.message,
      loaingStatus: loaingStatus ?? this.loaingStatus,
      topicsForTeacherModel:
          topicsForTeacherModel ?? this.topicsForTeacherModel,
    );
  }

  @override
  List<Object> get props => [
        loaingStatus,
        topicsForTeacherModel,
        message
      ];
}
