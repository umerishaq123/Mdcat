import 'package:image_picker/image_picker.dart';
import 'package:mdcat_kawiish/all_imports.dart';
import 'package:mdcat_kawiish/data/models/general_response_Model.dart';

class AccadmeyCreateStudentBloc
    extends Bloc<AccadmeyCreateStudentEvent, AccadmeyCreateStudentState> {
  late SignupApiforStudent data;
  final ImagePickerUtils imagePickerUtils;
  AccadmeyCreateStudentBloc(this.imagePickerUtils)
      : super(const AccadmeyCreateStudentState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
    on<NameChange>(_nameChange);
    on<EmailChange>(_emailChange);
    on<PasswordChange>(_passwordChange);
    on<PhonenumChange>(_phoneChange);
    on<Gradechange>(_gradeChange);
    on<Genderchange>(_genderChange);
    on<ChooseSubjectEvent>(_toggleSubject);
    on<SignupApiforStudent>(_signupAPIforstudent);
  }

  void _toggleSubject(
      ChooseSubjectEvent event, Emitter<AccadmeyCreateStudentState> emit) {
    final selectedSubjects = Map<String, bool>.from(state.selectedSubjects);
    selectedSubjects[event.subject] =
        !(selectedSubjects[event.subject] ?? false);
    emit(state.copyWith(selectedSubjects: selectedSubjects));
  }

  void _cameraCapture(
      CameraCapture event, Emitter<AccadmeyCreateStudentState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      GalleryPicker event, Emitter<AccadmeyCreateStudentState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();

    emit(state.copyWith(file: file));
  }

  void _nameChange(NameChange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _emailChange(
      EmailChange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChange(
      PasswordChange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _phoneChange(
      PhonenumChange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(phonenumber: event.phonenumber));
  }

  void _gradeChange(
      Gradechange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(grades: event.selectgrades));
  }

  void _genderChange(
      Genderchange event, Emitter<AccadmeyCreateStudentState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  final AcademyRepo _myRepo = AcademyRepo();

  void _signupAPIforstudent(SignupApiforStudent event,
      Emitter<AccadmeyCreateStudentState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoadingStatus.loading,
      ),
    );
    Map<String, String> imagepath = {'profilePic': state.file!.path};
    final List<String> selectedSubjects = state.selectedSubjects.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    Map<String, dynamic> data = {
      'email': state.email,
      'password': state.password,
      'name': state.name,
      'grade': state.grades,
      'role': 'Student',
      'phone': state.phonenumber,
      'subjects': selectedSubjects,
      'gender': state.gender
    };

    try {
      final response = await _myRepo.signupApiforStudent(data, imagepath);
      final modelresponse = GeneralResponseModel.fromJson(response);

      if (modelresponse.success == true) {
        emit(state.copyWith(
          loginStatus: LoadingStatus.success,
          message: modelresponse.message.toString(),
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoadingStatus.error,
          message: modelresponse.message.toString(),
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
