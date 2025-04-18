import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class AccadmeyCreateStudentState extends Equatable {
  final XFile? file;

  final String name;
  final String email;
  final String password;
  final String phonenumber;
  final String grades;
  final Map<String, bool> selectedSubjects;
  final String gender;
  final String message;
  final LoadingStatus loginStatus;

  const AccadmeyCreateStudentState(
      {this.file,
      this.name = '',
      this.email = '',
      this.password = '',
      this.phonenumber = '',
      this.grades = '',
      this.selectedSubjects = const {},
      this.gender = '',
      this.message = '',
      this.loginStatus = LoadingStatus.initial});

  AccadmeyCreateStudentState copyWith({
    XFile? file,
    final String? name,
    String? email,
    String? password,
    String? phonenumber,
    String? grades,
    Map<String, bool>? selectedSubjects,
    String? gender,
    String? message,
    LoadingStatus? loginStatus,
  }) {
    return AccadmeyCreateStudentState(
        file: file ?? this.file,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phonenumber: phonenumber ?? this.phonenumber,
        grades: grades ?? this.grades,
        selectedSubjects: selectedSubjects ?? this.selectedSubjects,
        gender: gender ?? this.gender,
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [
        file,
        name,
        email,
        password,
        phonenumber,
        grades,
        selectedSubjects,
        gender,
        message,
        loginStatus
      ];
}
