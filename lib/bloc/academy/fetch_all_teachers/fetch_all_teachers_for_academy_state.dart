import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_teacher_model.dart';

class FetchAllTeacherState extends Equatable {
  final LoadingStatus loadingStatus;

  final AllTeachersModel fetchAllTeachersModel;
  final String message;

  FetchAllTeacherState({
    this.loadingStatus = LoadingStatus.initial,
    this.message = '',
    AllTeachersModel? fetchAllTeachersModel,
  }) : fetchAllTeachersModel = fetchAllTeachersModel ?? AllTeachersModel();

  FetchAllTeacherState copyWith({
    LoadingStatus? loadingStatus,
    AllTeachersModel? fetchAllTeachersModel,
    String? message,
  }) {
    return FetchAllTeacherState(
      fetchAllTeachersModel:
          fetchAllTeachersModel ?? this.fetchAllTeachersModel,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [loadingStatus, fetchAllTeachersModel, message];
}
