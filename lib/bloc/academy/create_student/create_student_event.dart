import 'package:equatable/equatable.dart';

abstract class AccadmeyCreateStudentEvent extends Equatable {
  const AccadmeyCreateStudentEvent();

  @override
  List<Object?> get props => [];
}

class CameraCapture extends AccadmeyCreateStudentEvent {}

class GalleryPicker extends AccadmeyCreateStudentEvent {}

class NameChange extends AccadmeyCreateStudentEvent {
  const NameChange({required this.name});
  final String name;
  @override
  List<Object> get props => [name];
}

class EmailChange extends AccadmeyCreateStudentEvent {
  const EmailChange({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChange extends AccadmeyCreateStudentEvent {
  final String password;
  const PasswordChange({required this.password});

  @override
  List<Object> get props => [password];
}

class PhonenumChange extends AccadmeyCreateStudentEvent {
  final String phonenumber;
  const PhonenumChange({required this.phonenumber});
  @override
  List<Object> get props => [phonenumber];
}

class Gradechange extends AccadmeyCreateStudentEvent {
  final String selectgrades;
  const Gradechange({required this.selectgrades});

  @override
  List<Object?> get props => [selectgrades];
}

class Genderchange extends AccadmeyCreateStudentEvent {
  final String gender;
  const Genderchange({required this.gender});
  @override
  List<Object> get props => [gender];
}

class ChooseSubjectEvent extends AccadmeyCreateStudentEvent {
  final String subject;

  const ChooseSubjectEvent(this.subject);

  @override
  List<Object?> get props => [subject];
}

class SignupApiforStudent extends AccadmeyCreateStudentEvent {}
