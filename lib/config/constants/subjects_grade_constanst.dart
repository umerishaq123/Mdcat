import 'package:mdcat_kawiish/all_imports.dart';

// create student,subject in admin
final List<String> listOfSubjectsConstant = [
  'Maths',
  'Biology',
  'Chemistry',
  'Physics'
];
final List<String> listOfGradesConstant = [
  '9th',
  '10th',
  '1st year',
  '2nd year'
];
List<String> listOfGendersConstant = [
  'Male',
  'Female',
  'others',
];
// list of created student for academy
List<SubjectInformation> subjectList = [
  SubjectInformation(icon: Icons.menu_book, name: 'Maths', subject: 'Maths'),
  SubjectInformation(
      icon: Icons.menu_book, name: 'Physics', subject: 'Physics'),
  SubjectInformation(
      icon: Icons.menu_book, name: 'Biology', subject: 'Biology'),
  SubjectInformation(
      icon: Icons.menu_book, name: 'Chemistry', subject: 'Chemistry')
];

// list of my subjects for student dashboard
Map<String, String> localSubjects = {
  'Maths': AssetPaths.mathimg,
  'Biology': AssetPaths.biologyimg,
  'Chemistry': AssetPaths.chemistryimg,
  'Physics': AssetPaths.physicsimg,
};

// check box bloc for academy
const Map<String, bool> initialSubjectSelectionState = {
  'Maths': false,
  'Biology': false,
  'Chemistry': false,
  'Physics': false,
};
// login widget
List<String> listOfRolesConstant = [
  'Teacher',
  'Student',
  'Acadmey',
];
