import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/teacher/fetch_my_subjects/fetch_my_subjects_event.dart';
import 'package:mdcat_kawiish/bloc/teacher/fetch_my_subjects/fetch_my_subjects_state.dart';
import 'package:mdcat_kawiish/data/models/list_of_subjects_for_teacher_model.dart';

class FetchMySubjectsForTeacherBloc extends Bloc<FetchMySubjectsForTeacherEvent,
    FetchMySubjectsForTeacherState> {
  FetchMySubjectsForTeacherBloc() : super(FetchMySubjectsForTeacherState()) {
    on<FetchedMySubjectsForTeacherApi>(_fetchAllSubjectsForTeacher);
  }

  final TeacherRepos _teacherRepo = TeacherRepos();

  void _fetchAllSubjectsForTeacher(FetchedMySubjectsForTeacherApi event,
      Emitter<FetchMySubjectsForTeacherState> emit) async {
    emit(
      state.copyWith(
        loaingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _teacherRepo.fetchMySubjects();
      final modelresponse = ListOfMySubjectsForTeacherModel.fromJson(response);
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.success,
          listOfMySubjectsForTeacherModel: modelresponse,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
