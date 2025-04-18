import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_teacher_model.dart';

class FetchMySubjectsForTeacherState extends Equatable {
  final String message;

  final LoadingStatus loaingStatus;

  final ListOfMySubjectsForTeacherModel listOfMySubjectsForTeacherModel;

  FetchMySubjectsForTeacherState({
    this.message = '',
    this.loaingStatus = LoadingStatus.initial,
    ListOfMySubjectsForTeacherModel? listOfMySubjectsForTeacherModel,
  }) : listOfMySubjectsForTeacherModel = listOfMySubjectsForTeacherModel ??
            ListOfMySubjectsForTeacherModel();

  FetchMySubjectsForTeacherState copyWith({
    String? message,
    LoadingStatus? loaingStatus,
    ListOfMySubjectsForTeacherModel? listOfMySubjectsForTeacherModel,
  }) {
    return FetchMySubjectsForTeacherState(
      message: message ?? this.message,
      loaingStatus: loaingStatus ?? this.loaingStatus,
      listOfMySubjectsForTeacherModel: listOfMySubjectsForTeacherModel ??
          this.listOfMySubjectsForTeacherModel,
    );
  }

  @override
  List<Object> get props =>
      [loaingStatus, listOfMySubjectsForTeacherModel, message];
}
