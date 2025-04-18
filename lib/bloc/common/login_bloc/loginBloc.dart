import '../../../all_imports.dart';
import 'loginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<SelectRole>(_selectrole);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApiForStudent>(_loginApiForStudent);
    on<LoginApiForTeacher>(_loginApiForTeacher);
    on<LoginApiForAcadmy>(_loginApiForAccadmey);
    on<GotError>(_gotError);
  }

  void _selectrole(SelectRole event, Emitter<LoginState> emit) {
    emit(state.copyWith(selectrole: event.roles));
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  final StudentRepos _studentRepo = StudentRepos();
  final TeacherRepos _teacherRepos = TeacherRepos();
  final AcademyRepo _academyRepo = AcademyRepo();

  void _loginApiForStudent(
      LoginApiForStudent event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await _studentRepo.loginApi(data);
      var msg = response['message'];
      var token = response['token'];
      // final modelresponse = loginFromJson(response);
      // if (modelresponse.success == true) {
      SessionHandling().saveStudentSignedInToken(token);
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.success,
          message: msg.toString(),
          // message: modelresponse.message.toString(),
        ),
      );
      // } else {
      // emit(
      //   state.copyWith(
      //     loginStatus: LoadingStatus.error,
      //     message: modelresponse.message.toString(),
      //   ),
      // );
      // }
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoadingStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  void _loginApiForTeacher(
      LoginApiForTeacher event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await _teacherRepos.loginApi(data);

      final modelresponse = LoginModel.fromJson(response);
      var msg = modelresponse.message;
      var token = response['token'];

      if (modelresponse.success == true) {
        SessionHandling().saveTeacherSignedInToken(token);

        Utils.toastMessage(modelresponse.message.toString());
        emit(
          state.copyWith(
              loginStatus: LoadingStatus.success, message: msg, success: true),
        );
      } else {
        emit(
          state.copyWith(
              loginStatus: LoadingStatus.error, message: msg, success: false),
        );
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

  void _loginApiForAccadmey(
      LoginApiForAcadmy event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await _academyRepo.loginApi(data);

      final modelresponse = LoginModel.fromJson(response);

      var token = response['token'];
      var msg = response['message'];

      if (modelresponse.success == true) {
        SessionHandling().saveAcademySignedInToken(token);
        emit(state.copyWith(message: msg));

        emit(
          state.copyWith(
            loginStatus: LoadingStatus.success,
            message: 'Login successful',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoadingStatus.error,
            message: 'login failed',
          ),
        );
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

  void _gotError(GotError event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.initial,
      ),
    );
  }
}
