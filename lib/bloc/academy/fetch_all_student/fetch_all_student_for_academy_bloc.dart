import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_students_model.dart';

class FetchAllStudentsForAcademyBloc
    extends Bloc<FetchAllStudentForAcademyEvent, FetchAllStudentState> {
  FetchAllStudentsForAcademyBloc() : super(FetchAllStudentState()) {
    on<FetchedAllStudentsForAcademyApi>(_fetchAllStduentsApiForAccadmey);
  }

  final AcademyRepo _academyRepo = AcademyRepo();

  void _fetchAllStduentsApiForAccadmey(FetchedAllStudentsForAcademyApi event,
      Emitter<FetchAllStudentState> emit) async {
    emit(
      state.copyWith(
        fetchAllStudentStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _academyRepo.fetchAllStudent();
      final modelresponse = FetchAllStudentsModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
              fetchAllStudentStatus: LoadingStatus.success,
              fetchAllStudentsModel: modelresponse),
        );
      } else {
        emit(
          state.copyWith(
            fetchAllStudentStatus: LoadingStatus.error,
            message: 'Some thing went wrong try again after some time',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          fetchAllStudentStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
