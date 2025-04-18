import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/bloc/students/attempt_test/attempt_test_event.dart';
import 'package:mdcat_kawiish/data/models/general_response_Model.dart';
import 'attempt_test_state.dart';

class AttemptTestBloc extends Bloc<AttemptTestEvent, AttemptTestState> {
  AttemptTestBloc() : super(const AttemptTestState()) {
    on<AttemptTestApi>(_attemptTest);
  }

  final StudentRepos _myRepo = StudentRepos();

  void _attemptTest(
      AttemptTestApi event, Emitter<AttemptTestState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    try {
      final response = await _myRepo.attemptTest(event.data);
      final modelresponse = GeneralResponseModel.fromJson(response);
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: modelresponse.message.toString(),
        ));
     
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
