import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/general_response_Model.dart';

class CreateSubjectBloc extends Bloc<SubjectCreateEvent, CreateSubjectState> {
  CreateSubjectBloc() : super(const CreateSubjectState()) {
    on<CreateSubjects>(_createSubject);
  }

  final AcademyRepo _myRepo = AcademyRepo();

  void _createSubject(
      CreateSubjects event, Emitter<CreateSubjectState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _myRepo.createSubjects(event.data);
      final modelresponse = GeneralResponseModel.fromJson(response);
      if (modelresponse.success == true) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: state.message.toString(),
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message: modelresponse.message,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
