import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_student_model.dart';

class FetchMySubjectsForStudentState extends Equatable {
  final String message;

  final LoadingStatus loadingStatus;

  final ListOfMySubjectsForStudentModel listOfMySubjectsForStudentModel;

  FetchMySubjectsForStudentState({
    this.message = '',
    this.loadingStatus = LoadingStatus.initial,
    ListOfMySubjectsForStudentModel? listOfMySubjectsForStudentModel,
  }) : listOfMySubjectsForStudentModel = listOfMySubjectsForStudentModel ??
            ListOfMySubjectsForStudentModel();

  FetchMySubjectsForStudentState copyWith({
    String? message,
    LoadingStatus? loadingStatus,
    ListOfMySubjectsForStudentModel? listOfMySubjectsForStudentModel,
  }) {
    return FetchMySubjectsForStudentState(
      message: message ?? this.message,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      listOfMySubjectsForStudentModel: listOfMySubjectsForStudentModel ??
          this.listOfMySubjectsForStudentModel,
    );
  }

  @override
  List<Object> get props =>
      [loadingStatus, listOfMySubjectsForStudentModel, message];
}
