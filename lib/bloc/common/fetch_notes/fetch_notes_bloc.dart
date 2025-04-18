import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_notes/fetch_notes_state.dart';

import 'package:mdcat_kawiish/data/models/list_of_chapter_notes_model.dart';

class FetchNotesBloc extends Bloc<FetchNotesEvent, FetchNotesState> {
  FetchNotesBloc() : super(FetchNotesState()) {
    on<FetchedNotesForTeacherApi>(_fetchNotesForChapter);
    on<FetchedNotesForStudentApi>(_fetchNotesForStudent);
  }

  final TeacherRepos _teacherRepo = TeacherRepos();
  final StudentRepos _studentRepo = StudentRepos();

  void _fetchNotesForChapter(
      FetchedNotesForTeacherApi event, Emitter<FetchNotesState> emit) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    try {
      final response = await _teacherRepo.notes(event.chapterId);
      final modelresponse = ListOfChapterNotesModels.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              loadingStatus: LoadingStatus.success,
              fetchNotesForTeacher: modelresponse,
              message: 'list is updated sucessfully'),
        );
      } else {
        emit(state.copyWith(
            loadingStatus: LoadingStatus.error, message: 'error found'));
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

  void _fetchNotesForStudent(
      FetchedNotesForStudentApi event, Emitter<FetchNotesState> emit) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    try {
      final response = await _studentRepo.fetchNotes(event.chapterId);
      final modelresponse = ListOfChapterNotesModels.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              loadingStatus: LoadingStatus.success,
              fetchNotesForTeacher: modelresponse,
              message: 'list is updated sucessfully'),
        );
      } else {
        emit(state.copyWith(
            loadingStatus: LoadingStatus.error, message: 'error found'));
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
