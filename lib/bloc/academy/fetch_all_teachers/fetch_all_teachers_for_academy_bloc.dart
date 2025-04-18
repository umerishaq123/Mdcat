import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/all_teacher_model.dart';

class FetchAllTeachersForAcademyBloc
    extends Bloc<FetchAllTeacherForAcademyEvent, FetchAllTeacherState> {
  FetchAllTeachersForAcademyBloc() : super(FetchAllTeacherState()) {
    on<FetchedAllTeachersForAcademyApi>(_fetchAllStduentsApiForAccadmey);
  }

  final AcademyRepo _academyRepo = AcademyRepo();

  void _fetchAllStduentsApiForAccadmey(FetchedAllTeachersForAcademyApi event,
      Emitter<FetchAllTeacherState> emit) async {
    emit(
      state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _academyRepo.fetchAllTeachers();
      final modelresponse = AllTeachersModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(
          state.copyWith(
            loadingStatus: LoadingStatus.success,
            fetchAllTeachersModel: modelresponse
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
}
