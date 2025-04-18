import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_topics/fetch_topics_state.dart';
import 'package:mdcat_kawiish/data/models/topics_for_teacher_model.dart';

class FetchTopicsBloc
    extends Bloc<FetchTopicsEvent, FetchTopicsState> {
  FetchTopicsBloc() : super(FetchTopicsState()) {
    on<FetchedTopicsForTeacherApi>(_fetchChaptersForTeacher);
    on<FetchedTopicsForStudentApi>(_fetchChaptersForStudent);
  }

  final TeacherRepos _teacherRepo = TeacherRepos();
  final StudentRepos _studentRepo = StudentRepos();

  void _fetchChaptersForTeacher(
      FetchedTopicsForTeacherApi event, Emitter<FetchTopicsState> emit) async {
    emit(
      state.copyWith(
        loaingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response =
          await _teacherRepo.fetchTopicsForChapter(event.chapterId);
      final modelresponse = TopicsModel.fromJson(response);
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.success,
          topicsForTeacherModel: modelresponse,
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

  void _fetchChaptersForStudent(
      FetchedTopicsForStudentApi event, Emitter<FetchTopicsState> emit) async {
    emit(
      state.copyWith(
        loaingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response =
          await _studentRepo.fetchTopicsForChapter(event.chapterId);
      final modelresponse = TopicsModel.fromJson(response);
      emit(
        state.copyWith(
          loaingStatus: LoadingStatus.success,
          topicsForTeacherModel: modelresponse,
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
