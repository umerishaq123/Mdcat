import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/students/fetch_student_subjects/fetch_my_subjects_for_students_event.dart';
import 'package:mdcat_kawiish/bloc/students/fetch_student_subjects/fetch_my_subjects_for_students_state.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_student_model.dart';

class FetchMySubjectsForStudentBloc extends Bloc<FetchMySubjectsForStudentEvent,
    FetchMySubjectsForStudentState> {
  FetchMySubjectsForStudentBloc() : super(FetchMySubjectsForStudentState()) {
    on<FetchedMySubjectsForStudentApi>(_fetchAllSubjectsForStudent);
  }

  final StudentRepos _studentRepo = StudentRepos();

  void _fetchAllSubjectsForStudent(FetchedMySubjectsForStudentApi event,
      Emitter<FetchMySubjectsForStudentState> emit) async {
    emit(
      state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _studentRepo.fetchMySubjects();
      final modelresponse = ListOfMySubjectsForStudentModel.fromJson(response);
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.success,
          listOfMySubjectsForStudentModel: modelresponse,
        ),
      );
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
