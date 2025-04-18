import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/chapters_for_subjects_model_teacher.dart';

class FetchChaptersState extends Equatable {
  final String message;
  final LoadingStatus loaingStatus;
  final ChaptersForSubjectTeacherModel chaptersForSubjectTeacherModel;

  FetchChaptersState({
    this.message = '',
    this.loaingStatus = LoadingStatus.initial,
    final ChaptersForSubjectTeacherModel? chaptersForSubjectTeacherModel,
  }) : chaptersForSubjectTeacherModel =
            chaptersForSubjectTeacherModel ?? ChaptersForSubjectTeacherModel();

  FetchChaptersState copyWith({
    String? message,
    LoadingStatus? loaingStatus,
    ChaptersForSubjectTeacherModel? chaptersForSubjectTeacherModel,
  }) {
    return FetchChaptersState(
      message: message ?? this.message,
      loaingStatus: loaingStatus ?? this.loaingStatus,
      chaptersForSubjectTeacherModel:
          chaptersForSubjectTeacherModel ?? this.chaptersForSubjectTeacherModel,
    );
  }

  @override
  List<Object> get props =>
      [loaingStatus, chaptersForSubjectTeacherModel, message];
}
