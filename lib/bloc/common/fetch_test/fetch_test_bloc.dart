import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_test/fetch_test_event.dart';
import 'package:mdcat_kawiish/bloc/common/fetch_test/fetch_test_state.dart';
import 'package:mdcat_kawiish/data/models/fetch_test_model.dart';

class FetchTestBloc extends Bloc<FetchTestEvent, FetchTestState> {
  FetchTestBloc() : super(FetchTestState()) {
    on<FetchedTestForTeacherApi>(_fetchTestforTeacher);
    on<FetchedTestForStudentApi>(_fetchTestForStudent);
  }

  final TeacherRepos _teacherRepo = TeacherRepos();
  final StudentRepos _studentRepo = StudentRepos();

  void _fetchTestforTeacher(
      FetchedTestForTeacherApi event, Emitter<FetchTestState> emit) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    try {
      final response = await _teacherRepo.fetchTest(event.chapterId);
      final modelresponse = FetchChapterTestModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              loadingStatus: LoadingStatus.success,
              fetchChapterTestModel: modelresponse,
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

  void _fetchTestForStudent(
      FetchedTestForStudentApi event, Emitter<FetchTestState> emit) async {
    emit(
      state.copyWith(loadingStatus: LoadingStatus.loading),
    );

    try {
      final response = await _studentRepo.fetchTest(event.chapterId);
      final modelresponse = FetchChapterTestModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              loadingStatus: LoadingStatus.success,
              fetchChapterTestModel: modelresponse,
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
