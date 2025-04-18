import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_chapters/fetch_chapters_state.dart';
import 'package:mdcat_kawiish/data/models/chapters_for_subjects_model_teacher.dart';

class FetchChaptersBloc extends Bloc<FetchChaptersEvent, FetchChaptersState> {
  FetchChaptersBloc() : super(FetchChaptersState()) {
    on<FetchedChaptersForTeacherApi>(_fetchChaptersForTeacher);

    on<FetchedChaptersForStudentApi>(_fetchChaptersForStudent);
  }

  final TeacherRepos _teacherRepo = TeacherRepos();
  final StudentRepos _studentRepo = StudentRepos();

  void _fetchChaptersForTeacher(FetchedChaptersForTeacherApi event,
      Emitter<FetchChaptersState> emit) async {
    emit(
      state.copyWith(
        loaingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response =
          await _teacherRepo.fetchChapterForSubject(event.subjectId);
      final modelresponse = ChaptersForSubjectTeacherModel.fromJson(response);
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.success,
          chaptersForSubjectTeacherModel: modelresponse,
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

  void _fetchChaptersForStudent(FetchedChaptersForStudentApi event,
      Emitter<FetchChaptersState> emit) async {
    emit(
      state.copyWith(
        loaingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response =
          await _studentRepo.fetchChapterForSubject(event.subjectId);
      final modelresponse = ChaptersForSubjectTeacherModel.fromJson(response);
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.success,
          chaptersForSubjectTeacherModel: modelresponse,
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
