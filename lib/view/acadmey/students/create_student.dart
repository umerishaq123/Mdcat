import 'package:mdcat_kawiish/view/acadmey/students/create_student_desktop.dart';
import 'package:mdcat_kawiish/view/acadmey/students/create_student_mobile.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class AccadmeyCreateStudent extends StatefulWidget {
  const AccadmeyCreateStudent({super.key});

  @override
  State<AccadmeyCreateStudent> createState() => _AccadmeyCreateStudentState();
}

class _AccadmeyCreateStudentState extends State<AccadmeyCreateStudent> {
  @override
  Widget build(BuildContext context) {
 
    return const Responsive(
        mobile: CreateStudentMobile(), tablet: CreateStudentMobile(), desktop: CreateStudentDesktop());
  }
}
