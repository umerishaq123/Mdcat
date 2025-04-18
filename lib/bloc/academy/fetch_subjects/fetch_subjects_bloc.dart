import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_subects_model.dart';
import 'package:mdcat_kawiish/data/models/get_student_by_subject.Model.dart';

class FetchAllSubjectForAcademyBloc
    extends Bloc<FetchSubjectsEvent, FetchSubjectState> {
  FetchAllSubjectForAcademyBloc() : super(FetchSubjectState()) {
    on<FetchedAllSubjectsApi>(_fetchAllSubjectApiForAccadmey);
    on<FetchedStudentsForSubjectApi>(_fetchAllStudentbysubjectapi);
  }
  final AcademyRepo _academyRepo = AcademyRepo();

  void _fetchAllSubjectApiForAccadmey(
      FetchedAllSubjectsApi event, Emitter<FetchSubjectState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    try {
      final response = await _academyRepo.listofallsubjects();
      final modelresponse = AllSubjects.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
            loadingStatus: LoadingStatus.success,
            fetchAllSubjectModel: modelresponse,
          ),
        );
      } else {
        emit(
          state.copyWith(
            loadingStatus: LoadingStatus.error,
            message: 'Some thing went wrong try again after some time',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  void _fetchAllStudentbysubjectapi(FetchedStudentsForSubjectApi event,
      Emitter<FetchSubjectState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    try {
      final response =
          await _academyRepo.listofstudentbysubject(event.subjectid);
      final modelresponse = Getstudentbysubject.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              // loaingStatus: LoadingStatus.success,
              // fetchAllTeachersModel: modelresponse
              loadingStatus: LoadingStatus.success,
              fetchAllStudentBySubject: modelresponse),
        );
      } else {
        emit(
          state.copyWith(
            loadingStatus: LoadingStatus.error,
            message: state.message,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
