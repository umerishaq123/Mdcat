import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/general_response_Model.dart';

class CreateTeacherBloc extends Bloc<CreateTeacherEvent, CreateTeacherState> {
  


  CreateTeacherBloc() : super(UserInitial()) {
    on<CreateUser>(_onCreateUser);
  }
final TeacherRepos _teacherRepos=TeacherRepos();
  void _onCreateUser(CreateUser event, Emitter<CreateTeacherState> emit) async {
    emit(UserLoading());
    try {
      final response =
          await _teacherRepos.signupforTeacher(event.data, event.imagePath);

      final signupResponse = GeneralResponseModel.fromJson(response);

      if (signupResponse.success == true) {
        final message = signupResponse.message;
        emit(UserSuccess(message: message));
      } else {
        emit(UserFailure(signupResponse.message));
      }
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
