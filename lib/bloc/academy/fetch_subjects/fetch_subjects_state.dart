import 'package:equatable/equatable.dart';
import 'package:mdcat_kawiish/core/utilis/enums.dart';
import 'package:mdcat_kawiish/data/models/all_subects_model.dart';
import 'package:mdcat_kawiish/data/models/get_student_by_subject.Model.dart';

class FetchSubjectState extends Equatable {
  final LoadingStatus loadingStatus;
  final AllSubjects fetchAllSubjectModel;
  final String message;
  final Getstudentbysubject fetchAllStudentBySubject;
  FetchSubjectState({
    this.loadingStatus = LoadingStatus.initial,
    this.message = '',
    AllSubjects? fetchAllSubjectModel,
    Getstudentbysubject? fetchAllStudentBySubject,
  })  : fetchAllSubjectModel = fetchAllSubjectModel ?? AllSubjects(),
        fetchAllStudentBySubject =
            fetchAllStudentBySubject ?? Getstudentbysubject();

  FetchSubjectState copyWith({
    LoadingStatus? loadingStatus,
    AllSubjects? fetchAllSubjectModel,
    String? message,
    Getstudentbysubject? fetchAllStudentBySubject,
  }) {
    return FetchSubjectState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      fetchAllSubjectModel: fetchAllSubjectModel ?? this.fetchAllSubjectModel,
      message: message ?? this.message,
      fetchAllStudentBySubject:
          fetchAllStudentBySubject ?? this.fetchAllStudentBySubject,
    );
  }

  @override
  List<Object?> get props => [
        loadingStatus,
        fetchAllSubjectModel,
        message,
        fetchAllStudentBySubject,
      ];
}
