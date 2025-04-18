import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_students_model.dart';

class FetchAllStudentState extends Equatable {
  final LoadingStatus fetchAllStudentStatus;
  final FetchAllStudentsModel fetchAllStudentsModel;
  final String message;

  FetchAllStudentState({
    this.fetchAllStudentStatus = LoadingStatus.initial,
    this.message = '',
    FetchAllStudentsModel? fetchAllStudentsModel,
  }) : fetchAllStudentsModel = fetchAllStudentsModel ?? FetchAllStudentsModel();

  FetchAllStudentState copyWith({
    LoadingStatus? fetchAllStudentStatus,
    FetchAllStudentsModel? fetchAllStudentsModel,
    String? message,
  }) {
    return FetchAllStudentState(
      fetchAllStudentsModel:
          fetchAllStudentsModel ?? this.fetchAllStudentsModel,
      fetchAllStudentStatus:
          fetchAllStudentStatus ?? this.fetchAllStudentStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props =>
      [fetchAllStudentStatus, fetchAllStudentsModel, message];
}
